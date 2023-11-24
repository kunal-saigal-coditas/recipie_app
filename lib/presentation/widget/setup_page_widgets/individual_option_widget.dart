import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';
import 'package:recipe_app/presentation/bloc/setup_bloc/setup_bloc.dart';

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
    return BlocBuilder<SetupBloc, SetupState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ButtonStyle(
            elevation: const MaterialStatePropertyAll(0),
            backgroundColor: MaterialStatePropertyAll(
              answerItemEntity.isSelected
                  ? ColorConstants.primaryColor
                  : ColorConstants.whiteBackgraound,
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30.r,
                ),
                side: const BorderSide(
                  color: ColorConstants.cicularPageIndicatorBackgroundColor,
                ),
              ),
            ),
          ),
          onPressed: () {
            BlocProvider.of<SetupBloc>(context).add(
              OnSelectEvent(
                answerItemEntity: answerItemEntity,
                answerItemList: answerItemList,
              ),
            );
          },
          child: Text(
            answerItemEntity.text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: answerItemEntity.isSelected
                  ? ColorConstants.whiteBackgraound
                  : ColorConstants.primaryTextColor,
            ),
          ),
        );
      },
    );
  }
}
