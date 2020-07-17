import 'dart:async';
import 'dart:core';

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
import 'package:wykop_api/infrastucture/data/model/EntryCommentDto.dart';
import 'package:wykop_api/infrastucture/data/model/EntryDto.dart';
import 'package:wykop_api/infrastucture/data/model/EntryLinkDto.dart';
import 'package:wykop_api/infrastucture/data/model/LinkCommentDto.dart';
import 'package:wykop_api/infrastucture/data/model/LinkDto.dart';
import 'package:wykop_api/infrastucture/data/model/ProfileDto.dart';
import 'package:wykop_api/infrastucture/data/model/ProfileRelatedDto.dart';

class ProfilesApi {
  final GetProfile _getProfile;
  final GetProfileRelated _getProfileRelated;
  final GetProfilePublishedLinks _getProfilePublishedLinks;
  final GetProfileFollowers _getProfileFollowers;
  final GetFollowedByProfile _getFollowedByProfile;
  final GetProfileEntries _getProfileEntries;
  final GetProfileDiggedLinks _getProfileDiggedLinks;
  final GetProfileBuriedLinks _getProfileBuriedLinks;
  final BlockProfile _blockProfile;
  final UnblockProfile _unblockProfile;
  final ObserveProfile _observeProfile;
  final UnobserveProfile _unobserveProfile;
  final GetProfileActions _getProfileActions;
  final GetProfileAddedLinks _getProfileAddedLinks;
  final GetProfileCommentsForLink _getProfileCommentsForLink;
  final GetProfileCommentsForEntry _getProfileCommentsForEntry;
  final GetProfileCommentedLinks _getProfileCommentedLinks;
  final GetProfileCommentedEntries _getProfileCommentedEntries;

  ProfilesApi(
    this._getProfile,
    this._getProfileRelated,
    this._getProfilePublishedLinks,
    this._getProfileFollowers,
    this._getFollowedByProfile,
    this._getProfileEntries,
    this._getProfileDiggedLinks,
    this._getProfileBuriedLinks,
    this._blockProfile,
    this._unblockProfile,
    this._observeProfile,
    this._unobserveProfile,
    this._getProfileActions,
    this._getProfileAddedLinks,
    this._getProfileCommentsForLink,
    this._getProfileCommentsForEntry,
    this._getProfileCommentedLinks,
    this._getProfileCommentedEntries,
  );

  Future<List<EntryLinkDto>> getActions(String username) async {
    return _getProfileActions.execute(username: username);
  }

  Future<List<LinkDto>> getAddedLinks(int page, String username) async {
    return _getProfileAddedLinks.execute(username: username, page: page);
  }

  Future<List<LinkDto>> getCommentedLinks(int page, String username) async {
    return _getProfileCommentedLinks.execute(username: username, page: page);
  }

  Future<List<LinkDto>> getPublishedLinks(int page, String username) async {
    return _getProfilePublishedLinks.execute(username: username, page: page);
  }

  Future<List<LinkCommentDto>> getLinkComments(int page, String username) async {
    return _getProfileCommentsForLink.execute(username: username, page: page);
  }

  Future<List<EntryDto>> getEntries(int page, String username) async {
    return _getProfileEntries.execute(username: username, page: page);
  }

  Future<List<EntryDto>> getCommentedEntries(int page, String username) async {
    return _getProfileCommentedEntries.execute(username: username, page: page);
  }

  Future<List<EntryCommentDto>> getEntryComments(int page, String username) async {
    return _getProfileCommentsForEntry.execute(username: username, page: page);
  }

  Future<List<LinkCommentDto>> getFollowers(int page, String username) async {
    return _getProfileFollowers.execute(username: username, page: page);
  }

  Future<List<LinkCommentDto>> getFollowed(int page, String username) async {
    return _getFollowedByProfile.execute(username: username, page: page);
  }

  Future<List<ProfileRelatedDto>> getProfileRelated(int page, String username) async {
    return _getProfileRelated.execute(username: username, page: page);
  }

  Future<ProfileDto> getProfile(String username) async {
    return _getProfile.execute(username);
  }

  Future<List<LinkDto>> getDigged(int page, String username) async {
    return _getProfileDiggedLinks.execute(username: username, page: page);
  }

  Future<List<LinkDto>> getBuried(int page, String username) async {
    return _getProfileBuriedLinks.execute(username: username, page: page);
  }

  Future<bool> observe(String username) async {
    return _observeProfile.execute(username);
  }

  Future<bool> unobserve(String username) async {
    return _unobserveProfile.execute(username);
  }

  Future<bool> block(String username) async {
    return _blockProfile.execute(username);
  }

  Future<bool> unblock(String username) async {
    return _unblockProfile.execute(username);
  }
}
