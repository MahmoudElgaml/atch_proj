import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/utils/helper.dart';

part 'change_date_state.dart';

@injectable
class ChangeDateCubit extends Cubit<ChangeDateState> {
  ChangeDateCubit() : super(ChangeDateInitial());
  String firstDate = Helper.dateToString(DateTime.now()) ;
  String lastDate = Helper.dateToString(DateTime.now()) ;
  DateTime firstSelectDate=DateTime.now();
  DateTime seconedSelectDate=DateTime.now();

  static ChangeDateCubit get(context) => BlocProvider.of(context);

  Future<void> showFirstDate(BuildContext context) async {
     firstSelectDate = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2040),
            initialDate: DateTime.now()) ??
        firstSelectDate;
    firstDate=Helper.dateToString(firstSelectDate);
    emit(ChangeDateSuccess());
    emit(ChangeDateInitial());
  }

  Future<void> showLastDate(BuildContext context) async {
    seconedSelectDate = await showDatePicker(
            context: context,
            firstDate: DateTime.now(),
            lastDate: DateTime(2040),
            initialDate: DateTime.now()) ??
        seconedSelectDate;
    lastDate=Helper.dateToString(seconedSelectDate);
    emit(ChangeDateSuccess());
    emit(ChangeDateInitial());
  }
}
