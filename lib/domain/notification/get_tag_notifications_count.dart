import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/entry_link_response.dart';

class GetTagNotificationsCount {
  final ApiClient _client;

  GetTagNotificationsCount(this._client);

  Future<int> execute() async {
    var items = await _client.request('notifications', 'HashTagscount');

    return items["count"];
  }
}
