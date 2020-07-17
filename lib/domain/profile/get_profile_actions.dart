import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/entry_link_response.dart';

class GetProfileActions {
  final ApiClient _client;
  final EntryLinkResponseToEntryLinkDtoMapper _entryLinkDtoMapper;

  GetProfileActions(this._client, this._entryLinkDtoMapper);

  Future<List<EntryLinkDto>> execute({int page = 1, @required String username}) async {
    var items = await _client.request('profiles', 'actions', api: [username], named: {'page': page.toString()});
    return _client.deserializeList(EntryLinkResponse.serializer, items).map(_entryLinkDtoMapper.apply).toList();
  }
}
