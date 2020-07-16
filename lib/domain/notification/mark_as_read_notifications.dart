import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/entry_link_response.dart';

class MarkAsReadNotifications {
  final ApiClient _client;

  MarkAsReadNotifications(this._client);

  Future<bool> execute() async {
    try {
      await _client.request('notifications', 'ReadDirectedNotifications');
      return true;
    }catch(error) {
      return false;
    }
  }
}
