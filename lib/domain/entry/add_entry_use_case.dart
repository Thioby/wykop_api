import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class AddEntryCommentUseCase {
  final ApiClient _client;
  final EntryCommentResponseToEntryCommentDtoMapper _commentDtoMapper;

  AddEntryCommentUseCase(this._client, this._commentDtoMapper);

  Future<EntryCommentDto> execute(int id, InputData data) async {
    var comment = await _client.request('entries', 'commentadd',
        api: [id.toString()], post: {'body': data.body}, image: data.file);

    return _commentDtoMapper.apply(_client.deserializeElement(EntryCommentResponse.serializer, comment));
  }
}
