import 'package:shared_preferences/shared_preferences.dart';
import 'package:wykop_api/infrastucture/data/AuthCredentials.dart';

abstract class CredentialsStore {
  Future<void> saveCredentials(AuthCredentials credentials);

  Future<AuthCredentials> loadCredentials();
}

class DefaultCredentialsStore implements CredentialsStore {
  @override
  Future<AuthCredentials> loadCredentials() async {
    var prefs = await SharedPreferences.getInstance();
    var credentials = AuthCredentials(
        refreshToken: prefs.getString('userkey'),
        token: prefs.getString('accountkey'),
        login: prefs.getString('login'),
        backgroundUrl: prefs.getString('backgroundUrl'),
        color: prefs.getInt('color'),
        avatarUrl: prefs.getString('avatarUrl'));
    return credentials;
  }

  @override
  Future<void> saveCredentials(AuthCredentials credentials) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('userkey', credentials.refreshToken ?? "");
    await prefs.setString('accountkey', credentials.token ?? "");
    await prefs.setString('login', credentials.login ?? "");
    await prefs.setString('avatarUrl', credentials.avatarUrl ?? "");
    await prefs.setString('backgroundUrl', credentials.backgroundUrl ?? "");
    await prefs.setInt('color', credentials.color ?? 0);
  }
}
