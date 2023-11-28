import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';

import 'package:recipe_app/domain/entity/preferences_data_entity/preferences_data_entity.dart';

import 'package:recipe_app/presentation/screens/preferences_screen/widgets/individual_option_widget.dart';

class PreferencesBodyWidget extends StatelessWidget {
  const PreferencesBodyWidget({
    super.key,
    required this.preferencesDataEntity,
    required this.answerItemList,
  });
  final PreferencesDataEntity preferencesDataEntity;
  final List<AnswerItemEntity> answerItemList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          preferencesDataEntity.question,
          style: GoogleFonts.cabin(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          preferencesDataEntity.description,
          style: TextStyleConstants.s16w400c001E00,
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: (MediaQuery.of(context).size.height * 0.48),
          ),
          child: SingleChildScrollView(
              child: Wrap(
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.start,
            children: [
              ...List.generate(
                preferencesDataEntity.answerItemList.length,
                (index) => IndividualOptionWidget(
                  answerItemEntity: preferencesDataEntity.answerItemList[index],
                  answerItemList: answerItemList,
                ),
              ),
            ],
          )),
        ),
      ],
    );
  }
}
