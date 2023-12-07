import 'package:recipe_app/domain/entity/forum_data_entity/forum_challenges_data_entity.dart';

class ForumChallengesDataModel extends ForumChallengesDataEntity {
  const ForumChallengesDataModel({
    required super.imageUrl,
    required super.challengeName,
    required super.challengeSubtext,
    super.date = 18,
    super.month = "Oct",
  });

  factory ForumChallengesDataModel.fromJson(Map<String, dynamic> json) {
    return ForumChallengesDataModel(
      imageUrl: json['imageUrl'] ?? '',
      challengeName: json['challengeName'] ?? '',
      challengeSubtext: json['challengeSubtext'] ?? '',
      date: json['date'] ?? 15,
      month: json['month'] ?? 'Oct',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'challengeName': challengeName,
      'challengeSubtext': challengeSubtext,
      'date': date,
      'month': month,
    };
  }
}
