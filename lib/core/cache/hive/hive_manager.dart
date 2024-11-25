import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../feature/auth_feature/auth/data/model/UserData.dart';

@singleton
@injectable
class HiveManager {
  Future<void> inti() async {
    await Hive.initFlutter();

    _registerAdapter();
    await _openBox();
  }

  void _registerAdapter() {
    Hive.registerAdapter(PersonAdapter());
    Hive.registerAdapter(UserLocationsAdapter());
    Hive.registerAdapter(UserLocation0Adapter());
    Hive.registerAdapter(UserLocation1Adapter());
  }

  Future<void> _openBox() async {
    await Hive.openBox<Person>(HiveKeys.userBox);
    await Hive.openBox<num>(HiveKeys.wishlistBox);
  }

  Future<void> cacheData<T>(
      {required String boxKey, List<T>? dataList, T? dataItem}) async {
    var box = Hive.box<T>(boxKey);

    if (dataList != null) {
      box.addAll(dataList);
    } else if (dataItem != null) {
     await box.put(0,dataItem);
    }
  }

  T? retrieveSingleData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);
    return box.get(0);
  }
  List<T> retrieveListData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);
    return box.values.toList();
  }

  Future<void> cacheNormalData<T>(
      {required String boxKey, List<T>? dataList, T? dataItem}) async {
    var box = Hive.box<T>(boxKey);

    if (dataList != null) {
      box.addAll(dataList);
    } else if (dataItem != null) {
      await box.put(dataItem,dataItem);
    }
  }



  Future<void> deleteAllData<T>(String boxKey) async {
    await Hive.box<T>(boxKey).clear();

  }
  Future<void> deleteSpecificData<T>(String boxKey,T key) async {
    var box = Hive.box<T>(boxKey);
    await box.delete(key);
  }

}
