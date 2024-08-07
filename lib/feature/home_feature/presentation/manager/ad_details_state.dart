part of 'ad_details_cubit.dart';

@immutable
sealed class AdDetailsState {}

final class AdDetailsInitial extends AdDetailsState {}
final class AdDetailsLoadingState extends AdDetailsState {}
final class AdDetailsSuccessState extends AdDetailsState {}
final class AdDetailsFailState extends AdDetailsState {
  final String errMessage;
  AdDetailsFailState(this.errMessage);
}
