import 'package:wykop_api/domain/my_wykop/get_my_wykop_index_use_case.dart';
import 'package:wykop_api/domain/my_wykop/get_my_wykop_tags_use_case.dart';
import 'package:wykop_api/domain/my_wykop/get_my_wykop_users_use_case.dart';
import 'package:wykop_api/infrastucture/data/model/EntryLinkDto.dart';

class MyWykopApi {
  final GetMyWykopIndexUseCase _getMyWykopIndexUseCase;
  final GetMyWykopTagsUseCase _getMyWykopTagsUseCase;
  final GetMyWykopUsersUseCase _getMyWykopUsersUseCase;

  MyWykopApi(this._getMyWykopIndexUseCase, this._getMyWykopTagsUseCase, this._getMyWykopUsersUseCase);

  Future<List<EntryLinkDto>> getIndex(int page) async {
    return _getMyWykopIndexUseCase.execute(page);
  }

  Future<List<EntryLinkDto>> getTags(int page) async {
    return _getMyWykopTagsUseCase.execute(page);
  }

  Future<List<EntryLinkDto>> getUsers(int page) async {
    _getMyWykopUsersUseCase.execute(page);
  }

}
