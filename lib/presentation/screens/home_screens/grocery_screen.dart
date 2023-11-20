import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/presentation/widget/grocery_page_widget/grocery_card_widget.dart';
import 'package:recipe_app/presentation/widget/search_bar_widget.dart';

import '../../../core/constants/string_constants.dart';
import '../../bloc/grocery_page_bloc/grocery_page_bloc.dart';
import '../../widget/appbar_title_row_widget.dart';
// import 'package:recipe_app/domain/entity/recipe_entity/recipe_entity.dart';

@RoutePage()
class GroceryPage extends StatelessWidget {
  const GroceryPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitleRowWidget(
          pageTitle: StringConstants.kgroceryText,
          appBarButtonOnTap: () {},
        ),
      ),
      body: BlocProvider(
        create: (context) => GetIt.I<GroceryPageBloc>()
          ..add(
            GroceryPageInitialEvent(),
          ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              8,
            ),
            child: BlocBuilder<GroceryPageBloc, GroceryPageState>(
              builder: (context, state) {
                if (state is GroceryPageSuccessState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SearchBarWidget(),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.grocerItemList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: GroceryCard(
                                groceryDataEntity: state.grocerItemList[index],
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
