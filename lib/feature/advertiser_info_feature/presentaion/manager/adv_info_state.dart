part of 'adv_info_cubit.dart';

@immutable
abstract class AdvInfoState {}

class AdvInfoInitial extends AdvInfoState {}
class AdvInfoLoadingState extends AdvInfoState {}
class AdvInfoSuccessState extends AdvInfoState {}
class AdvInfoEmptyState extends AdvInfoState {}

class AdvInfoFailState extends AdvInfoState {
  final String message;

  AdvInfoFailState(this.message);
}
