import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/related_response.dart';

class GetRelatedLinkUseCase {
  final ApiClient _client;
  final RelatedResponseToRelatedDtoMapper _relatedDtoMapper;

  GetRelatedLinkUseCase(this._client, this._relatedDtoMapper);

  Future<List<RelatedDto>> execute(int id) async {
    var items = await _client.request('links', 'related', api: [id.toString()]);
    return _client.deserializeList(RelatedResponse.serializer, items).map(_relatedDtoMapper.apply).toList();
  }
}
