// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
import '../../api/api_manger.dart' as _i254;
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
    gh.factory<_i637.HomeLayoutCubit>(() => _i637.HomeLayoutCubit());
    gh.singleton<_i254.APiManger>(() => _i254.APiManger());
    gh.singleton<_i353.StorageToken>(() => _i353.StorageToken());
    gh.factory<_i283.AuthRepo>(() => _i188.AuthRepoImpl(
          gh<_i254.APiManger>(),
          gh<_i353.StorageToken>(),
        ));
    gh.factory<_i651.HomeRepo>(() => _i766.HomeRepoImpl(gh<_i254.APiManger>()));
    gh.singleton<_i1035.AuthCubit>(
        () => _i1035.AuthCubit(gh<_i283.AuthRepo>()));
    gh.factory<_i369.GetNormalCampaginCubit>(
        () => _i369.GetNormalCampaginCubit(gh<_i651.HomeRepo>()));
    gh.factory<_i401.GetPopularCampaignCubit>(
        () => _i401.GetPopularCampaignCubit(gh<_i651.HomeRepo>()));
    return this;
  }
}
