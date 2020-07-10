import 'package:wykop_api/infrastucture/client.dart';

class VoteUpEntryUseCase {
  final ApiClient _client;

  VoteUpEntryUseCase(this._client);

  Future<bool> execute(int id) async {
    try {
      await _client.request('entries', 'delete', api: [id.toString()]);
      return true;
    } catch (error) {
      return false;
    }
  }
}
