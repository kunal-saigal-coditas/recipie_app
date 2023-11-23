import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';
import 'package:recipe_app/presentation/bloc/setup_bloc/setup_bloc.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';
import 'package:recipe_app/presentation/widget/setup_page_widgets/circular_page_number_widget.dart';
import 'package:recipe_app/presentation/widget/setup_page_widgets/setup_page_alert_box_widget.dart';
import 'package:recipe_app/presentation/widget/setup_page_widgets/setup_page_body_widget.dart';

@RoutePage()
class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SetupBloc>()
        ..add(
          SetupInitialEvent(),
        ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            16.w,
            8.h,
            16.w,
            8.h,
          ),
          child: BlocBuilder<SetupBloc, SetupState>(
            builder: (context, state) {
              if (state is SetupPageLoadedState) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16.h,
                    ),
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
                        TextButton(
                          child: const Text(
                            StringConstants.kskipText,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.redTextColor,
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    SetupPageBodyWidget(
                      setupDataEntity: state.setupPageDataList[state.pageIndex],
                    ),
                    const Spacer(),
                    state.pageIndex == 0
                        ? SizedBox(
                            width: double.infinity,
                            child: RoundedButton(
                              title: StringConstants.knextButtonText,
                              colour: ColorConstants.primaryColor,
                              onPressed: () {
                                BlocProvider.of<SetupBloc>(context).add(
                                  OnNextEvent(),
                                );
                              },
                            ),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RoundedButton(
                                  title: StringConstants.kpreviousButtonText,
                                  titleColour: ColorConstants.primaryTextColor,
                                  onPressed: () {
                                    if (state.pageIndex > 0) {
                                      BlocProvider.of<SetupBloc>(context).add(
                                        OnPreviousEvent(),
                                      );
                                    }
                                  },
                                  colour: ColorConstants.whiteBackgraound,
                                ),
                                RoundedButton(
                                  title: StringConstants.knextButtonText,
                                  onPressed: () {
                                    if (state.pageIndex < 4) {
                                      BlocProvider.of<SetupBloc>(context).add(
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
                                            content: const SizedBox(
                                              width: double.infinity,
                                              child: SetupPageAlertBoxWidget(),
                                            ),
                                          );
                                        },
                                      );
                                    }
                                  },
                                  colour: ColorConstants.primaryColor,
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
