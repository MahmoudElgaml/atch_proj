part of 'impression_cubit.dart';

@immutable
abstract class ImpressionState {}

class ImpressionInitial extends ImpressionState {}
class ImpressionSuccessState extends ImpressionState {}
class ImpressionFailState extends ImpressionState {}
