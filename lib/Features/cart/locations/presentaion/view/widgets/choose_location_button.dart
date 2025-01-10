import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// import 'package:mate_order_app/Features/Home/oredr/presentation/model_view/bloc/order_bloc.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/add_order/add_order_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/cart_cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/view/cart_view.dart';
import 'package:mate_order_app/constants.dart';

import '../../../data/models/address_list_model.dart';

class ChooseLocationButton extends StatelessWidget {
  const ChooseLocationButton({
    super.key,
    required this.address,
  });
  final Address address;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          Get.snackbar('Done', state.message);
          // context.read<CartCubit>().getCartProducts();
          Get.offAll(const CartView());
        }
        if (state is AddOrderError) {
          Get.snackbar('Error', state.message);
        }
      },
      builder: (BuildContext context, AddOrderState state) {
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return BlocBuilder<AddOrderCubit, AddOrderState>(
                  builder: (context, state) {
                    return AlertDialog(
                      title: const Text('Add Order').tr(),
                      content: const Text(
                              'Are you sure you want to confirm this order?')
                          .tr(),
                      actions: [
                        state is AddOrderLoading
                            ? const CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: () async {
                                  await context
                                      .read<AddOrderCubit>()
                                      .addOrder(addressId: address.id);
                                },
                                style: const ButtonStyle(
                                    backgroundColor:
                                        const WidgetStatePropertyAll(
                                            kPrimaryColor8)),
                                child: const Text(
                                  'Confirm',
                                  style: TextStyle(color: kPrimaryColor1),
                                ).tr(),
                              ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel').tr(),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: kPrimaryColor8),
            child: const Icon(
              Icons.add_circle_outline_outlined,
              size: 20,
              color: Color.fromARGB(255, 91, 91, 91),
            ),
          ),
        );
      },
    );
  }
}
