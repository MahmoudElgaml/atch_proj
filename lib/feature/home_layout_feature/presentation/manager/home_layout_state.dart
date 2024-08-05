part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {
  Widget viewTap();
}


class HomeState extends HomeLayoutState {
  @override
  Widget viewTap()=>const HomeScreen();
}

class SearchState extends HomeLayoutState {
  @override
  Widget viewTap()=>const SearchView();
}
class WishListState extends HomeLayoutState {
  @override
  Widget viewTap() =>const WishlistScreen();

}
class AccountState extends HomeLayoutState {
  @override
  Widget viewTap() =>const AccountScreen();

}
