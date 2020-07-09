class AuthCredentials {
  final String token;
  final String login;
  final String avatarUrl;
  final String backgroundUrl;
  final int color;
  String refreshToken;
  AuthCredentials({this.token, this.avatarUrl, this.login, this.refreshToken, this.color, this.backgroundUrl});
}