import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        SizedBox(
          height: 8.h,
        ),
        Text(
          setupDataEntity.description,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: (MediaQuery.of(context).size.height * 0.49).h,
          ),
          child: SingleChildScrollView(
            child: BlocBuilder<SetupBloc, SetupState>(
              builder: (context, state) {
                if (state is SetupPageLoadedState) {
                  return Wrap(
                    direction: Axis.horizontal,
                    spacing: 8.w,
                    runSpacing: 8.h,
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
