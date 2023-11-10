import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/color_constants.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/core/routes/routes.dart';
import 'package:recipe_app/presentation/bloc/setup_bloc/setup_bloc.dart';
import 'package:recipe_app/presentation/widget/rounded_button_widget.dart';
import 'package:recipe_app/presentation/widget/setup_page_widgets/circular_page_number_widget.dart';
import 'package:recipe_app/presentation/widget/setup_page_widgets/setup_page_body_widget.dart';

@RoutePage()
class SetupPage extends StatelessWidget {
  const SetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SetupBloc>(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
          child: BlocBuilder<SetupBloc, SetupState>(
            builder: (context, state) {
              if (state is SetupPageLoadedState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
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
                            "Skip",
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {},
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SetupPageBodyWidget(
                      setupDataEntity: state.setupPageDataList[state.pageIndex],
                    ),
                    const Spacer(),
                    state.pageIndex == 0
                        ? SizedBox(
                            width: double.infinity,
                            child: RoundedButton(
                              title: "Next Step",
                              colour: ColorConstants.primaryColor,
                              onPressed: () {
                                BlocProvider.of<SetupBloc>(context)
                                    .add(OnNextEvent());
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
                                // const Spacer(),
                                RoundedButton(
                                  title: StringConstants.knextButtonText,
                                  onPressed: () {
                                    if (state.pageIndex < 4) {
                                      BlocProvider.of<SetupBloc>(context).add(
                                        OnNextEvent(),
                                      );
                                    } else {
                                      AutoRouter.of(context).replace(
                                        const BotttomNavRoute(),
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
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
