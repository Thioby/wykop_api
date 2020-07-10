import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class EditEntryCommentUseCase {
  final ApiClient _client;
  final EntryCommentResponseToEntryCommentDtoMapper _commentDtoMapper;

  EditEntryCommentUseCase(this._client, this._commentDtoMapper);

  Future<EntryCommentDto> execute(int id, InputData data) async {
    var entry = await _client.request('entries', 'CommentEdit', api: [id.toString()], post: {'body': data.body}, image: data.file);
    return _commentDtoMapper.apply(
      _client.deserializeElement(EntryCommentResponse.serializer, entry),
    );
  }
}
