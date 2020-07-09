import 'package:wykop_api/domain/entries/entrires_actions_use_case.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/injection/Injector.dart';

void setupUseCaseDeps(ApiClient client) {
  appInjector.addDependency<EntriesActionsUseCase>(() => EntriesActionsUseCase(client, appInjector.getDependency()));
}

