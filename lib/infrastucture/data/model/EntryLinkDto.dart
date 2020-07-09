import 'package:equatable/equatable.dart';
import 'package:wykop_api/infrastucture/api.dart';
import 'package:wykop_api/domain/mapper/mapper.dart';
import 'package:wykop_api/infrastucture/data/model/LinkDto.dart';

import 'EntryDto.dart';

class EntryLinkDto implements Equatable {
  final EntryDto entry;
  final LinkDto link;

  EntryLinkDto({this.entry, this.link});

  @override
  List<Object> get props => [entry, link];

  @override
  bool get stringify => true;

  bool isExpanded;
  bool get hasEntry => entry != null;

}

class EntryLinkResponseToEntryLinkDtoMapper extends DataMapper<EntryLinkResponse, EntryLinkDto> {
  final LinkResponseToLinkDtoMapper _linkDtoMapper;
  final EntryResponseToDtoMapper _entryResponseToDtoMapper;

  EntryLinkResponseToEntryLinkDtoMapper(this._linkDtoMapper, this._entryResponseToDtoMapper);

  @override
  EntryLinkDto apply(EntryLinkResponse response) {
    return EntryLinkDto(
      entry: _entryResponseToDtoMapper.apply(response.entry),
      link: _linkDtoMapper.apply(response.link),
    );
  }
}
