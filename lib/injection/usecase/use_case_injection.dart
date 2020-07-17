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
import 'package:wykop_api/domain/profile/block_profile.dart';
import 'package:wykop_api/domain/profile/get_followed_by_profile.dart';
import 'package:wykop_api/domain/profile/get_profile.dart';
import 'package:wykop_api/domain/profile/get_profile_actions.dart';
import 'package:wykop_api/domain/profile/get_profile_added_links.dart';
import 'package:wykop_api/domain/profile/get_profile_buried_links.dart';
import 'package:wykop_api/domain/profile/get_profile_commented_entries.dart';
import 'package:wykop_api/domain/profile/get_profile_commented_links.dart';
import 'package:wykop_api/domain/profile/get_profile_comments_for_entry.dart';
import 'package:wykop_api/domain/profile/get_profile_comments_for_link.dart';
import 'package:wykop_api/domain/profile/get_profile_digged_links.dart';
import 'package:wykop_api/domain/profile/get_profile_entries.dart';
import 'package:wykop_api/domain/profile/get_profile_followers.dart';
import 'package:wykop_api/domain/profile/get_profile_published_links.dart';
import 'package:wykop_api/domain/profile/get_profile_related.dart';
import 'package:wykop_api/domain/profile/observe_profile.dart';
import 'package:wykop_api/domain/profile/unblock_profile.dart';
import 'package:wykop_api/domain/profile/unobserve_profile.dart';
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

  appInjector.addDependency<BlockProfile>(() => BlockProfile(client));
  appInjector.addDependency<UnblockProfile>(() => UnblockProfile(client));
  appInjector.addDependency<ObserveProfile>(() => ObserveProfile(client));
  appInjector.addDependency<UnobserveProfile>(() => UnobserveProfile(client));
  appInjector.addDependency<GetProfileActions>(() => GetProfileActions(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileAddedLinks>(() => GetProfileAddedLinks(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileBuriedLinks>(() => GetProfileBuriedLinks(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileCommentedEntries>(() => GetProfileCommentedEntries(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileCommentedLinks>(() => GetProfileCommentedLinks(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileCommentsForEntry>(() => GetProfileCommentsForEntry(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileCommentsForLink>(() => GetProfileCommentsForLink(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileDiggedLinks>(() => GetProfileDiggedLinks(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileEntries>(() => GetProfileEntries(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileFollowers>(() => GetProfileFollowers(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfilePublishedLinks>(() => GetProfilePublishedLinks(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfileRelated>(() => GetProfileRelated(client, appInjector.getDependency()));
  appInjector.addDependency<GetFollowedByProfile>(() => GetFollowedByProfile(client, appInjector.getDependency()));
  appInjector.addDependency<GetProfile>(() => GetProfile(client, appInjector.getDependency()));
}
