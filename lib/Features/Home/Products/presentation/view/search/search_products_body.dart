import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/model_view/search_products_cubit/search_products_cubit.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/search/search_bar_for_home.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/product_card/card_of_product.dart';
import 'package:mate_order_app/constants.dart';

// ignore: must_be_immutable
class SearchProductsBody extends StatelessWidget {
  SearchProductsBody({super.key});
  SearchProductsCubit searchProductsCubit = SearchProductsCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchProductsCubit(),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'SearchBarForHomeProducts',
                child: Material(
                  child: SearchBarForHome(
                    // searchProductsCubit: searchProductsCubit,
                    searchController: SearchController(),
                    onFieldSubmitted: (value) {
                      searchProductsCubit.search(value);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              BlocBuilder<SearchProductsCubit, SearchProductsState>(
                bloc: searchProductsCubit,
                builder: (context, state) {
                  if (state is SearchProductsInitial) {
                    return const SizedBox.shrink();
                  } else if (state is SearchProductsLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor1,
                      ),
                    );
                  } else if (state is SearchProductsSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: GridView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              width: 140,
                              child: CardOfProduct(
                                  product: state.products[index].product!),
                            ),
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          // crossAxisSpacing: 0,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.8,
                        ),
                      ),
                    );
                  } else if (state is SearchProductsError) {
                    return Center(
                      child: Text(state.message),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
