import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/infrastucture/data/model/dtoModels.dart';
import 'package:wykop_api/infrastucture/response_models/voter_response.dart';

class EditEntryCommentUpvotersUseCase {
  final ApiClient _client;
  final VoterResponseToVoterDtoMapper _voterResponseToVoterDtoMapper;

  EditEntryCommentUpvotersUseCase(this._client, this._voterResponseToVoterDtoMapper);

  Future<List<VoterDto>> execute(int id) async {
    var items = await _client.request('entries', 'commentupvoters', api: [id.toString()]);
    print(items);
    var voters = _client.deserializeList(VoterResponse.serializer, items);
    return voters.map(_voterResponseToVoterDtoMapper.apply).toList();
  }
}
