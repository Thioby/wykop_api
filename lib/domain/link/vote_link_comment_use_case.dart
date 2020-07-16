import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/resources/resources.dart';

const VOTE_UP = 'commentvoteup';
const VOTE_DOWN = 'CommentVoteDown';
const VOTE_CANCEL = 'commentvotecancel';

class VoteLinkCommentUseCase {
  final ApiClient _client;

  VoteLinkCommentUseCase(this._client);

  Future<VoteStateResponse> execute(String id, int linkCommentId, LinkCommentVoteType type) async {
    var voteCount = await _client.request('links', type.getApiValue(), api: [id, linkCommentId.toString()]);
    return VoteStateResponse(votes: _tryParse(voteCount["vote_count"]), votesPlus: _tryParse(voteCount["vote_count_plus"]), state: type.getLinkState());
  }

  int _tryParse(dynamic count) {
    if (count is String) {
      return int.parse(count);
    }
    if (count is int) {
      return count;
    }
    throw "I have no idea how to parse voteCount";
  }
}

enum LinkCommentVoteType { UP, DOWN, CANCEL }

extension on LinkCommentVoteType {
  String getApiValue() {
    switch (this) {
      case LinkCommentVoteType.DOWN: return VOTE_DOWN;
      case LinkCommentVoteType.UP: return VOTE_UP;
      case LinkCommentVoteType.CANCEL: return VOTE_CANCEL;
      default:
        throw "not supported vote type";
    }
  }

  int getLinkState() {
    switch (this) {
      case LinkCommentVoteType.UP:
        return 1;
      case LinkCommentVoteType.DOWN:
        return -1;
      case LinkCommentVoteType.CANCEL:
        return -0;
      default:
        throw "not supported vote type";
    }
  }
}
