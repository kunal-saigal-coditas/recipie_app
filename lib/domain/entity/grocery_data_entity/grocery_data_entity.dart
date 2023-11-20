import 'package:equatable/equatable.dart';

class GroceryDataEntity extends Equatable {
  final String groceryName;
  final String grocerySubtext;
  final String groceryImageUrl;
  final bool isDone;

  const GroceryDataEntity({
    required this.groceryName,
    required this.grocerySubtext,
    required this.groceryImageUrl,
    required this.isDone,
  });

  @override
  List<Object?> get props => [
        groceryName,
        groceryImageUrl,
        groceryImageUrl,
        isDone,
      ];
}
