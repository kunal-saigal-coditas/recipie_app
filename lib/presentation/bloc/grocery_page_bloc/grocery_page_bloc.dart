import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:recipe_app/domain/entity/grocery_data_entity/grocery_data_entity.dart';
import 'package:recipe_app/domain/use_case/grocery_data_usecase.dart';

part 'grocery_page_event.dart';
part 'grocery_page_state.dart';

class GroceryPageBloc extends Bloc<GroceryPageEvent, GroceryPageState> {
  final GroceryDataUseCase groceryDataUseCase;
  GroceryPageBloc({
    required this.groceryDataUseCase,
  }) : super(GroceryPageInitial()) {
    on<GroceryPageInitialEvent>(groceryPageInitialEvent);
  }

  FutureOr<void> groceryPageInitialEvent(
      GroceryPageInitialEvent event, Emitter<GroceryPageState> emit) {
    emit(
      GroceryPageSuccessState(
        grocerItemList: groceryDataUseCase.grocerItemList(),
      ),
    );
  }
}
