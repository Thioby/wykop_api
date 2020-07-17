import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class SearchIndex {
  final ApiClient _client;
  final EntryLinkResponseToEntryLinkDtoMapper _mapper;

  SearchIndex(this._client, this._mapper);

  Future<List<EntryLinkDto>> execute({int page = 1, @required String q}) async {
    var items = await _client.request('search', 'index', named: {'page': page.toString()}, post: {'q': q});
    return _client.deserializeList(EntryLinkResponse.serializer, items).map(_mapper.apply).toList();
  }
}
