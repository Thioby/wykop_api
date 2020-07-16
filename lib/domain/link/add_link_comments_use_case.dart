import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/link_comment_response.dart';

class AddLinkCommentUseCase {
  final ApiClient _client;
  final LinkCommentResponseToLinkCommentDtoMapper _commentDtoMapper;

  AddLinkCommentUseCase(this._client, this._commentDtoMapper);

  Future<LinkCommentDto> execute(int id, InputData data, {int commentId}) async {
    var linkComment = await _client.request('links', 'CommentAdd',
        post: {'body': data.body}, image: data.file, api: [id.toString(), commentId?.toString() ?? ""]);
    return _commentDtoMapper.apply(_client.deserializeElement(LinkCommentResponse.serializer, linkComment));
  }
}
