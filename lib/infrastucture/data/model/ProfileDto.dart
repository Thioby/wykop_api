import 'package:equatable/equatable.dart';
import 'package:wykop_api/domain/mapper/mapper.dart';
import 'package:wykop_api/infrastucture/api.dart';

class ProfileDto implements Equatable {
  final String login;
  final int color;
  final String sex;
  final String signupAt;
  final bool isBlocked;
  final bool isObserved;
  final int followers;
  final String background;
  final int linksAddedCount;
  final int linksPublishedCount;
  final String avatarUrl;
  final int rank;
  final String violationUrl;
  final String about;
  ProfileDto({
    this.login,
    this.color,
    this.sex,
    this.signupAt,
    this.isBlocked = false,
    this.isObserved = false,
    this.followers = 0,
    this.background,
    this.linksAddedCount = 0,
    this.linksPublishedCount = 0,
    this.avatarUrl,
    this.rank = 0,
    this.violationUrl,
    this.about,
  });

  @override
  List<Object> get props => [login, color, followers, linksAddedCount, linksPublishedCount, isBlocked, isObserved];

  @override
  bool get stringify => true;
}

class ProfileResponseToProfileDtoMapper implements DataMapper<ProfileResponse, ProfileDto> {
  @override
  ProfileDto apply(ProfileResponse response) {
    return ProfileDto(
      login: response.login,
      color: response.color,
      sex: response.sex,
      signupAt: response.signupAt,
      isBlocked: response.isBlocked,
      isObserved: response.isObserved,
      followers: response.followers,
      background: response.background,
      linksPublishedCount: response.linksPublishedCount,
      linksAddedCount: response.linksAddedCount,
      avatarUrl: response.avatarUrl,
      rank: response.rank,
      violationUrl: response.violationUrl,
      about: response.about,
    );
  }
}
