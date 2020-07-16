import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/link_response.dart';

const WEEK = 'promoted';
const DAY = 'observed';
const YEAR = 'popular';
const MONTH = 'upcoming';

class GetHitLinksByPeriodUseCase {
  final ApiClient _client;
  final LinkResponseToLinkDtoMapper _linkDtoMapper;

  GetHitLinksByPeriodUseCase(this._client, this._linkDtoMapper);

  Future<List<LinkDto>> execute(int page, LinkHitsPeriod type, {String month, String year}) async {
    var items = await _client.request('hits', type.getApiValue(), named: {'page': page.toString()},);
    return _client.deserializeList(LinkResponse.serializer, items).map(_linkDtoMapper.apply).toList();
  }
}

enum LinkHitsPeriod {
  DAY, MONTH, YEAR, WEEK
}

extension on LinkHitsPeriod {
  String getApiValue() {
    switch (this) {
      case LinkHitsPeriod.WEEK: return WEEK;
      case LinkHitsPeriod.DAY: return DAY;
      case LinkHitsPeriod.YEAR: return YEAR;
      case LinkHitsPeriod.MONTH: return MONTH;
      default:
        throw "not supported vote type";
    }
  }
}