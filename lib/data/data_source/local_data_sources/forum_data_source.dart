import 'package:recipe_app/core/constants/asset_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum__featured_topic_data_model.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum_challenges_data_model.dart';
import 'package:recipe_app/data/data_model/forum_page_data_models/forum_groups_data_model.dart';

class ForumDataSource {
  ForumFeaturedTopicsDataModel forumFeaturedTopicsData1 =
      ForumFeaturedTopicsDataModel(
    userName: StringConstants.kfeaturedTopicsUserName[0],
    userEmail: StringConstants.kfeaturedTopicsEmail[0],
    summary: StringConstants.kfeaturedTopicsSummary[0],
    profileImage: AssetConstantStrings.kfeaturedTopicProfilePics[0],
    likesCount: 180,
    repliesCount: 100,
    viewsCount: 350,
  );
  ForumFeaturedTopicsDataModel forumFeaturedTopicsData2 =
      ForumFeaturedTopicsDataModel(
    userName: StringConstants.kfeaturedTopicsUserName[1],
    userEmail: StringConstants.kfeaturedTopicsEmail[1],
    summary: StringConstants.kfeaturedTopicsSummary[1],
    profileImage: AssetConstantStrings.kfeaturedTopicProfilePics[1],
    likesCount: 250,
    repliesCount: 120,
    viewsCount: 390,
  );
  ForumFeaturedTopicsDataModel forumFeaturedTopicsData3 =
      ForumFeaturedTopicsDataModel(
    userName: StringConstants.kfeaturedTopicsUserName[2],
    userEmail: StringConstants.kfeaturedTopicsEmail[2],
    summary: StringConstants.kfeaturedTopicsSummary[2],
    profileImage: AssetConstantStrings.kfeaturedTopicProfilePics[2],
    likesCount: 140,
    repliesCount: 80,
    viewsCount: 260,
  );

  List<ForumFeaturedTopicsDataModel> getFeaturedTopicList() {
    return [
      forumFeaturedTopicsData1,
      forumFeaturedTopicsData2,
      forumFeaturedTopicsData3,
    ];
  }

  ForumChallengesDataModel forumChallengesData1 = ForumChallengesDataModel(
    imageUrl: AssetConstantStrings.kchallengesPics[0],
    challengeName: StringConstants.kchallengesNameText,
    challengeSubtext: StringConstants.kchallengesSummary,
  );
  ForumChallengesDataModel forumChallengesData2 = ForumChallengesDataModel(
    imageUrl: AssetConstantStrings.kchallengesPics[1],
    challengeName: StringConstants.kchallengesNameText,
    challengeSubtext: StringConstants.kchallengesSummary,
  );
  List<ForumChallengesDataModel> getChallengesList() {
    return [
      forumChallengesData1,
      forumChallengesData2,
    ];
  }

  ForumGroupsDataModel forumGroupsData1 = ForumGroupsDataModel(
    groupName: StringConstants.kgroupsNames[0],
    groupFollowerCount: StringConstants.kgroupMembersCounts[0],
    groupPic: AssetConstantStrings.kgroupPics[0],
    isJoined: true,
  );
  ForumGroupsDataModel forumGroupsData2 = ForumGroupsDataModel(
    groupName: StringConstants.kgroupsNames[1],
    groupFollowerCount: StringConstants.kgroupMembersCounts[1],
    groupPic: AssetConstantStrings.kgroupPics[1],
    isJoined: false,
  );
  ForumGroupsDataModel forumGroupsData3 = ForumGroupsDataModel(
    groupName: StringConstants.kgroupsNames[2],
    groupFollowerCount: StringConstants.kgroupMembersCounts[2],
    groupPic: AssetConstantStrings.kgroupPics[2],
    isJoined: true,
  );
  ForumGroupsDataModel forumGroupsData4 = ForumGroupsDataModel(
    groupName: StringConstants.kgroupsNames[3],
    groupFollowerCount: StringConstants.kgroupMembersCounts[3],
    groupPic: AssetConstantStrings.kgroupPics[3],
    isJoined: false,
  );
  ForumGroupsDataModel forumGroupsData5 = ForumGroupsDataModel(
    groupName: StringConstants.kgroupsNames[4],
    groupFollowerCount: StringConstants.kgroupMembersCounts[4],
    groupPic: AssetConstantStrings.kgroupPics[4],
    isJoined: true,
  );
  ForumGroupsDataModel forumGroupsData6 = ForumGroupsDataModel(
    groupName: StringConstants.kgroupsNames[5],
    groupFollowerCount: StringConstants.kgroupMembersCounts[5],
    groupPic: AssetConstantStrings.kgroupPics[5],
    isJoined: false,
  );

  List<ForumGroupsDataModel> getGroupsList() {
    return [
      forumGroupsData1,
      forumGroupsData2,
      forumGroupsData3,
      forumGroupsData4,
      forumGroupsData5,
      forumGroupsData6,
    ];
  }
}
