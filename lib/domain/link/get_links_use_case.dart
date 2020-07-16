import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/link_response.dart';

const PROMOTED = 'promoted';
const OBSERVED = 'observed';
const POPULAR = 'popular';
const UPCOMING = 'upcoming';

class GetLinksByActionUseCase {
  final ApiClient _client;
  final LinkResponseToLinkDtoMapper _linkDtoMapper;

  GetLinksByActionUseCase(this._client, this._linkDtoMapper);

  Future<List<LinkDto>> execute(int page, LinkActionType type, {String sortyBy}) async {
    var items = await _client.request('links', type.getApiValue(), named: {'page': page.toString(), 'sort': sortyBy ?? ""});
    return _client.deserializeList(LinkResponse.serializer, items).map(_linkDtoMapper.apply).toList();
  }
}

enum LinkActionType {
  PROMOTED, OBSERVED, POPULAR, UPCOMING
}

extension on LinkActionType {
  String getApiValue() {
    switch (this) {
      case LinkActionType.PROMOTED: return PROMOTED;
      case LinkActionType.OBSERVED: return OBSERVED;
      case LinkActionType.POPULAR: return POPULAR;
      case LinkActionType.UPCOMING: return UPCOMING;
      default:
        throw "not supported vote type";
    }
  }
}