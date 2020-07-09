import 'package:wykop_api/domain/entries/entry_action_type.dart';

String getActionNameByType(EntryActionsType type) {
  switch (type) {
    case EntryActionsType.OBSERVED:
      return 'observed';
    case EntryActionsType.HOT:
      return 'hot';
    case EntryActionsType.STREAM:
      return 'stream';
    case EntryActionsType.ACTIVE:
      return 'active';
  }

  throw 'Not allowed action type';
}
