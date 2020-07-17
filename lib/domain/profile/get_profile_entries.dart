import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class GetProfileEntries {
  final ApiClient _client;
  final EntryResponseToDtoMapper _mapper;

  GetProfileEntries(this._client, this._mapper);

  Future<List<EntryDto>> execute({int page = 1, @required String username}) async {
    var items = await _client.request('profiles', 'entries', api: [username], named: {'page': page.toString()});
    return _client.deserializeList(EntryResponse.serializer, items).map(_mapper.apply).toList();
  }
}
