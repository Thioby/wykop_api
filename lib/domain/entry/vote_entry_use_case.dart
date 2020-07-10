import 'package:wykop_api/infrastucture/client.dart';

const VOTE_REMOVE = 'voteremove';
const VOTE_UP = 'voteup';
const VOTE_COMMENT_UP = 'commentvoteup';
const VOTE_COMMENT_DOWN = 'commentvoteremove';

class VoteUpEntryUseCase {
  final ApiClient _client;

  VoteUpEntryUseCase(this._client);

  Future<int> execute(int id, VoteType type) async {
    var voteCount = await _client.request('entries', type.getApiValue(), api: [id.toString()]);
    return _tryParse(voteCount["vote_count"]);
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

enum VoteType { UP, DOWN, COMMENT_UP, COMMENT_DOWN }

extension on VoteType {
  String getApiValue() {

    switch(this){
      case VoteType.DOWN: return VOTE_REMOVE;
      case VoteType.UP: return VOTE_UP;
      case VoteType.COMMENT_DOWN: return VOTE_COMMENT_DOWN;
      case VoteType.COMMENT_UP: return VOTE_COMMENT_UP;
      default: throw "not supported vote type";
    }

  }
}
