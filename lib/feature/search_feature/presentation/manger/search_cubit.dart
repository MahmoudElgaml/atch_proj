import 'package:atch_proj/feature/search_feature/data/model/SearchItemModel.dart';
import 'package:atch_proj/feature/search_feature/data/repo/search_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {

  SearchCubit(this.searchRepo) : super(SearchInitial());
  SearchRepo searchRepo;
  static  SearchCubit get(context)=>BlocProvider.of(context);
  @override
  void emit(SearchState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
  search(String searchWord) async {
    emit(SearchLoadingState());
    var result = await searchRepo.search(searchWord);
    result.fold(
      (fail) {
        print(fail.statusCode);
        emit(SearchFailState(fail.message));
      },
      (searchItem) {
        emit(SearchSuccessState(searchItem));
      },
    );
  }
}
