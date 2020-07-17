import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class GetTagsSuggestion {
  final ApiClient _client;
  final TagSuggestionResponseToTagSuggestionDtoMapper _mapper;

  GetTagsSuggestion(this._client, this._mapper);

  Future<List<TagSuggestionDto>> execute(String q) async {
    var items = await _client.request('suggest', 'tags', api: [q]);
    return _client.deserializeList(TagSuggestionResponse.serializer, items).map(_mapper.apply).toList();
  }
}
