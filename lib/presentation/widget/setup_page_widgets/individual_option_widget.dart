import 'package:flutter/material.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/domain/entity/setup_data_entity.dart';

class IndividualOptionWidget extends StatefulWidget {
  const IndividualOptionWidget({
    super.key,
    required this.answerItemEntity,
  });
  final AnswerItemEntity answerItemEntity;

  @override
  State<IndividualOptionWidget> createState() => _IndividualOptionWidgetState();
}

class _IndividualOptionWidgetState extends State<IndividualOptionWidget> {
  // bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
          widget.answerItemEntity.isSelected
              ? ColorConstants.primaryColor
              : ColorConstants.whiteBackgraound,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: const BorderSide(
              color: Color(0XFFC9CDC9),
            ),
          ),
        ),
      ),
      onPressed: () {
        setState(() {
          widget.answerItemEntity.isSelected =
              !widget.answerItemEntity.isSelected;
        });
      },
      // onPressed: () {
      //   // setState(() {
      //   //   isSelected = !isSelected;
      //   // });
      // },
      child: Text(
        widget.answerItemEntity.text,
        style: TextStyle(
          fontSize: 14,
          color: widget.answerItemEntity.isSelected
              ? ColorConstants.whiteBackgraound
              : Colors.black,
        ),
      ),
    );
  }
}
