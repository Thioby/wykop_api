import 'package:wykop_api/domain/search/search_entires.dart';
import 'package:wykop_api/domain/search/search_index.dart';
import 'package:wykop_api/domain/search/search_links.dart';
import 'package:wykop_api/infrastucture/data/model/EntryDto.dart';
import 'package:wykop_api/infrastucture/data/model/EntryLinkDto.dart';
import 'package:wykop_api/infrastucture/data/model/LinkDto.dart';

class SearchApi {
  final SearchLinks _searchLinks;
  final SearchEntries _searchEntries;
  final SearchIndex _searchIndex;

  SearchApi(this._searchLinks, this._searchEntries, this._searchIndex);

  Future<List<EntryDto>> searchEntries(int page, String q) async {
    return _searchEntries.execute(q: q, page: page);
  }

  Future<List<LinkDto>> searchLinks(int page, String q) async {
    return _searchLinks.execute(q: q, page: page);
  }

  Future<List<EntryLinkDto>> searchIndex(int page, String q) async {
    return _searchIndex.execute(q: q, page: page);
  }
}
