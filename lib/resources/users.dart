import 'package:wykop_api/infrastucture/data/AuthCredentials.dart';
import 'package:wykop_api/infrastucture/data/model/UserProfileDto.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/resources/resources.dart';

class UsersApi extends ApiResource {
  UsersApi(ApiClient client) : super(client);

  Future<UserProfileDto> login(String login, String accountKey) async {
    print(login);
    print(accountKey);
    var result = await client.request('login', 'index', post: {'login': login, 'accountkey': accountKey});

    print(result);
    var credentials = AuthCredentials(
        avatarUrl: result["profile"]["avatar"],
        login: login,
        token: accountKey,
        backgroundUrl: result["profile"]["background"],
        color: result["profile"]["color"],
        refreshToken: result["userkey"]);

    client.saveCredentials(credentials);

    return UserProfileDto(
        avatarUrl: result["profile"]["avatar"],
        login: login,
        color: result["profile"]["color"],
        backgroundUrl: result["profile"]["background"]);
  }
}
