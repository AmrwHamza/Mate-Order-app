import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/Home/Products/presentation/view/search/search_bar_for_home.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/model_view/search_stores_cubit/search_stores_cubit.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/view/stores/card_of_store.dart';
import 'package:mate_order_app/constants.dart';

// ignore: must_be_immutable
class SearchStoresBody extends StatelessWidget {
  SearchStoresBody({super.key});
  SearchStoresCubit searchStoresCubit = SearchStoresCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchStoresCubit(),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: 'SearchBarForHome',
                child: Material(
                  child: SearchBarForHome(
                    searchController: SearchController(),
                    onFieldSubmitted: (value) {
                      searchStoresCubit.search(value);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              BlocBuilder<SearchStoresCubit, SearchStoresState>(
                bloc: searchStoresCubit,
                builder: (context, state) {
                  if (state is SearchStoresInitial) {
                    return const SizedBox.shrink();
                  } else if (state is SearchStoresLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                          // color: kPrimaryColor1,
                          ),
                    );
                  } else if (state is SearchStoresSuccess) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: ListView.builder(
                        itemCount: state.stores.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SizedBox(
                              height: 140,
                              child: CardOfStore(store: state.stores[index]),
                            ),
                          );
                        },
                      ),
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
