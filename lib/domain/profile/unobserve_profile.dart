import 'package:wykop_api/infrastucture/client.dart';

class UnobserveProfile {
  final ApiClient _client;

  UnobserveProfile(this._client);

  Future<bool> execute(String username) async {
    var items = await _client.request('profiles', 'unobserve', api: [username]);
    return items["is_observed"];
  }
}
