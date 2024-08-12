part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {
 final  SearchItemModel searchItemModel;

  SearchSuccessState(this.searchItemModel);
}
class SearchFailState extends SearchState {
  final String message;

  SearchFailState(this.message);
}
