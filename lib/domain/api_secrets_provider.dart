
import 'package:wykop_api/domain/secrets/api_secrets.dart';

abstract class ApiSecretsProvider {
  Future<ApiSecrets> loadSecrets();
}