import 'package:atch_proj/core/cache/hive/hive_keyes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../feature/auth_feature/auth/data/model/UserData.dart';

class HiveManager{
   void inti()async{
    await  Hive.initFlutter();
   _registerAdapter();
   _openBox();

}

void _registerAdapter(){
   Hive.registerAdapter(PersonAdapter());
}
void _openBox(){
 Hive.openBox<Person>(HiveKeys.userBox);



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


}