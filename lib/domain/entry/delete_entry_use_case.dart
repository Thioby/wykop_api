import 'package:wykop_api/infrastucture/client.dart';

class DeleteEntryUseCase {
  final ApiClient _client;

  DeleteEntryUseCase(this._client);

  Future<bool> execute(int id) async {
    await _client.request('entries', 'delete', api: [id.toString()]);
  }
}
