import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/link_comment_response.dart';

class GetLinkCommentsUseCase {
  final ApiClient _client;
  final LinkCommentResponseToLinkCommentDtoMapper _commentDtoMapper;

  GetLinkCommentsUseCase(this._client, this._commentDtoMapper);

  Future<List<LinkCommentDto>> execute(int id) async {
    var items = await _client.request('links', 'comments', api: [id.toString()]);
    return _client.deserializeList(LinkCommentResponse.serializer, items).map(_commentDtoMapper.apply).toList();
  }
}
