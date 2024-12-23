import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import '../../model_view/home_bloc/bloc/products_home_bloc.dart';
import 'card_of_product.dart';
import 'product_card_shimmer.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({
    super.key,
    required this.categoryName,
  });
  final String categoryName;

  @override
  State<ProductsList> createState() =>
      _ProductsListState(categoryName: categoryName);
}

class _ProductsListState extends State<ProductsList>
    with AutomaticKeepAliveClientMixin {
  final String categoryName;
  bool get wantKeepAlive => true;
  final ScrollController _scrollController =
      ScrollController(); // تعريف الـ ScrollController
  late ProductsHomeBloc _productBloc;

  _ProductsListState({required this.categoryName}); // بلوك البيانات

  @override
  void initState() {
    super.initState();
    _productBloc = ProductsHomeBloc()
      ..add(FetchProductsHome(category: categoryName)); // تحميل الصفحة الأولى
    _scrollController
        .addListener(_onScroll); // إضافة مستمع للـ ScrollController
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // التخلص من الـ ScrollController لتجنب تسريب الذاكرة
    _productBloc.close(); // إغلاق الـ BLoC
    super.dispose();
  }

  double currentScrollPosition = 0.0;

  void _onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 20 &&
        _productBloc.hasMore &&
        _productBloc.state is! ProductsHomeLoading) {
      currentScrollPosition =
          _scrollController.position.pixels; // حفظ الموضع الحالي
      _productBloc.add(FetchProductsHome(category: categoryName));
    }
  }

  @override
  void didUpdateWidget(covariant ProductsList oldWidget) {
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
    super.build(context);
    return BlocConsumer<ProductsHomeBloc, ProductsHomeState>(
      bloc: _productBloc,
      listener: (context, state) {
        if (state is ProductsHomeError) {
          Get.snackbar('', state.message);
        }
      },
      builder: (context, state) {
        if (state is ProductsHomeInitial || state is ProductsHomeLoading) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.26,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  print('Building shimmer item $index');

                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: .0),
                    child: ProductCardShimmer(),
                  );
                },
              ));
        } else if (state is ProductsHomeLoaded ||
            state is ProductsHomeLoadingMore) {
          final products = state is ProductsHomeLoaded
              ? state.allProducts
              : (state as ProductsHomeLoadingMore).allProducts;

          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.26,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: _productBloc.hasMore
                  ? products!.length + 1
                  : products!.length,
              itemBuilder: (context, index) {
                if (index < products.length) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 150,
                      child: CardOfProduct(
                        product: products[index].product!,
                      ),
                    ),
                  );
                } else {
                  // return const ProductCardShimmer();

                  return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.26,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // controller: _scrollController,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          print('Building shimmer item $index');

                          return const Padding(
                            padding: EdgeInsets.symmetric(horizontal: .0),
                            child: ProductCardShimmer(),
                          );
                        },
                      ));
                }
              },
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
        return const SizedBox.shrink(); // حالة افتراضية (لا شيء)
      },
    );
  }
}
