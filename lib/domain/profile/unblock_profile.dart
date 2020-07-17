import 'package:wykop_api/infrastucture/client.dart';

class UnblockProfile {
  final ApiClient _client;

  UnblockProfile(this._client);

  Future<bool> execute(String username) async {
    var items = await _client.request('profiles', 'unblock', api: [username]);
    return items["is_blocked"];
  }
}
