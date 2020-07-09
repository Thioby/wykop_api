import 'package:wykop_api/domain/entries/common.dart';
import 'package:wykop_api/domain/entries/entry_action_type.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/EntryDto.dart';

class EntriesActionsUseCase {
  final ApiClient _client;
  final EntryResponseToDtoMapper _entryResponseToDtoMapper;

  EntriesActionsUseCase(this._client, this._entryResponseToDtoMapper);

  Future<List<EntryDto>> execute({EntryActionsType type, params}) async {
    var items = await _client.request('entries', getActionNameByType(type), named: params);
    return _client.deserializeList(EntryResponse.serializer, items).map(_entryResponseToDtoMapper.apply).toList();
  }
}
