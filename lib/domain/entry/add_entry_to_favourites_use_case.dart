import 'package:wykop_api/infrastucture/client.dart';

class AddEntryToFavouritesUseCase {
  final ApiClient _client;

  AddEntryToFavouritesUseCase(this._client);

  Future<bool> execute(int id) async {
    var res = await _client.request('entries', 'favorite', api: [id.toString()]);
    return res["user_favorite"] as bool;
  }
}
