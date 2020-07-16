import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/pm_message_response.dart';

class GetFullSingleConversationUseCase {
  final ApiClient _client;
  final PmMessageResponseToPmMessageDtoMapper _privateMessageMapper;
  final AuthorResponseToAuthorDtoMapper _authorMapper;

  GetFullSingleConversationUseCase(this._client, this._authorMapper, this._privateMessageMapper);

  Future<ConversationDataDto> execute(String receiver) async {
    var items = await _client.request('pm', 'conversation', api: [receiver], returnFullResponse: true);

    var msgs = _client.deserializeList(PmMessageResponse.serializer, items["data"]).map(_privateMessageMapper.apply).toList();
    AuthorResponse authorResponse = _client.deserializeElement(AuthorResponse.serializer, items['receiver']);
    var author = _authorMapper.apply(authorResponse);

    return ConversationDataDto(
      messages: msgs,
      receiver: author,
      lastUpdate: items["last_update"],
    );
  }
}
