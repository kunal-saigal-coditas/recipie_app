import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import 'package:recipe_app/presentation/widget/grocery_page_widget/grocery_card_widget.dart';
import 'package:recipe_app/presentation/widget/common_widget/search_bar_widget.dart';

import '../../../core/constants/string_constants.dart';
import '../../bloc/grocery_page_bloc/grocery_page_bloc.dart';
import '../../widget/common_widget/appbar_title_row_widget.dart';

@RoutePage()
class GroceryPage extends StatelessWidget {
  const GroceryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<GroceryPageBloc>()
        ..add(
          GroceryPageInitialEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitleRowWidget(
            pageTitle: StringConstants.kgroceryText,
            appBarButtonOnTap: () {},
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.h,
              left: 16.w,
              right: 16.w,
            ),
            child: BlocBuilder<GroceryPageBloc, GroceryPageState>(
              builder: (context, state) {
                if (state is GroceryPageSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SearchBarWidget(),
                      SizedBox(
                        height: 16.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.groceryItemList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: 8.h,
                              ),
                              child: GroceryCard(
                                groceryDataEntity: state.groceryItemList[index],
                              ),
                            );
                          },
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
      ),
    );
  }
}
