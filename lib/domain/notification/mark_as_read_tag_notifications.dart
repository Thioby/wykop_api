import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/entry_link_response.dart';

class MarkAsReadTagNotifications {
  final ApiClient _client;

  MarkAsReadTagNotifications(this._client);

  Future<bool> execute() async {
    try {
      await _client.request('notifications', 'ReadHashTagsNotifications');
      return true;
    }catch(error) {
      return false;
    }
  }
}
