import 'package:wykop_api/domain/notification/get_notifications.dart';
import 'package:wykop_api/domain/notification/get_notifications_count.dart';
import 'package:wykop_api/domain/notification/get_tag_notifications.dart';
import 'package:wykop_api/domain/notification/get_tag_notifications_count.dart';
import 'package:wykop_api/domain/notification/mark_as_read_notifications.dart';
import 'package:wykop_api/domain/notification/mark_as_read_tag_notifications.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/NotificationDto.dart';

class NotificationsApi {
  final GetNotifications _getNotifications;
  final GetTagNotifications _getTagNotifications;
  final GetNotificationsCount _getNotificationsCount;
  final GetTagNotificationsCount _getTagNotificationsCount;
  final MarkAsReadNotifications _markAsReadNotifications;
  final MarkAsReadTagNotifications _markAsReadTagNotifications;

  NotificationsApi(ApiClient client, this._getNotifications, this._getTagNotifications, this._getNotificationsCount,
      this._getTagNotificationsCount, this._markAsReadNotifications, this._markAsReadTagNotifications);

  Future<List<NotificationDto>> getHashtagNotifications(int page) async {
    return _getTagNotifications.execute(page);
  }

  Future<bool> readAllHashNotifs() async {
    return _markAsReadTagNotifications.execute();
  }

  Future<int> getNotificationsCount() async {
    return _getNotificationsCount.execute();
  }

  Future<int> getHashNotificationsCount() async {
    return _getTagNotificationsCount.execute();
  }

  Future<bool> readAllDirectedNotifs() async {
    return _markAsReadNotifications.execute();
  }

  Future<List<NotificationDto>> getNotifications(int page) async {
    return _getNotifications.execute(page);
  }
}
