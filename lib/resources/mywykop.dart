import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/data/model/EntryLinkDto.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/resources/resources.dart';
class MyWykopApi extends ApiResource {
  final EntryLinkResponseToEntryLinkDtoMapper _entryLinkDtoMapper;

  MyWykopApi(ApiClient client, this._entryLinkDtoMapper) : super(client);

  Future<List<EntryLinkDto>> getIndex(int page) async {
    var items = await client.request('mywykop', 'index', named: {'page': page.toString()});
    return deserializeEntryLinks(items);
  }

  Future<List<EntryLinkDto>> getTags(int page) async {
    var items = await client.request('mywykop', 'tags', named: {'page': page.toString()});
    return deserializeEntryLinks(items);
  }

  Future<List<EntryLinkDto>> getUsers(int page) async {
    var items = await client.request('mywykop', 'users', named: {'page': page.toString()});
    return deserializeEntryLinks(items);
  }

  List<EntryLinkDto> deserializeEntryLinks(dynamic items) {
    return client.deserializeList(EntryLinkResponse.serializer, items).map(_entryLinkDtoMapper.apply).toList();
  }
}
