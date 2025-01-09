import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/GetOrderProducts/get_order_products_cubit.dart';
import 'package:mate_order_app/Features/orders/presentation/view/edit_order_view/widgets/product_in_order_card.dart';

class EditOrderViewBody extends StatelessWidget {
  const EditOrderViewBody({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    context.read<GetOrderProductsCubit>().getProducts(orderId: id);
    return BlocConsumer<GetOrderProductsCubit, GetOrderProductsState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetOrderProductsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetOrderProductsSuccess) {
          return ListView.builder(
            itemCount: state.productsInOrderModel.data?.length,
            itemBuilder: (context, index) {
              return ProductInOrderCard(
                orderId: id,
                productInCart:
                    state.productsInOrderModel.data![index].productInCart!,
                totalAmount:
                    state.productsInOrderModel.data![index].totalAmount!,
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
