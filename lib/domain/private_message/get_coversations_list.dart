import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/conversation_response.dart';

class GetConversationsList {
  final ApiClient _client;
  final ConversationResponseToConversationDtoMapper _mapper;

  GetConversationsList(this._client, this._mapper);

  Future<List<ConversationDto>> execute() async {
    var items = await _client.request('pm', 'conversationslist');
    return _client.deserializeList(ConversationResponse.serializer, items).map(_mapper.apply).toList();
  }
}
