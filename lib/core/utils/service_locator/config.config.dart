// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../../feature/account_feature/advertise/data/repo/advertise_account_repo.dart'
    as _i692;
import '../../../feature/account_feature/advertise/data/repo/advertise_account_repo_impl.dart'
    as _i92;
import '../../../feature/account_feature/advertise/presentation/manager/advertise_info_cubit.dart'
    as _i959;
import '../../../feature/account_feature/user/data/repo/user_account_repo.dart'
    as _i645;
import '../../../feature/account_feature/user/data/repo/user_account_repo_impl.dart'
    as _i463;
import '../../../feature/account_feature/user/presentation/manager/recently_viewed_cubit.dart'
    as _i830;
import '../../../feature/account_feature/user/presentation/manager/used_offer_cubit.dart'
    as _i539;
import '../../../feature/add_edit_campagin_feature/data/repo/add_campaign_repo.dart'
    as _i793;
import '../../../feature/add_edit_campagin_feature/data/repo/add_campaign_repo_impl.dart'
    as _i11;
import '../../../feature/add_edit_campagin_feature/presentaion/manager/add_campaign_cubit.dart'
    as _i376;
import '../../../feature/add_edit_campagin_feature/presentaion/manager/add_image_cubit.dart'
    as _i864;
import '../../../feature/add_edit_campagin_feature/presentaion/manager/change_date_cubit.dart'
    as _i395;
import '../../../feature/add_edit_campagin_feature/presentaion/manager/link_feature_cubit.dart'
    as _i973;
import '../../../feature/add_edit_campagin_feature/presentaion/manager/old_image_cubit.dart'
    as _i216;
import '../../../feature/advertiser_info_feature/data/repo/adv_info_impl.dart'
    as _i509;
import '../../../feature/advertiser_info_feature/data/repo/adv_info_repo.dart'
    as _i513;
import '../../../feature/advertiser_info_feature/presentaion/manager/adv_info_cubit.dart'
    as _i553;
import '../../../feature/auth_feature/auth/data/repo/auth_repo.dart' as _i283;
import '../../../feature/auth_feature/auth/data/repo/auth_repo_impl.dart'
    as _i188;
import '../../../feature/auth_feature/auth/presentation/manger/auth_cubit.dart'
    as _i1035;
import '../../../feature/home_feature/data/repo/home_repo.dart' as _i651;
import '../../../feature/home_feature/data/repo/home_repo_impl.dart' as _i766;
import '../../../feature/home_feature/presentation/manager/get_normal_campagin_cubit.dart'
    as _i369;
import '../../../feature/home_feature/presentation/manager/get_popular_campaign_cubit.dart'
    as _i401;
import '../../../feature/home_layout_feature/presentation/manager/home_layout_cubit.dart'
    as _i637;
import '../../../feature/search_feature/data/repo/search_repo.dart' as _i341;
import '../../../feature/search_feature/data/repo/search_repo_impl.dart'
    as _i523;
import '../../../feature/search_feature/presentation/manger/search_cubit.dart'
    as _i694;
import '../../../feature/unite_testing/manger/test_cubit.dart' as _i552;
import '../../../feature/wishlist_feature/data/repo/wishlist_repo.dart'
    as _i965;
import '../../../feature/wishlist_feature/data/repo/wishlist_repo_impl.dart'
    as _i325;
import '../../../feature/wishlist_feature/presentation/manger/wishlist_cubit.dart'
    as _i878;
import '../../api/api_manger.dart' as _i254;
import '../../cache/hive/hive_manager.dart' as _i125;
import '../../cache/storage_token.dart' as _i353;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i864.AddImageCubit>(() => _i864.AddImageCubit());
    gh.factory<_i395.ChangeDateCubit>(() => _i395.ChangeDateCubit());
    gh.factory<_i973.LinkFeatureCubit>(() => _i973.LinkFeatureCubit());
    gh.factory<_i637.HomeLayoutCubit>(() => _i637.HomeLayoutCubit());
    gh.factory<_i216.OldImageCubit>(() => _i216.OldImageCubit());
    gh.singleton<_i254.APiManger>(() => _i254.APiManger());
    gh.singleton<_i125.HiveManager>(() => _i125.HiveManager());
    gh.singleton<_i353.StorageToken>(() => _i353.StorageToken());
    gh.factory<_i692.AdvertiseAccountRepo>(() => _i92.AdvertiseAccountRepoImpl(
          gh<_i254.APiManger>(),
          gh<_i353.StorageToken>(),
        ));
    gh.factory<_i965.WishlistRepo>(() => _i325.WishlistRepoImpl(
          gh<_i254.APiManger>(),
          gh<_i353.StorageToken>(),
        ));
    gh.factory<_i513.AdvInfoRepo>(() => _i509.AdvInfoImpl(
          gh<_i254.APiManger>(),
          gh<_i353.StorageToken>(),
        ));
    gh.factory<_i645.UserAccountRepo>(() => _i463.AccountRepoImpl(
          gh<_i254.APiManger>(),
          gh<_i353.StorageToken>(),
        ));
    gh.factory<_i553.AdvInfoCubit>(
        () => _i553.AdvInfoCubit(gh<_i513.AdvInfoRepo>()));
    gh.factory<_i959.AdvertiseInfoCubit>(
        () => _i959.AdvertiseInfoCubit(gh<_i692.AdvertiseAccountRepo>()));
    gh.factory<_i552.TestCubit>(
        () => _i552.TestCubit(gh<_i692.AdvertiseAccountRepo>()));
    gh.factory<_i651.HomeRepo>(() => _i766.HomeRepoImpl(gh<_i254.APiManger>()));
    gh.factory<_i878.WishlistCubit>(
        () => _i878.WishlistCubit(gh<_i965.WishlistRepo>()));
    gh.factory<_i369.GetNormalCampaginCubit>(
        () => _i369.GetNormalCampaginCubit(gh<_i651.HomeRepo>()));
    gh.factory<_i401.GetPopularCampaignCubit>(
        () => _i401.GetPopularCampaignCubit(gh<_i651.HomeRepo>()));
    gh.factory<_i793.AddCampaignRepo>(
        () => _i11.AddCampaignRepoImpl(gh<_i254.APiManger>()));
    gh.factory<_i341.SearchRepo>(
        () => _i523.SearchRepoImpl(gh<_i254.APiManger>()));
    gh.factory<_i283.AuthRepo>(() => _i188.AuthRepoImpl(
          gh<_i254.APiManger>(),
          gh<_i353.StorageToken>(),
          gh<_i125.HiveManager>(),
        ));
    gh.factory<_i830.RecentlyViewedCubit>(
        () => _i830.RecentlyViewedCubit(gh<_i645.UserAccountRepo>()));
    gh.factory<_i539.UsedOfferCubit>(
        () => _i539.UsedOfferCubit(gh<_i645.UserAccountRepo>()));
    gh.factory<_i376.AddCampaignCubit>(
        () => _i376.AddCampaignCubit(gh<_i793.AddCampaignRepo>()));
    gh.factory<_i694.SearchCubit>(
        () => _i694.SearchCubit(gh<_i341.SearchRepo>()));
    gh.singleton<_i1035.AuthCubit>(
        () => _i1035.AuthCubit(gh<_i283.AuthRepo>()));
    return this;
  }
}
