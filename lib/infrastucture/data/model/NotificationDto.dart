import 'package:equatable/equatable.dart';
import 'package:wykop_api/domain/mapper/mapper.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/data/model/AuthorDto.dart';

class NotificationDto implements Equatable {
  final int id;

  final String date;

  final String body;

  final String itemId;

  final String url;

  final String type;

  final bool isNew;

  final AuthorDto author;

  NotificationDto({this.id, this.date, this.body, this.itemId, this.url, this.type, this.isNew, this.author,});

  String getTag() => "#" + this.body.split("#")[1].split(" ")[0];

  @override
  List<Object> get props => [id];

  @override
  bool get stringify => true;
}

class NotificationResponseToNotificationDtoMapper implements DataMapper<NotificationResponse, NotificationDto> {
  final AuthorResponseToAuthorDtoMapper _authorDtoMapper;

  NotificationResponseToNotificationDtoMapper(this._authorDtoMapper);

  @override
  NotificationDto apply(NotificationResponse response) {
    return NotificationDto(id: response.id,
      date: response.date,
      type: response.type,
      url: response.url,
      body: response.body,
      isNew: response.isNew,
      itemId: response.itemId,
      author: response.author != null ? _authorDtoMapper.apply(response.author) : null,);
  }
}
