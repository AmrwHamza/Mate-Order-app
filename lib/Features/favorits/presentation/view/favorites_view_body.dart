import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mate_order_app/Features/favorits/presentation/model_view/cubit/get_fav_cubit.dart';

import '../../../../constants.dart';
import '../../../Home/Products/presentation/view/product_card/card_of_product.dart';

class FavoritesViewBody extends StatelessWidget {
  const FavoritesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      height: 60,
      showChildOpacityTransition: false,
      backgroundColor: Colors.white,
      color: kPrimaryColor4,
      springAnimationDurationInMilliseconds: 500,
      onRefresh: () async {
        context.read<GetFavCubit>().getFav();
      },
      child: BlocBuilder<GetFavCubit, GetFavState>(
        builder: (context, state) {
          if (state is GetFavLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is GetFavSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView.builder(
                itemCount: state.favoritsModul.data?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 140,
                      child: CardOfProduct(
                          product: state.favoritsModul.data![index].product!),
                    ),
                  );
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

          return ListView();
        },
      ),
    );
  }
}
