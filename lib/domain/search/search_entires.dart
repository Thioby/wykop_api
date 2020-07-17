import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class SearchEntries {
  final ApiClient _client;
  final EntryResponseToDtoMapper _mapper;

  SearchEntries(this._client, this._mapper);

  Future<List<EntryDto>> execute({int page = 1, @required String q}) async {
    var items = await _client.request('search', 'entries', named: {'page': page.toString()}, post: {'q': q});
    return _client.deserializeList(EntryResponse.serializer, items).map(_mapper.apply).toList();
  }
}
