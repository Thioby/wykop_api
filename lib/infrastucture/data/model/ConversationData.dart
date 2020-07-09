import 'package:wykop_api/infrastucture/data/model/AuthorDto.dart';
import 'package:wykop_api/infrastucture/data/model/PmMessageDto.dart';

class ConversationDataDto {
  List<PmMessageDto> messages;
  AuthorDto receiver;
  String lastUpdate;
  ConversationDataDto({this.receiver, this.messages, this.lastUpdate});
}
