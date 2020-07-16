import 'package:wykop_api/infrastucture/client.dart';

class AddLinkToFavouritesUseCase {
  final ApiClient _client;

  AddLinkToFavouritesUseCase(this._client);

  Future<bool> execute(int id) async {
    var res = await _client.request('links', 'favorite', api: [id.toString()]);
    return res["user_favorite"] as bool;
  }
}
