import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class SearchLinks {
  final ApiClient _client;
  final LinkResponseToLinkDtoMapper _mapper;

  SearchLinks(this._client, this._mapper);

  Future<List<LinkDto>> execute({int page = 1, @required String q}) async {
    var items = await _client.request('search', 'links', named: {'page': page.toString()}, post: {'q': q});
    return _client.deserializeList(LinkResponse.serializer, items).map(_mapper.apply).toList();
  }
}
