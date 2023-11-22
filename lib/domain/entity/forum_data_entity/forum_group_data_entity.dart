import 'package:equatable/equatable.dart';

class ForumGroupsDataEntity extends Equatable {
  final String groupName;
  final String groupFollowerCount;
  final String groupPic;
  final bool isJoined;

  const ForumGroupsDataEntity({
    required this.groupName,
    required this.groupFollowerCount,
    required this.groupPic,
    required this.isJoined,
  });

  @override
  List<Object?> get props => [
        groupName,
        groupPic,
        groupFollowerCount,
      ];
}
