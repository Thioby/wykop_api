import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';

class EditEntryUseCase {
  final ApiClient _client;
  final EntryResponseToDtoMapper _entryResponseToDtoMapper;

  EditEntryUseCase(this._client, this._entryResponseToDtoMapper);

  Future<EntryDto> execute(int id, InputData data) async {
    var entry =
        await _client.request('entries', 'edit', api: [id.toString()], post: {'body': data.body}, image: data.file);
    return _entryResponseToDtoMapper.apply(_client.deserializeElement(EntryResponse.serializer, entry));
  }
}
