import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/resources/resources.dart';

class BuryLinkUseCase {
  final ApiClient _client;

  BuryLinkUseCase(this._client);

  Future<DigResponse> execute(String id, int reason) async {
    var voteCount = await _client.request('links', 'votedown', api: [id, reason.toString()]);
    return DigResponse(digs: _tryParse(voteCount["digs"]), buries: _tryParse(voteCount["buries"]), state: LinkVoteState.BURIED);
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
