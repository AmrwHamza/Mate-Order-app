import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/model_view/store_products_bloc/store_products_bloc.dart';

import '../../../../Products/presentation/view/product_card/card_of_product.dart';
import '../../../../Products/presentation/view/product_card/product_card_shimmer.dart';

class StoreProductsBody extends StatefulWidget {
  const StoreProductsBody({super.key, required this.id});
  final int id;

  @override
  // ignore: no_logic_in_create_state
  State<StoreProductsBody> createState() => _StoreProductsBodyState(id: id);
}

class _StoreProductsBodyState extends State<StoreProductsBody> {
  final int id;
  bool get wantKeepAlive => true;
  final ScrollController _scrollController = ScrollController();
  late StoreProductsBloc _productBloc;

  _StoreProductsBodyState({required this.id});

  @override
  void initState() {
    super.initState();
    _productBloc = StoreProductsBloc()..add(FetchStoreProducts(id: id));
    _scrollController.addListener(_onScroll);
  }

  double currentScrollPosition = 0.0;

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 20 &&
        _productBloc.hasMore &&
        _productBloc.state is! StoreProductslLoading) {
      currentScrollPosition = _scrollController.position.pixels;
      _productBloc.add(FetchStoreProducts(id: id));
    }
  }

  @override
  void didUpdateWidget(covariant StoreProductsBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_productBloc.state is StoreProductsLoaded) {
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
    return BlocConsumer<StoreProductsBloc, StoreProductsState>(
      bloc: _productBloc,
      listener: (context, state) {
        if (state is StoreProductsError) {
          Get.snackbar('Error', state.message);
        }
      },
      builder: (context, state) {
        if (state is StoreProductsInitial || state is StoreProductslLoading) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: GridView.builder(
                controller: _scrollController,
                itemCount: 2,
                itemBuilder: (context, index) {

                  return const ProductCardShimmer();
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 0,
                  mainAxisSpacing: 5,
                  // childAspectRatio: 0.8,
                ),
              ));
        } else if (state is StoreProductsLoaded ||
            state is StoreProductsLoadingMore) {
          final products = state is StoreProductsLoaded
              ? state.allProducts
              : (state as StoreProductsLoadingMore).allProducts;

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: GridView.builder(
              controller: _scrollController,
              itemCount: _productBloc.hasMore
                  ? products!.length + 2
                  : products!.length,
              itemBuilder: (context, index) {
                if (index < products.length) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 140,
                      child: CardOfProduct(
                        product: products[index].product!,
                      ),
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SizedBox(width: 140, child: ProductCardShimmer()),
                  );
                }
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // crossAxisSpacing: 0,
                mainAxisSpacing: 5,
                childAspectRatio: 0.8,
              ),
            ),
          );
        }
        if (state is StoreProductsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(' ${state.message}'),
                ElevatedButton(
                    onPressed: () {
                      _productBloc.add(FetchStoreProducts(id: id));
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
