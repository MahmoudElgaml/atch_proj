import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:hive/hive.dart';
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
  }

  Future<void> _openBox() async {
    await Hive.openBox<Person>(HiveKeys.userBox);
  }

  void cacheData<T>(
      {required String boxKey, List<T>? dataList, T? dataItem}) async {
    var box = Hive.box<T>(boxKey);

    if (dataList != null) {
      box.addAll(dataList);
    } else if (dataItem != null) {
      box.add(dataItem);
    }
  }

  List<T> retrieveData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);

    return box.values.toList();
  }

  deleteData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);
  }
}
