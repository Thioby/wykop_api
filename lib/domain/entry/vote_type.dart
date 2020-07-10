const VOTE_REMOVE = 'voteremove';
const VOTE_UP = 'voteup';

enum VoteType { UP, DOWN, COMMENTUP, COMMENTDOWN }

extension VoteTypeExtension on VoteType {
  String getApiValue() {
    return this == VoteType.DOWN ? VOTE_REMOVE : VOTE_UP;
  }
}
