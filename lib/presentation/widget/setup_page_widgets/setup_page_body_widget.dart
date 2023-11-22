import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/domain/entity/setup_data_entity/setup_data_entity.dart';
import 'package:recipe_app/presentation/widget/setup_page_widgets/individual_option_widget.dart';

import '../../bloc/setup_bloc/setup_bloc.dart';

class SetupPageBodyWidget extends StatelessWidget {
  const SetupPageBodyWidget({
    super.key,
    required this.setupDataEntity,
  });
  final SetupDataEntity setupDataEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          setupDataEntity.question,
          style: GoogleFonts.cabin(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          setupDataEntity.description,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.56,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<SetupBloc, SetupState>(
              builder: (context, state) {
                if (state is SetupPageLoadedState) {
                  return Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.start,
                    children: [
                      ...List.generate(
                        setupDataEntity.answerItemList.length,
                        (index) => IndividualOptionWidget(
                          answerItemEntity:
                              setupDataEntity.answerItemList[index],
                          answerItemList: state.answerItemList,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
