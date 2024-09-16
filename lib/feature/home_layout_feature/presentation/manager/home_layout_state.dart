part of 'home_layout_cubit.dart';

@immutable
abstract class HomeLayoutState {
  Widget viewTap();
}

class HomeState extends HomeLayoutState {
  @override
  Widget viewTap() => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<GetPopularCampaignCubit>()..getPopularCampaign("Factory"),
          ),
          BlocProvider(
            create: (context) =>
                getIt<GetNormalCampaignCubit>()..getNormalCampaign("Factory"),
          ),
          BlocProvider(
            create: (context) => getIt<WishlistCubit>(),
          )
        ],
        child: const HomeScreen(),
      );
}

class SearchState extends HomeLayoutState {
  @override
  Widget viewTap() => BlocProvider(
        create: (context) => getIt<SearchCubit>(),
        child: const SearchView(),
      );
}

class WishListState extends HomeLayoutState {
  @override
  Widget viewTap() => BlocProvider(
        create: (context) => getIt<WishlistCubit>()..getWishlist(),
        child: const WishlistScreen(),
      );
}

class AccountState extends HomeLayoutState {
  @override
  Widget viewTap() => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<AdvertiseInfoCubit>()..getAdvertiseInfo(),
          ),
          BlocProvider(
            create: (context) => getIt<DeleteAccountCubit>(),
          )
        ],
        child: const AccountScreen(),
      );
}
