import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/link_response.dart';

class GetProfileCommentedLinks {
  final ApiClient _client;
  final LinkResponseToLinkDtoMapper _mapper;

  GetProfileCommentedLinks(this._client, this._mapper);

  Future<List<LinkDto>> execute({int page = 1, @required String username}) async {
    var items = await _client.request('profiles', 'commented', api: [username], named: {'page': page.toString()});
    return _client.deserializeList(LinkResponse.serializer, items).map(_mapper.apply).toList();
  }
}
