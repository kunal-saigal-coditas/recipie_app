import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/domain/entity/preferences_data_entity/preferences_data_entity.dart';
import 'package:recipe_app/presentation/screens/preferences_screen/bloc/preferences_bloc.dart';

class IndividualOptionWidget extends StatelessWidget {
  const IndividualOptionWidget({
    super.key,
    required this.answerItemEntity,
    required this.answerItemList,
  });
  final AnswerItemEntity answerItemEntity;
  final List<AnswerItemEntity> answerItemList;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
          answerItemEntity.isSelected
              ? ColorConstants.c86BF3E
              : ColorConstants.cFFFFFF,
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.fromLTRB(
            10,
            7,
            10,
            7,
          ),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.r,
            ),
            side: const BorderSide(
              color: ColorConstants.cB2BBB2,
            ),
          ),
        ),
      ),
      onPressed: () {
        BlocProvider.of<PreferencesBloc>(context).add(
          OnSelectEvent(
            answerItemEntity: answerItemEntity,
            answerItemList: answerItemList,
          ),
        );
      },
      child: Text(
        answerItemEntity.text,
        style: TextStyleConstants.s14w500c001E00.copyWith(
          color: answerItemEntity.isSelected
              ? ColorConstants.cFFFFFF
              : ColorConstants.c001E00,
        ),
      ),
    );
  }
}
