import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../model_view/home_bloc/bloc/products_home_bloc.dart';
import '../product_card/card_of_product.dart';
import '../product_card/product_card_shimmer.dart';

class SeeAllProductsBody extends StatefulWidget {
  const SeeAllProductsBody.SeeAllProductsBody(
      {super.key, required this.categoryName});
  final String categoryName;

  @override
  State<SeeAllProductsBody> createState() =>
      _SeeAllProductsBodyState(categoryName: categoryName);
}

class _SeeAllProductsBodyState extends State<SeeAllProductsBody> {
  final String categoryName;
  bool get wantKeepAlive => true;
  final ScrollController _scrollController = ScrollController();
  late ProductsHomeBloc _productBloc;

  _SeeAllProductsBodyState({required this.categoryName});

  @override
  void initState() {
    super.initState();
    _productBloc = ProductsHomeBloc()
      ..add(FetchProductsHome(category: categoryName));
    _scrollController.addListener(_onScroll);
  }

  double currentScrollPosition = 0.0;

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 20 &&
        _productBloc.hasMore &&
        _productBloc.state is! ProductsHomeLoading) {
      currentScrollPosition = _scrollController.position.pixels;
      _productBloc.add(FetchProductsHome(category: categoryName));
    }
  }

  @override
  void didUpdateWidget(covariant SeeAllProductsBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_productBloc.state is ProductsHomeLoaded) {
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
    return BlocConsumer<ProductsHomeBloc, ProductsHomeState>(
      bloc: _productBloc,
      listener: (context, state) {
        if (state is ProductsHomeError) {
          Get.snackbar('Error', state.message);

        }
      },
      builder: (context, state) {
        if (state is ProductsHomeInitial || state is ProductsHomeLoading) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: GridView.builder(
                controller: _scrollController,
              
                itemCount: 2,
                itemBuilder: (context, index) {
                  print('Building shimmer item $index');

                  return ProductCardShimmer();
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // crossAxisSpacing: 0,
                  mainAxisSpacing: 5,
                  // childAspectRatio: 0.8,
                ),
              ));
        } else if (state is ProductsHomeLoaded ||
            state is ProductsHomeLoadingMore) {
          final products = state is ProductsHomeLoaded
              ? state.allProducts
              : (state as ProductsHomeLoadingMore).allProducts;

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
        if (state is ProductsHomeError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('error: ${state.message}'),
                ElevatedButton(
                    onPressed: () {
                      _productBloc
                          .add(FetchProductsHome(category: categoryName));
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
