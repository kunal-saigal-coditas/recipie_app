import 'package:equatable/equatable.dart';

class SetupDataEntity extends Equatable {
  final String question;
  final String description;
  final List<String> itemList;
  const SetupDataEntity(this.itemList,
      {required this.question, required this.description});

  @override
  List<Object?> get props => [question, description];
}

enum AnswerBoxType { SelectType, NormalType }
