part of 'wishlist_cubit.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoadingState extends WishlistState {}

class WishlistFailState extends WishlistState {
  final String message;

  WishlistFailState(this.message);
}

class WishlistSuccessState extends WishlistState {}
class WishlistAddedSuccessState extends WishlistState {}

class WishlistEmptyState extends WishlistState {}
