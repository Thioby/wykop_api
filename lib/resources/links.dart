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
import 'package:wykop_api/domain/link/link_vote_state.dart';
import 'package:wykop_api/domain/link/vote_link_comment_use_case.dart';
import 'package:wykop_api/domain/link/vote_link_use_case.dart';
import 'package:wykop_api/infrastucture/data/model/InputData.dart';
import 'package:wykop_api/infrastucture/data/model/LinkCommentDto.dart';
import 'package:wykop_api/infrastucture/data/model/LinkDto.dart';
import 'package:wykop_api/infrastucture/data/model/RelatedDto.dart';
import 'package:wykop_api/resources/resources.dart';

// Used for vote up, vote down and vote cancel responses
class VoteStateResponse {
  final int votesPlus;
  final int votes;
  final int state;

  VoteStateResponse({this.votes, this.votesPlus, this.state});
}

class BuryReason {
  static const DUPLICATE = 1;
  static const SPAM = 2;
  static const FAKE_INFO = 3;
  static const NOT_APPROPRIATE_CONTENT = 4;
  static const INVALID = 5;
}

class DigResponse {
  final int digs;
  final int buries;
  final LinkVoteState state;

  DigResponse({this.digs, this.buries, this.state});
}

class UpcomingSort {
  static const SORTBY_COMMENTS = "comments";
  static const SORTBY_VOTES = "votes";
  static const SORTBY_DATE = "date";
  static const SORTBY_ACTIVE = "active";
}

class LinksApi {
  final GetSingleLinkUseCase _getSingleLinkUseCase;
  final AddLinkToFavouritesUseCase _addLinkToFavouritesUseCase;
  final VoteLinkUseCase _voteLinkUseCase;
  final BuryLinkUseCase _buryLinkUseCase;
  final VoteLinkCommentUseCase _voteLinkCommentUseCase;
  final GetRelatedLinkUseCase _getRelatedLinkUseCase;
  final DeleteLinkCommentUseCase _deleteLinkCommentUseCase;
  final GetLinksByActionUseCase _getLinksByActionUseCase;
  final GetLinkCommentsUseCase _getLinkCommentsUseCase;
  final EditLinkCommentUseCase _editLinkCommentUseCase;
  final AddLinkCommentUseCase _addLinkCommentUseCase;
  final GetHitLinksByPeriodUseCase _getHitLinksByPeriodUseCase;

  LinksApi(
    this._getSingleLinkUseCase,
    this._addLinkToFavouritesUseCase,
    this._voteLinkUseCase,
    this._buryLinkUseCase,
    this._voteLinkCommentUseCase,
    this._getRelatedLinkUseCase,
    this._deleteLinkCommentUseCase,
    this._getLinksByActionUseCase,
    this._getLinkCommentsUseCase,
    this._editLinkCommentUseCase,
    this._addLinkCommentUseCase,
    this._getHitLinksByPeriodUseCase,
  );

  Future<List<LinkDto>> getUpcoming(String sortBy, int page) async {
    return _getLinksByActionUseCase.execute(page, LinkActionType.UPCOMING, sortyBy: sortBy);
  }

  Future<List<LinkDto>> getPromotedNew(int page) => _getLinksByActionUseCase.execute(page, LinkActionType.PROMOTED);

  Future<List<LinkDto>> getFavoriteNew(int page) => _getLinksByActionUseCase.execute(page, LinkActionType.OBSERVED);

  Future<List<LinkDto>> getHitsPopular(int page) => _getLinksByActionUseCase.execute(page, LinkActionType.POPULAR);

  Future<bool> deleteComment(int id) async {
    return _deleteLinkCommentUseCase.execute(id);
  }

  Future<List<LinkDto>> getHitsDay(int page) => _getHitLinksByPeriodUseCase.execute(page, LinkHitsPeriod.DAY);

  Future<List<LinkDto>> getHitsWeek(int page) => _getHitLinksByPeriodUseCase.execute(page, LinkHitsPeriod.WEEK);

  Future<List<LinkDto>> getHitsMonth(int page, int month, int year) async {
    return _getHitLinksByPeriodUseCase.execute(page, LinkHitsPeriod.MONTH, month: month.toString(), year: year.toString());
  }

  Future<List<LinkDto>> getHitsYear(int page, int year) async {
    return _getHitLinksByPeriodUseCase.execute(page, LinkHitsPeriod.YEAR, year: year.toString());
  }

  Future<LinkDto> getLink(int linkId) async {
    return _getSingleLinkUseCase.execute(linkId);
  }

  Future<List<LinkCommentDto>> getLinkComments(int linkId) async {
    return _getLinkCommentsUseCase.execute(linkId);
  }

  Future<bool> markFavorite(int id) async {
    return _addLinkToFavouritesUseCase.execute(id);
  }

  Future<DigResponse> voteUp(String linkId) async {
    return _voteLinkUseCase.execute(linkId, LinkVoteType.UP);
  }

  Future<DigResponse> voteRemove(String linkId) async {
    return _voteLinkUseCase.execute(linkId, LinkVoteType.DOWN);
  }

  Future<DigResponse> voteBury(String linkId, int reason) async {
    return _buryLinkUseCase.execute(linkId, reason);
  }

  Future<VoteStateResponse> commentVoteUp(int linkCommentId, String linkId) async {
    return _voteLinkCommentUseCase.execute(linkId, linkCommentId, LinkCommentVoteType.UP);
  }

  Future<VoteStateResponse> commentVoteRemove(int linkCommentId, String linkId) async {
    return _voteLinkCommentUseCase.execute(linkId, linkCommentId, LinkCommentVoteType.CANCEL);
  }

  Future<VoteStateResponse> commentVoteDown(int linkCommentId, String linkId) async {
    return _voteLinkCommentUseCase.execute(linkId, linkCommentId, LinkCommentVoteType.DOWN);
  }

  Future<List<RelatedDto>> getRelatedLinks(int linkId) async {
    return _getRelatedLinkUseCase.execute(linkId);
  }

  Future<LinkCommentDto> addComment(int linkId, InputData data, {int commentId}) async {
    return _addLinkCommentUseCase.execute(linkId, data, commentId: commentId);
  }

  Future<LinkCommentDto> editComment(int id, InputData data) async {
    return _editLinkCommentUseCase.execute(id, data);
  }
}
