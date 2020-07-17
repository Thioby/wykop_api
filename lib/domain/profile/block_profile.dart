import 'package:wykop_api/infrastucture/client.dart';

class BlockProfile {
  final ApiClient _client;

  BlockProfile(this._client);

  Future<bool> execute(String username) async {
    var items = await _client.request('profiles', 'block', api: [username]);
    return items["is_blocked"];
  }
}
