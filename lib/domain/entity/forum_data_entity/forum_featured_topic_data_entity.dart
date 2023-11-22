import 'package:equatable/equatable.dart';

class ForumFeaturedTopicsDataEntity extends Equatable {
  final String userName;
  final String userEmail;
  final String summary;
  final String profileImage;
  final int likesCount;
  final int repliesCount;
  final int viewsCount;

  const ForumFeaturedTopicsDataEntity({
    required this.userName,
    required this.userEmail,
    required this.summary,
    required this.profileImage,
    required this.likesCount,
    required this.repliesCount,
    required this.viewsCount,
  });

  @override
  List<Object?> get props => [
        userName,
        userEmail,
        summary,
        profileImage,
        likesCount,
        repliesCount,
        viewsCount,
      ];
}
