import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager{
   void inti()async{
    await  Hive.initFlutter();


}

void _registerAdapter(){

}
void _openBox(){



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