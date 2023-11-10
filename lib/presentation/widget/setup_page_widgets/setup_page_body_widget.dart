import 'package:flutter/material.dart';
import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';
import 'package:recipe_app/presentation/widget/setup_page_widgets/individual_option_widget.dart';

class SetupPageBodyWidget extends StatelessWidget {
  const SetupPageBodyWidget({super.key, required this.setupDataEntity});
  final SetupDataEntity setupDataEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          setupDataEntity.question,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          setupDataEntity.description,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.45),
          child: SingleChildScrollView(
            child: Wrap(
                direction: Axis.horizontal,
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.start,
                children: [
                  ...List.generate(
                    setupDataEntity.answerItemList.length,
                    (index) => IndividualOptionWidget(
                      answerItemEntity: setupDataEntity.answerItemList[index],
                    ),
                  ),
                  // ...setupDataEntity.answerItemList.map((e) {
                  //   return IndividualOptionWidget(
                  //     text: e,
                  //     answerBoxType: setupDataEntity.answerBoxType,
                  //   );
                  // }).toList(),
                ]),
          ),
        )
      ],
    );
  }
}
