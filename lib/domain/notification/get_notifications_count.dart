import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/entry_link_response.dart';

class GetNotificationsCount {
  final ApiClient _client;

  GetNotificationsCount(this._client);

  Future<int> execute() async {
    var items = await _client.request('notifications', 'count');

    return items["count"];
  }
}
