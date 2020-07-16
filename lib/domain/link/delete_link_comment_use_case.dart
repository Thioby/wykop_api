import 'package:wykop_api/infrastucture/client.dart';

class DeleteLinkCommentUseCase {
  final ApiClient _client;

  DeleteLinkCommentUseCase(this._client);

  Future<bool> execute(int id) async {
    try {
      await _client.request('links', 'commentdelete', api: [id.toString()]);
      return true;
    } catch (error) {
      return false;
    }
  }
}
