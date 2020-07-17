import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class GetProfileCommentsForEntry {
  final ApiClient _client;
  final EntryCommentResponseToEntryCommentDtoMapper _mapper;

  GetProfileCommentsForEntry(this._client, this._mapper);

  Future<List<EntryCommentDto>> execute({int page = 1, @required String username}) async {
    var items = await _client.request('profiles', 'entriescomments', api: [username], named: {'page': page.toString()});
    return _client.deserializeList(EntryCommentResponse.serializer, items).map(_mapper.apply).toList();
  }
}
