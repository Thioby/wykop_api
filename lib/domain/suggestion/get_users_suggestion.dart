import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class GetUsersSuggestion {
  final ApiClient _client;
  final AuthorSuggestionResponseToAuthorSuggestionDtoMapper _mapper;

  GetUsersSuggestion(this._client, this._mapper);

  Future<List<AuthorSuggestionDto>> execute(String q) async {
    var items = await _client.request('suggest', 'users', api: [q]);
    return _client.deserializeList(AuthorSuggestionResponse.serializer, items).map(_mapper.apply).toList();
  }
}
