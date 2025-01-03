// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/Home/stores/data/models/stores_model/store.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

import '../../../data/repository/show_stores_service.dart';

part 'stores_event.dart';
part 'stores_state.dart';

class StoresBloc extends Bloc<StoresEvent, StoresState> {
  int currentPage = 1;
  bool hasMore = false;

  StoresBloc() : super(StoresInitial()) {
    on<FetchStores>((onFetchStores));
  }

  Future<void> onFetchStores(
      FetchStores event, Emitter<StoresState> emit) async {
    // emit(
    //   StoresInitial());
      // hasMore = true;

    if (state is StoresLoading || state is StoresLoadingMore) {
      return;
    }
    try {
      List<Store> currentStores = [];
      if (state is StoresLoaded || state is StoresLoadingMore) {
        currentStores =
            (state as dynamic).allStores; // أعد الكتابة لتكون أكثر أمانًا

      }


      final result =
          await ShowStoresService(api: Api()).getStores(page: currentPage);
      emit(StoresLoadingMore(allStores: currentStores));

      result.fold(
        (l) {
          emit(StoresError(l.message));
        },
        (r) {
          // hasMore = r.pagination?.nextPageUrl != null;
          // currentPage = hasMore ? currentPage + 1 : currentPage;
         
          if (r.pagination?.nextPageUrl != null) {
            hasMore = true;
            currentPage += 1;
          } else {
            hasMore = false;
          }
         
          final allStores = List<Store>.from(currentStores)
            ..addAll(r.data?.data ?? []);

//  final allStores=[...currentStores,...?r.data?.data];
          emit(StoresLoaded(allStores: allStores, hasReachedMax: !hasMore));
        },
      );
    } catch (e) {
      emit(StoresError("Failed to fetch stores: $e"));
    }
  }
}
