import 'package:wykop_api/domain/private_message/get_coversations_list.dart';
import 'package:wykop_api/domain/private_message/get_full_single_coversation_use_case.dart';
import 'package:wykop_api/domain/private_message/get_simple_single_coversation_use_case.dart';
import 'package:wykop_api/domain/private_message/send_private_message_use_case.dart';
import 'package:wykop_api/infrastucture/data/model/ConversationData.dart';
import 'package:wykop_api/infrastucture/data/model/ConversationDto.dart';
import 'package:wykop_api/infrastucture/data/model/InputData.dart';
import 'package:wykop_api/infrastucture/data/model/PmMessageDto.dart';

class PmApi {
  final SendPrivateMessageUseCase _sendPrivateMessageUseCase;
  final GetConversationsList _getConversationsList;
  final GetFullSingleConversationUseCase _getFullSingleConversationUseCase;
  final GetSimpleSingleConversationUseCase _getSimpleSingleConversationUseCase;

  PmApi(this._sendPrivateMessageUseCase, this._getConversationsList, this._getFullSingleConversationUseCase,
      this._getSimpleSingleConversationUseCase);

  Future<List<ConversationDto>> getConversations() async {
    return _getConversationsList.execute();
  }

  Future<ConversationDataDto> getConversation(String receiver) async {
    return _getFullSingleConversationUseCase.execute(receiver);
  }

  Future<List<PmMessageDto>> getMessages(String receiver) async {
    return _getSimpleSingleConversationUseCase.execute(receiver);
  }

  Future<PmMessageDto> sendMessage(String receiver, InputData data) async {
    return _sendPrivateMessageUseCase.execute(receiver, data);
  }
}
