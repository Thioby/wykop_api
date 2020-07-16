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
import 'package:wykop_api/domain/link/add_link_comments_use_case.dart';
import 'package:wykop_api/domain/link/add_link_to_favourites_use_case.dart';
import 'package:wykop_api/domain/link/bury_link_use_case.dart';
import 'package:wykop_api/domain/link/delete_link_comment_use_case.dart';
import 'package:wykop_api/domain/link/edit_link_comments_use_case.dart';
import 'package:wykop_api/domain/link/get_hit_links_use_case.dart';
import 'package:wykop_api/domain/link/get_link_comments_use_case.dart';
import 'package:wykop_api/domain/link/get_links_use_case.dart';
import 'package:wykop_api/domain/link/get_related_links_use_case.dart';
import 'package:wykop_api/domain/link/get_single_link_use_case.dart';
import 'package:wykop_api/domain/link/vote_link_comment_use_case.dart';
import 'package:wykop_api/domain/link/vote_link_use_case.dart';
import 'package:wykop_api/domain/my_wykop/get_my_wykop_index_use_case.dart';
import 'package:wykop_api/domain/my_wykop/get_my_wykop_tags_use_case.dart';
import 'package:wykop_api/domain/my_wykop/get_my_wykop_users_use_case.dart';
import 'package:wykop_api/domain/notification/get_notifications.dart';
import 'package:wykop_api/domain/notification/get_notifications_count.dart';
import 'package:wykop_api/domain/notification/get_tag_notifications.dart';
import 'package:wykop_api/domain/notification/get_tag_notifications_count.dart';
import 'package:wykop_api/domain/notification/mark_as_read_notifications.dart';
import 'package:wykop_api/domain/notification/mark_as_read_tag_notifications.dart';
import 'package:wykop_api/domain/private_message/get_coversations_list.dart';
import 'package:wykop_api/domain/private_message/get_full_single_coversation_use_case.dart';
import 'package:wykop_api/domain/private_message/get_simple_single_coversation_use_case.dart';
import 'package:wykop_api/domain/private_message/send_private_message_use_case.dart';
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

  appInjector.addDependency<GetSingleLinkUseCase>(() => GetSingleLinkUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<AddLinkToFavouritesUseCase>(() => AddLinkToFavouritesUseCase(client));
  appInjector.addDependency<VoteLinkUseCase>(() => VoteLinkUseCase(client));
  appInjector.addDependency<BuryLinkUseCase>(() => BuryLinkUseCase(client));
  appInjector.addDependency<VoteLinkCommentUseCase>(() => VoteLinkCommentUseCase(client));
  appInjector.addDependency<DeleteLinkCommentUseCase>(() => DeleteLinkCommentUseCase(client));
  appInjector.addDependency<GetRelatedLinkUseCase>(() => GetRelatedLinkUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetLinksByActionUseCase>(() => GetLinksByActionUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetLinkCommentsUseCase>(() => GetLinkCommentsUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<EditLinkCommentUseCase>(() => EditLinkCommentUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<AddLinkCommentUseCase>(() => AddLinkCommentUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetHitLinksByPeriodUseCase>(() => GetHitLinksByPeriodUseCase(client, appInjector.getDependency()));

  appInjector.addDependency<GetMyWykopUsersUseCase>(() => GetMyWykopUsersUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetMyWykopTagsUseCase>(() => GetMyWykopTagsUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetMyWykopIndexUseCase>(() => GetMyWykopIndexUseCase(client, appInjector.getDependency()));

  appInjector.addDependency<GetNotificationsCount>(() => GetNotificationsCount(client));
  appInjector.addDependency<GetTagNotificationsCount>(() => GetTagNotificationsCount(client));
  appInjector.addDependency<MarkAsReadTagNotifications>(() => MarkAsReadTagNotifications(client));
  appInjector.addDependency<MarkAsReadNotifications>(() => MarkAsReadNotifications(client));
  appInjector.addDependency<GetNotifications>(() => GetNotifications(client, appInjector.getDependency()));
  appInjector.addDependency<GetTagNotifications>(() => GetTagNotifications(client, appInjector.getDependency()));

  appInjector.addDependency<SendPrivateMessageUseCase>(() => SendPrivateMessageUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetConversationsList>(() => GetConversationsList(client, appInjector.getDependency()));
  appInjector
      .addDependency<GetSimpleSingleConversationUseCase>(() => GetSimpleSingleConversationUseCase(client, appInjector.getDependency()));
  appInjector.addDependency<GetFullSingleConversationUseCase>(() => GetFullSingleConversationUseCase(
        client,
        appInjector.getDependency(),
        appInjector.getDependency(),
      ));
}
