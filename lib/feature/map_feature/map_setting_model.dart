import 'package:atch_proj/feature/map_feature/presentation/manager/map_cubit.dart';

class MapSettingModel {
  bool isFirstLocation;
  MapCubit mapCubit;

  MapSettingModel({
    required this.isFirstLocation,
    required this.mapCubit,
  });
}
