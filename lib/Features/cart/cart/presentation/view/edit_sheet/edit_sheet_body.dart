import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/cart/cart/data/models/cart_products_model.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/cart_cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/edit_amount/edit_amount_cubit.dart';
import 'package:mate_order_app/constants.dart';

class EditSheetBody extends StatelessWidget {
  final ProductInCart product;
  const EditSheetBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditAmountCubit, EditAmountState>(
      listener: (context, state) {
        if (state is EditAmountConfirmSuccess) {
          context.read<CartCubit>().getCartProducts();
          Navigator.pop(context);
        }
        if (state is EditAmountConfirmError) {
          Get.snackbar('Error', state.mess);
        }
      },
      builder: (context, state) {
        return SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.85,
                height: 120,
                decoration: BoxDecoration(
                    color: kPrimaryColor10,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const ButtonInSheet(
                          changeAmount: -10,
                          icon: Text(
                            '-10',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const ButtonInSheet(
                          changeAmount: -1,
                          icon: Text(
                            '-1',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${context.read<EditAmountCubit>().currentAmount}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const ButtonInSheet(
                          changeAmount: 1,
                          icon: Text(
                            '+1',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          color: kPrimaryColor6,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const ButtonInSheet(
                          changeAmount: 10,
                          icon: Text(
                            '+10',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          color: kPrimaryColor6,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text('Max').tr(),
                            Text(': ${product.amount}'),
                          ],
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            const Text('Price').tr(),
                            Text(
                              ":${context.read<EditAmountCubit>().totalPrice} ",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              state is EditAmountConfirmLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        await context
                            .read<EditAmountCubit>()
                            .confirmEditAmount();
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(kPrimaryColor8)),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(color: kPrimaryColor1),
                      ).tr(),
                    ),
            ],
          ),
        ));
      },
    );
  }
}

class ButtonInSheet extends StatelessWidget {
  const ButtonInSheet({
    super.key,
    required this.changeAmount,
    required this.icon,
    required this.color,
  });
  final int changeAmount;
  final Widget icon;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<EditAmountCubit>().editAmount(editnum: changeAmount);
      },
      icon: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
