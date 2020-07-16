import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/pm_message_response.dart';

class SendPrivateMessageUseCase {
  final ApiClient _client;
  final PmMessageResponseToPmMessageDtoMapper _privateMessageMapper;

  SendPrivateMessageUseCase(this._client, this._privateMessageMapper);

  Future<PmMessageDto> execute(String receiver, InputData data) async {
    var pm = await _client.request('pm', 'sendmessage', api: [receiver], post: {'body': data.body}, image: data.file);
    return _privateMessageMapper.apply(_client.deserializeElement(PmMessageResponse.serializer, pm));
  }
}
