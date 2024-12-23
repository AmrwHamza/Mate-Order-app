import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/stores/data/models/stores_model/store.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/model_view/bloc/stores_bloc.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/view/widgets/store_card_shimmer.dart';

import 'card_of_store.dart';

class StoreList extends StatefulWidget {
  const StoreList({super.key});

  @override
  State<StoreList> createState() => _StoreListState();
}

class _StoreListState extends State<StoreList> {
  bool get wantKeepAlive => true;
  final ScrollController _scrollController = ScrollController();
  late StoresBloc _storesBloc;
  @override
  void initState() {
    super.initState();
    _storesBloc = StoresBloc()..add(FetchStores());
    _scrollController.addListener(_onScroll);
  }

  double currentScrollPosition = 0.0;

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 20 &&
        _storesBloc.hasMore &&
        _storesBloc.state is! StoresLoading) {
      currentScrollPosition = _scrollController.position.pixels;
      _storesBloc.add(FetchStores());
    }
  }

  @override
  void didUpdateWidget(covariant StoreList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_storesBloc.state is StoresLoaded) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          currentScrollPosition,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoresBloc, StoresState>(
      bloc: _storesBloc,
      listener: (context, state) {
        if (state is StoresError) {
          Get.snackbar('error', state.message);
        }
      },
      builder: (context, state) {
        if (state is StoresInitial || state is StoresLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: 5,
              itemBuilder: (context, index) {
                print('Building shimmer item $index');

                return StoreCardShimmer();
              },
            ),
          );
        } else if (state is StoresLoaded || state is StoresLoadingMore) {
          final stores = state is StoresLoaded
              ? state.allStores
              : (state as StoresLoadingMore).allStores;


          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: ListView.builder(
              controller: _scrollController,
              itemCount:
                  _storesBloc.hasMore ? stores!.length + 2 : stores!.length,
              itemBuilder: (context, index) {
                if (index < stores.length) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 140,
                      child: CardOfStore(
                        store: stores[index],
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SizedBox(width: 140, child: StoreCardShimmer()),
                  );
                }
              },
            ),
          );
        }
        if (state is StoresError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('error: ${state.message}'),
                ElevatedButton(
                    onPressed: () {
                      _storesBloc.add(FetchStores());
                    },
                    child: const Text('try again'))
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
