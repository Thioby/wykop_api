import 'package:wykop_api/infrastucture/client.dart';

class ObserveProfile {
  final ApiClient _client;

  ObserveProfile(this._client);

  Future<bool> execute(String username) async {
    var items = await _client.request('profiles', 'observe', api: [username]);
    return items["is_observed"];
  }
}
