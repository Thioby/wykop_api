import 'dart:async';
import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';

import 'package:built_value/serializer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wykop_api/domain/api_secrets_provider.dart';
import 'package:wykop_api/domain/secrets/api_secrets.dart';
import 'package:wykop_api/infrastucture/api.dart' as OWMAPI;
import 'package:wykop_api/infrastucture/data/AuthCredentials.dart';
import 'package:wykop_api/infrastucture/store/CredentialsStore.dart';
import 'package:wykop_api/utils/md5_generator.dart';

export 'response_models/author_response.dart';
export 'response_models/embed_response.dart';
export 'response_models/entry_comment_response.dart';
export 'response_models/entry_response.dart';
export 'response_models/serializers.dart';

/*
 * Handles request signing, retrying, deserializing, saving auth tokens,
 * logging in and all sort of things 
 */
class ApiClient extends http.BaseClient {
  final http.Client _httpClient;
  final CredentialsStore _credentialsStore;
  final ApiSecretsProvider _apiSecretsProvider;

  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    var toSign = _secrets.secret + request.url.toString();

    if (request is http.MultipartRequest) {
      toSign = _secrets.secret + request.url.toString() + request.fields.values.join(',');
    }

    debugPrint(toSign);
    request.headers['apisign'] = generateMd5(toSign);
    request.headers['User-Agent'] = 'OWMHYBRID';

    http.StreamedResponse response = await _httpClient.send(request);

    if (response != null && response.statusCode == 401) {
      var authResponse =
          await this.request('login', 'index', post: {'login': _credentials.login, 'accountkey': _credentials.token});

      var originalPath = request.url.toString();

      originalPath =
          originalPath.substring(0, originalPath.indexOf("/userkey/")) + "/userkey/" + authResponse["userkey"];
      debugPrint(originalPath);

      this._credentials.refreshToken = authResponse["userkey"];
      await _credentialsStore.saveCredentials(this._credentials);
      if (request is http.MultipartRequest) {
        var newRequest = http.MultipartRequest(request.method, Uri.parse(originalPath));
        request.fields.forEach((key, value) => newRequest.fields[key] = value);
        return await send(http.Request(request.method, Uri.parse(originalPath)));
      }
      return await send(http.Request(request.method, Uri.parse(originalPath)));
    }
    return response;
  }

  void close() => _httpClient.close();

  ApiSecrets _secrets;
  AuthCredentials _credentials;
  get secrets => _secrets;
  get credentials => _credentials;
  var checkedCreds = false;

  Future<void> syncCredsFromStorage() async {
    if (!checkedCreds) {
      try {
        this._credentials = await _credentialsStore.loadCredentials();
      } catch (e) {
        // Not logged in yet
      }
      this.checkedCreds = true;
    }
  }

  Future<void> logoutUser() async {
    await _credentialsStore.saveCredentials(AuthCredentials());
    this._credentials = await _credentialsStore.loadCredentials();
    this.checkedCreds = true;
  }

  void initialize() async {
    this._secrets = await _apiSecretsProvider.loadSecrets();
  }

  Future<dynamic> request(String endpoint, String resource,
      {List<String> api: const [],
      Map<String, String> named: const {},
      Map<String, String> post: const {'owm-get': 'yes'},
      bool returnFullResponse = false,
      File image}) async {
    if (this._secrets == null) {
      this._secrets = await _apiSecretsProvider.loadSecrets();
    }
    await this.syncCredsFromStorage();

    var path = '/' + endpoint + '/' + resource;
    if (api.isEmpty && named.isEmpty) {
      path += '/';
    }

    if (api.isNotEmpty) {
      path += '/';
    }

    path += api.join('/');

    if (api.isNotEmpty && named.isEmpty) {
      path += '/';
    }

    if (named.isNotEmpty) {
      path += '/';
    }

    named.forEach((key, value) {
      path += key + '/' + value + '/';
    });
    path += 'appkey/' + this._secrets.appkey;
    if (_credentials != null && _credentials.refreshToken != null) {
      path += '/userkey/' + _credentials.refreshToken;
    }

    http.Response response;
    if (post.containsKey('owm-get')) {
      response = await get("https://a2.wykop.pl" + path);
    } else {
      var multipartRequest = http.MultipartRequest("POST", Uri.parse("https://a2.wykop.pl" + path));
      post.forEach((key, value) => multipartRequest.fields[key] = value);
      if (image != null) {
        multipartRequest.files.add(await http.MultipartFile.fromPath("embed", image.path));
      }
      response = await http.Response.fromStream(await send(multipartRequest));
    }

    if (!returnFullResponse) {
      try {
        return json.decode(response.body)["data"];
      } catch (e) {
        //        OWMAPI.api.errorSink.add(e);
      }
    } else {
      try {
        return json.decode(response.body);
      } catch (e) {
        //        OWMAPI.api.errorSink.add(e);
      }
    }
  }

  List<T> deserializeList<T>(Serializer<T> serializer, map) {
    try {
      var list = List<dynamic>.from(map);
      return list.map((el) {
        return OWMAPI.serializers.deserializeWith(serializer, el);
      }).toList();
    } catch (e) {
      print(e.toString());
      //      OWMAPI.api.errorSink.add(e);
    }
  }

  T deserializeElement<T>(Serializer<T> serializer, map) {
    try {
      T item;
      item = OWMAPI.serializers.deserializeWith(serializer, (map));
      return item;
    } catch (e) {
      print(e);
      //      OWMAPI.api.errorSink.add(e);
    }
  }

  ApiClient._builder(ApiClientBuilder apiClientBuilder)
      : _httpClient = apiClientBuilder.httpClient,
        _apiSecretsProvider = apiClientBuilder.secretsProvider,
        _credentialsStore = apiClientBuilder.credentialsStore;

  void saveCredentials(AuthCredentials credentials) {
    _credentialsStore.saveCredentials(credentials);
    credentials = credentials;
  }
}

class ApiClientBuilder {
  http.Client httpClient;
  CredentialsStore credentialsStore;
  ApiSecretsProvider secretsProvider;

  void setCredentialsStore(CredentialsStore store) {
    this.credentialsStore = store;
  }

  void setHttpClient(http.Client client) {
    this.httpClient = client;
  }

  void setApiSecretsProvider(ApiSecretsProvider provider) {
    this.secretsProvider = provider;
  }

  ApiClient build() {
    validateApiClientBuilder(this);
    setDefaultElements(this);
    return ApiClient._builder(this);
  }
}

void validateApiClientBuilder(ApiClientBuilder builder) {
  if (builder.secretsProvider == null) {
    throw 'ApiSecretsLoader cannot be null';
  }
}

void setDefaultElements(ApiClientBuilder builder) {
  builder.httpClient ??= http.Client();
  builder.credentialsStore ??= DefaultCredentialsStore();
}
