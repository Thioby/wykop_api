import 'package:wykop_api/domain/entries/get_entrires_by_actions_use_case.dart';
import 'package:wykop_api/domain/entries/entry_action_type.dart';
import 'package:wykop_api/domain/entry/add_entry_comment_use_case.dart';
import 'package:wykop_api/domain/entry/add_entry_to_favourites_use_case.dart';
import 'package:wykop_api/domain/entry/add_entry_use_case.dart';
import 'package:wykop_api/domain/entry/delete_entry_comment_use_case.dart';
import 'package:wykop_api/domain/entry/delete_entry_use_case.dart';
import 'package:wykop_api/domain/entry/edit_entry_comment_use_case.dart';
import 'package:wykop_api/domain/entry/edit_entry_use_case.dart';
import 'package:wykop_api/domain/entry/get_entry_comment_upvoters_use_case.dart';
import 'package:wykop_api/domain/entry/get_entry_upvoters_use_case.dart';
import 'package:wykop_api/domain/entry/get_single_entry_use_case.dart';
import 'package:wykop_api/domain/entry/vote_entry_use_case.dart';
import 'package:wykop_api/infrastucture/data/model/EntryCommentDto.dart';
import 'package:wykop_api/infrastucture/data/model/EntryDto.dart';
import 'package:wykop_api/infrastucture/data/model/InputData.dart';
import 'package:wykop_api/infrastucture/data/model/VoterDto.dart';

class EntriesApi {
  final GetEntriesByActionsUseCase _entriesActionsUseCase;
  final DeleteEntryUseCase _deleteEntryUseCase;
  final EditEntryUseCase _editEntryUseCase;
  final GetSingleEntryUseCase _getSingleEntryUseCase;
  final AddEntryCommentUseCase _addEntryCommentUseCase;
  final VoteUpEntryUseCase _voteUpEntryUseCase;
  final AddEntryToFavouritesUseCase _addEntryToFavouritesUseCase;
  final AddEntryUseCase _addEntryUseCase;
  final GetEntryUpvotersUseCase _getEntryUpvotersUseCase;
  final GetEntryCommentUpvotersUseCase _getEntryCommentsUpvotersUseCase;
  final EditEntryCommentUseCase _editEntryCommentUseCase;
  final DeleteEntryCommentUseCase _deleteEntryCommentUseCase;

  EntriesApi(
    this._entriesActionsUseCase,
    this._deleteEntryUseCase,
    this._editEntryUseCase,
    this._getSingleEntryUseCase,
    this._addEntryCommentUseCase,
    this._voteUpEntryUseCase,
    this._addEntryToFavouritesUseCase,
    this._addEntryUseCase,
    this._getEntryUpvotersUseCase,
    this._getEntryCommentsUpvotersUseCase,
    this._editEntryCommentUseCase,
    this._deleteEntryCommentUseCase,
  );

// entry actions use case
  Future<List<EntryDto>> getFavorite(int page) async {
    final params = {'page': page.toString()};
    return _entriesActionsUseCase.execute(type: EntryActionsType.OBSERVED, params: params);
  }

  Future<List<EntryDto>> getHot(int page, String period) async {
    final params = {'period': period, 'page': page.toString()};
    return _entriesActionsUseCase.execute(type: EntryActionsType.HOT, params: params);
  }

  Future<List<EntryDto>> getNewest(int page) async {
    final params = {'page': page.toString()};
    return _entriesActionsUseCase.execute(type: EntryActionsType.STREAM, params: params);
  }

  Future<List<EntryDto>> getActive(int page) async {
    final params = {'page': page.toString()};
    return _entriesActionsUseCase.execute(type: EntryActionsType.ACTIVE, params: params);
  }

  Future<EntryDto> getEntry(int id) async {
    return _getSingleEntryUseCase.execute(id);
  }

  Future<EntryCommentDto> addEntryComment(int entryId, InputData data) async {
    return _addEntryCommentUseCase.execute(entryId, data);
  }

  Future<List<VoterDto>> getEntryUpVoters(int entryId) async {
    return _getEntryUpvotersUseCase.execute(entryId);
  }

  Future<List<VoterDto>> getEntryCommentUpVoters(int entryId) async {
    return _getEntryCommentsUpvotersUseCase.execute(entryId);
  }

  Future<EntryDto> addEntry(InputData data) async {
    return _addEntryUseCase.execute(data);
  }

  Future<int> voteUp(int id) async {
    return _voteUpEntryUseCase.execute(id, VoteType.UP);
  }

  Future<bool> markFavorite(int id) async {
    return _addEntryToFavouritesUseCase.execute(id);
  }

  Future<int> voteDown(int id) async {
    return _voteUpEntryUseCase.execute(id, VoteType.DOWN);
  }

  Future<int> voteComemntUp(int id) async {
    return _voteUpEntryUseCase.execute(id, VoteType.COMMENT_UP);
  }

  Future<int> voteCommentDown(int id) async {
    return _voteUpEntryUseCase.execute(id, VoteType.COMMENT_DOWN);
  }

  Future<bool> deleteEntry(int id) async {
    return await _deleteEntryUseCase.execute(id);
  }

  Future<EntryDto> editEntry(int id, InputData data) async {
    return _editEntryUseCase.execute(id, data);
  }

  Future<EntryCommentDto> editEntryComment(int id, InputData data) async {
    return _editEntryCommentUseCase.execute(id, data);
  }

  Future<bool> deleteComment(int id) async {
    return _deleteEntryCommentUseCase.execute(id);
  }
}
