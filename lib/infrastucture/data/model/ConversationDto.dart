import 'package:equatable/equatable.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/domain/mapper/mapper.dart';
import 'package:wykop_api/infrastucture/data/model/AuthorDto.dart';

class ConversationDto implements Equatable {
  final String lastUpdate;

  final AuthorDto author;

  ConversationDto({this.lastUpdate, this.author});

  @override
  List<Object> get props => [author, lastUpdate];

  @override
  bool get stringify => true;
}

class ConversationResponseToConversationDtoMapper implements DataMapper<ConversationResponse, ConversationDto> {
  final AuthorResponseToAuthorDtoMapper _authorDtoMapper;

  ConversationResponseToConversationDtoMapper(this._authorDtoMapper);

  @override
  ConversationDto apply(ConversationResponse response) {
    return ConversationDto(lastUpdate: response.lastUpdate, author: _authorDtoMapper.apply(response.receiver));
  }
}
