import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class GetSingleEntryUseCase {
  final ApiClient _client;
  final EntryResponseToDtoMapper _entryResponseToDtoMapper;

  GetSingleEntryUseCase(this._client, this._entryResponseToDtoMapper);

  Future<EntryDto> execute(int id) async {
    var items = await _client.request('entries', 'entry', api: [id.toString()]);
    return _entryResponseToDtoMapper.apply(
      _client.deserializeElement(EntryResponse.serializer, items),
    );
  }
}
