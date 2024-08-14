part of 'link_feature_cubit.dart';

@immutable
abstract class LinkFeatureState {}

class LinkFeatureInitial extends LinkFeatureState {}
class LinkFeatureAddSuccess extends LinkFeatureState {}
class LinkFeatureDeleteSuccess extends LinkFeatureState {}
