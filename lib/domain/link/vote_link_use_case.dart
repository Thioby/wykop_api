import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/resources/resources.dart';

const VOTE_REMOVE = 'voteremove';
const VOTE_UP = 'voteup';
const VOTE_COMMENT_UP = 'commentvoteup';
const VOTE_COMMENT_DOWN = 'CommentVoteDown';
const VOTE_COMMENT_CANCEL = 'commentvotecancel';

class VoteLinkUseCase {
  final ApiClient _client;

  VoteLinkUseCase(this._client);

  Future<DigResponse> execute(String id, LinkVoteType type) async {
    var voteCount = await _client.request('links', type.getApiValue(), api: [id]);
    return DigResponse(digs: _tryParse(voteCount["digs"]), buries: _tryParse(voteCount["buries"]), state: type.getLinkState());
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

enum LinkVoteType { UP, DOWN, }

extension on LinkVoteType {
  String getApiValue() {
    switch (this) {
      case LinkVoteType.DOWN: return VOTE_REMOVE;
      case LinkVoteType.UP: return VOTE_UP;
      default:
        throw "not supported vote type";
    }
  }

  LinkVoteState getLinkState() {
    switch (this) {
      case LinkVoteType.UP:
        return LinkVoteState.DIGGED;
      case LinkVoteType.DOWN:
        return LinkVoteState.NONE;
      default:
        throw "not supported vote type";
    }
  }
}
