import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/link_response.dart';

class GetSingleLinkUseCase {
  final ApiClient _client;
  final LinkResponseToLinkDtoMapper _linkMapper;

  GetSingleLinkUseCase(this._client, this._linkMapper);

  Future<LinkDto> execute(int id) async {
    var item = await _client.request('links', 'link', api: [id.toString()]);
    return _linkMapper.apply(_client.deserializeElement(LinkResponse.serializer, item));
  }
}
