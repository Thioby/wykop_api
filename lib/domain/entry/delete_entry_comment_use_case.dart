import 'package:wykop_api/infrastucture/client.dart';

class DeleteEntryCommentUseCase {
  final ApiClient _client;

  DeleteEntryCommentUseCase(this._client);

  Future<bool> execute(int id) async {
    try {
      await _client.request('entries', 'commentdelete', api: [id.toString()]);
      return true;
    } catch (error) {
      return false;
    }
  }
}
