import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/pm_message_response.dart';

class GetSimpleSingleConversationUseCase {
  final ApiClient _client;
  final PmMessageResponseToPmMessageDtoMapper _privateMessageMapper;

  GetSimpleSingleConversationUseCase(this._client, this._privateMessageMapper);

  Future<List<PmMessageDto>> execute(String receiver) async {
    var items = await _client.request('pm', 'conversation', api: [receiver], returnFullResponse: true);
    return _client.deserializeList(PmMessageResponse.serializer, items["data"]).map(_privateMessageMapper.apply).toList();
  }
}
