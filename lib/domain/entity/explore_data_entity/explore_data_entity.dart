import 'package:equatable/equatable.dart';

class ExploreDataEntity extends Equatable {
  final String categoryName;
  final String categoryImage;

  const ExploreDataEntity({
    required this.categoryName,
    required this.categoryImage,
  });
  @override
  List<Object?> get props => [
        categoryImage,
        categoryName,
      ];
}
