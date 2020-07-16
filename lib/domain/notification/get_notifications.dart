import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/notification_response.dart';

class GetNotifications {
  final ApiClient _client;
  final NotificationResponseToNotificationDtoMapper _notificationDtoMapper;

  GetNotifications(this._client, this._notificationDtoMapper);

  Future<List<NotificationDto>> execute(int page) async {
    var items = await _client.request('notifications', 'Notifications', named: {'page': page.toString()});

    return _client.deserializeList(NotificationResponse.serializer, items).map(_notificationDtoMapper.apply).toList();
  }
}
