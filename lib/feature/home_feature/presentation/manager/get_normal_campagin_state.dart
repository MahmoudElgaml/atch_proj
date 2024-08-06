part of 'get_normal_campagin_cubit.dart';

@immutable
abstract class GetNormalCampaginState {}

class GetNormalCampaginInitial extends GetNormalCampaginState {}
class GetNormalCampaginLoadingState extends GetNormalCampaginState {}
class GetNormalCampaginSuccessState extends GetNormalCampaginState {}
class GetNormalCampaginFailState extends GetNormalCampaginState {

 final  String mesage;

 GetNormalCampaginFailState(this.mesage);
}
