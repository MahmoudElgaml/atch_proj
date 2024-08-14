import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'link_feature_state.dart';
@singleton
@injectable
class LinkFeatureCubit extends Cubit<LinkFeatureState> {
  LinkFeatureCubit() : super(LinkFeatureInitial());
  static  LinkFeatureCubit get(context)=>BlocProvider.of(context);
  List<String> links=[];

  addLink(String link){
    links.add(link);
    emit(LinkFeatureAddSuccess());

  }
}
