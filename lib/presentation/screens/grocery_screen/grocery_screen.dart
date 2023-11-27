import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/core/constants/string_constants.dart';
import 'package:recipe_app/presentation/common/appbar_title_row_widget.dart';
import 'package:recipe_app/presentation/screens/grocery_screen/bloc/grocery_page_bloc.dart';

import 'package:recipe_app/presentation/screens/grocery_screen/widgets/grocery_card_widget.dart';
import 'package:recipe_app/presentation/common/search_bar_widget.dart';

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
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
              right: 20,
            ),
            child: BlocBuilder<GroceryPageBloc, GroceryPageState>(
              builder: (context, state) {
                if (state is GroceryPageSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SearchBarWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 14,
                            );
                          },
                          itemCount: state.groceryItemList.length,
                          itemBuilder: (context, index) {
                            return GroceryCard(
                              groceryDataEntity: state.groceryItemList[index],
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
