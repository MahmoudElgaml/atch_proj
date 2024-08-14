import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'change_date_state.dart';
@injectable
class ChangeDateCubit extends Cubit<ChangeDateState> {
  ChangeDateCubit() : super(ChangeDateInitial());
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime.now();
  static ChangeDateCubit get(context)=>BlocProvider.of(context);

  Future<void> showFirstDate(BuildContext context) async {
    firstDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
        initialDate: firstDate)??firstDate;
    emit(ChangeDateSuccess());
    emit(ChangeDateInitial());
  }
  Future<void> showLastDate(BuildContext context) async {
    lastDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2040),
        initialDate: lastDate)??lastDate;
    emit(ChangeDateSuccess());
    emit(ChangeDateInitial());
  }
}
