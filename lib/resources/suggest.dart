import 'package:wykop_api/domain/suggestion/get_tags_suggestion.dart';
import 'package:wykop_api/domain/suggestion/get_users_suggestion.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/infrastucture/data/model/AuthorSuggestionDto.dart';
import 'package:wykop_api/infrastucture/data/model/TagSuggestionDto.dart';
import 'package:wykop_api/infrastucture/client.dart';
import 'package:wykop_api/resources/resources.dart';

class SuggestApi extends ApiResource {
  final GetTagsSuggestion _getTagsSuggestion;
  final GetUsersSuggestion _getUsersSuggestion;

  SuggestApi(ApiClient client, this._getTagsSuggestion, this._getUsersSuggestion) : super(client);

  Future<List<AuthorSuggestionDto>> suggestUsers(String q) async {
    return _getUsersSuggestion.execute(q);
  }

  Future<List<TagSuggestionDto>> suggestTags(String q) async {
    return _getTagsSuggestion.execute(q);
  }
}
