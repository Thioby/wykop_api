import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class AddEntryUseCase {
  final ApiClient _client;
  final EntryResponseToDtoMapper _entryResponseToDtoMapper;

  AddEntryUseCase(this._client, this._entryResponseToDtoMapper);

  Future<EntryDto> execute(InputData data) async {
    var entry = await _client.request('entries', 'add', post: {'body': data.body}, image: data.file);
    return _entryResponseToDtoMapper.apply(_client.deserializeElement(EntryResponse.serializer, entry));
  }
}
