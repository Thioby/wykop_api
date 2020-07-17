import 'package:flutter/cupertino.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/ProfileDto.dart';

class GetProfile {
  final ApiClient _client;
  final ProfileResponseToProfileDtoMapper _mapper;

  GetProfile(this._client, this._mapper);

  Future<ProfileDto> execute(String username) async {
    var items = await _client.request('profiles', 'index', api: [username]);
    return _mapper.apply(_client.deserializeElement(ProfileResponse.serializer, items));
  }
}
