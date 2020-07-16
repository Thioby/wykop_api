import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/link_comment_response.dart';

class EditLinkCommentUseCase {
  final ApiClient _client;
  final LinkCommentResponseToLinkCommentDtoMapper _commentDtoMapper;

  EditLinkCommentUseCase(this._client, this._commentDtoMapper);

  Future<LinkCommentDto> execute(int id, InputData data) async {
    var linkComment = await _client.request('links', 'CommentEdit', post: {'body': data.body}, image: data.file, api: [id.toString()]);
    return _commentDtoMapper.apply(_client.deserializeElement(LinkCommentResponse.serializer, linkComment));
  }
}
