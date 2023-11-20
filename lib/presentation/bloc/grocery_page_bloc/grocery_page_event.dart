part of 'grocery_page_bloc.dart';

sealed class GroceryPageEvent {
  const GroceryPageEvent();
}

final class GroceryPageInitialEvent extends GroceryPageEvent {}
