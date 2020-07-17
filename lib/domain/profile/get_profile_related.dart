import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class GetProfileRelated {
  final ApiClient _client;
  final ProfileRelatedResponseToRelatedDtoMapper _mapper;

  GetProfileRelated(this._client, this._mapper);

  Future<List<ProfileRelatedDto>> execute({int page = 1, @required String username}) async {
    var items = await _client.request('profiles', 'related', api: [username], named: {'page': page.toString()});
    return _client.deserializeList(ProfileRelatedResponse.serializer, items).map(_mapper.apply).toList();
  }
}
