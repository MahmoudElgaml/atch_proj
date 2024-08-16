part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}
class WishlistLoadingState extends WishlistState {}
class WishlistFailState extends WishlistState {
 final  String message;

 WishlistFailState(this.message);
}
class WishlistSuccessState extends WishlistState {
 final  List<Campaigns?>? campaigns;

WishlistSuccessState({this.campaigns});
}
class WishlistEmptyState extends WishlistState {}

