import 'package:wykop_api/domain/entries/get_entrires_by_actions_use_case.dart';
import 'package:wykop_api/domain/entry/add_entry_comment_use_case.dart';
import 'package:wykop_api/domain/entry/add_entry_to_favourites_use_case.dart';
import 'package:wykop_api/domain/entry/add_entry_use_case.dart';
import 'package:wykop_api/domain/entry/delete_entry_comment_use_case.dart';
import 'package:wykop_api/domain/entry/delete_entry_use_case.dart';
import 'package:wykop_api/domain/entry/edit_entry_comment_use_case.dart';
import 'package:wykop_api/domain/entry/edit_entry_use_case.dart';
import 'package:wykop_api/domain/entry/get_entry_comment_upvoters_use_case.dart';
import 'package:wykop_api/domain/entry/get_entry_upvoters_use_case.dart';
import 'package:wykop_api/domain/entry/get_single_entry_use_case.dart';
import 'package:wykop_api/domain/entry/vote_entry_use_case.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/injection/Injector.dart';

void setupUseCaseDeps(ApiClient client) {
  appInjector.addDependency<GetEntriesByActionsUseCase>(() => GetEntriesByActionsUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<DeleteEntryUseCase>(() => DeleteEntryUseCase(client));
  appInjector.addDependency<EditEntryUseCase>(() => EditEntryUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetSingleEntryUseCase>(() => GetSingleEntryUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<AddEntryCommentUseCase>(() => AddEntryCommentUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<AddEntryUseCase>(() => AddEntryUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetEntryUpvotersUseCase>(() => GetEntryUpvotersUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetEntryCommentUpvotersUseCase>(() => GetEntryCommentUpvotersUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<EditEntryCommentUseCase>(() => EditEntryCommentUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<VoteUpEntryUseCase>(() => VoteUpEntryUseCase(client));
  appInjector.addDependency<AddEntryToFavouritesUseCase>(() => AddEntryToFavouritesUseCase(client));
  appInjector.addDependency<DeleteEntryCommentUseCase>(() => DeleteEntryCommentUseCase(client));
}
