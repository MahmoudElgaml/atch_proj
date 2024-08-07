import 'package:atch_proj/feature/home_feature/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ad_details_state.dart';

class AdDetailsCubit extends Cubit<AdDetailsState> {
  AdDetailsCubit(this.homeRepo) : super(AdDetailsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchAdDetails(String category)async{
    emit(AdDetailsLoadingState());
    var result = await homeRepo.getAdDetails();

}
}
