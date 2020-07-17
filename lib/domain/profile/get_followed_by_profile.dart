import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/link_comment_response.dart';

class GetFollowedByProfile {
  final ApiClient _client;
  final LinkCommentResponseToLinkCommentDtoMapper _mapper;

  GetFollowedByProfile(this._client, this._mapper);

  Future<List<LinkCommentDto>> execute({int page = 1, @required String username}) async {
    var items = await _client.request('profiles', 'followed', api: [username], named: {'page': page.toString()});
    return _client.deserializeList(LinkCommentResponse.serializer, items).map(_mapper.apply).toList();
  }
}
