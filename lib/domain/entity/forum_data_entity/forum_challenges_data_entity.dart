import 'package:equatable/equatable.dart';

class ForumChallengesDataEntity extends Equatable {
  final String imageUrl;
  final String challengeName;
  final String challengeSubtext;
  final int date;
  final String month;

  const ForumChallengesDataEntity({
    required this.imageUrl,
    required this.challengeName,
    required this.challengeSubtext,
    required this.date,
    required this.month,
  });

  @override
  List<Object?> get props => [
        imageUrl,
        challengeName,
        challengeSubtext,
        date,
        month,
      ];
}
