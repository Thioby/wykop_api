import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/entry_link_response.dart';

class GetMyWykopIndexUseCase {
  final ApiClient _client;
  final EntryLinkResponseToEntryLinkDtoMapper _entryLinkDtoMapper;

  GetMyWykopIndexUseCase(this._client, this._entryLinkDtoMapper);

  Future<List<EntryLinkDto>> execute(int page) async {
    var items = await _client.request('mywykop', 'index', named: {'page': page.toString()});
    return _client.deserializeList(EntryLinkResponse.serializer, items).map(_entryLinkDtoMapper.apply).toList();
  }
}
