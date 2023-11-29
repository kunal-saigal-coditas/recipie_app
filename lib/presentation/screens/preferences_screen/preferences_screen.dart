import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/constants/text_style_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';

import 'package:recipe_app/presentation/common/rounded_button_widget.dart';
import 'package:recipe_app/presentation/screens/preferences_screen/bloc/preferences_bloc.dart';
import 'package:recipe_app/presentation/screens/preferences_screen/widgets/circular_page_number_widget.dart';
import 'package:recipe_app/presentation/screens/preferences_screen/widgets/preferences_page_alert_box_widget.dart';
import 'package:recipe_app/presentation/screens/preferences_screen/widgets/preferences_page_body_widget.dart';

@RoutePage()
class PreferencePage extends StatelessWidget {
  const PreferencePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<PreferencesBloc>()
        ..add(
          PreferencesInitialEvent(),
        ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(
            20,
            28,
            20,
            28,
          ),
          child: BlocBuilder<PreferencesBloc, PreferencesState>(
            builder: (context, state) {
              if (state is PreferencesLoadedState) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ...List.generate(
                          5,
                          (index) => CircularPageNumberIndicatorWidget(
                            pageNumber: index + 1,
                            isSelected: index == state.pageIndex,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          child: const Text(
                            StringConstants.kskipText,
                            style: TextStyleConstants.s16w500cF85657,
                          ),
                          onTap: () {
                            AutoRouter.of(context).replace(
                              const BottomNavRoute(),
                            );
                          },
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PreferencesBodyWidget(
                      preferencesDataEntity:
                          state.preferencesDataList[state.pageIndex],
                      answerItemList: state.answerItemList,
                    ),
                    const Spacer(),
                    state.pageIndex == 0
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: RoundedButton(
                              title: StringConstants.knextStepText,
                              colour: ColorConstants.c86BF3E,
                              onPressed: () {
                                BlocProvider.of<PreferencesBloc>(context).add(
                                  OnNextEvent(),
                                );
                              },
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RoundedButton(
                                  title: StringConstants.kpreviousText,
                                  titleColour: ColorConstants.c001E00,
                                  onPressed: () {
                                    if (state.pageIndex > 0) {
                                      BlocProvider.of<PreferencesBloc>(context)
                                          .add(
                                        OnPreviousEvent(),
                                      );
                                    }
                                  },
                                  colour: ColorConstants.cFFFFFF,
                                ),
                                RoundedButton(
                                  title: StringConstants.knextStepText,
                                  onPressed: () {
                                    if (state.pageIndex < 4) {
                                      BlocProvider.of<PreferencesBloc>(context)
                                          .add(
                                        OnNextEvent(),
                                      );
                                    } else {
                                      Future.delayed(
                                          const Duration(
                                            seconds: 2,
                                          ), () {
                                        AutoRouter.of(context).replace(
                                          const BottomNavRoute(),
                                        );
                                      });
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                              horizontal: 16.w,
                                              vertical: 16.h,
                                            ),
                                            alignment: Alignment.center,
                                            content: SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child:
                                                  const PreferencesAlertBoxWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  colour: ColorConstants.c86BF3E,
                                ),
                              ],
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
    );
  }
}
