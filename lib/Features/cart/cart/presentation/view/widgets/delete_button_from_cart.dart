import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/cart_cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/delete_cubit/delete_from_c_art_cubit.dart';

class DeleteButtonFromCart extends StatelessWidget {
  const DeleteButtonFromCart({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteFromCArtCubit(),
      child: BlocConsumer<DeleteFromCArtCubit, DeleteFromCArtState>(
        listener: (context, state) {
          if (state is DeleteFromCartError) {
            Get.snackbar('Error', state.message);
          }
          if (state is DeleteFromCartSuccess) {
            context.read<CartCubit>().getCartProducts();
          }
        },
        buildWhen: (previous, current) =>
            current is DeleteFromCartLoading ||
            current is CartInitial ||
            current is DeleteFromCartError,
        builder: (context, state) {
          if (state is DeleteFromCartLoading) {
            return const CircularProgressIndicator(
              color: Colors.black,
            );
          }
          return ElevatedButton(
              onPressed: () {
                context.read<DeleteFromCArtCubit>().deleteFromCart(id: id);
              },
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.redAccent)),
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.black),
              ).tr(),);
        },
      ),
    );
  }
}
