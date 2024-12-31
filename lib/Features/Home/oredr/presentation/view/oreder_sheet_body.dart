import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/model_view/location_cubit/locations_cubit.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/view/locations_view.dart';
import 'package:mate_order_app/Features/Home/oredr/presentation/model_view/bloc/order_bloc.dart';
import 'package:mate_order_app/constants.dart';

class OrederSheetBody extends StatelessWidget {
  final Product product;
  const OrederSheetBody({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state is AddOrderError) {
          Get.snackbar('Error', state.message);
        }

        if (state is AddOrderSuccess) {
          Get.snackbar('Done ', state.message);

          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        print("Current State: $state");

        // if (state is AddOrderLoading) {
        //   return const Column(
        //     children: [
        //       Center(child: CircularProgressIndicator()),
        //     ],
        //   );
        // }

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
                          context.watch<OrderBloc>().amount.toString(),
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
                        Text('Max : ${product.amount}'),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Price: \$ ${context.watch<OrderBloc>().price}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (context.watch<OrderBloc>().amount > 0)
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(kPrimaryColor10)),
                        onPressed: () async {
                          Get.to(() => LocationsView(
                                orderBloc: context.read<OrderBloc>(),
                              ));
                        },
                        child: const Text(
                          'choose location',
                          style: TextStyle(color: kPrimaryColor1),
                        )),
                  ],
                ),
              if (state is ChangedAmount &&
                  state.address != null &&
                  context.watch<OrderBloc>().amount > 0)
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 100,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(blurRadius: 5, offset: Offset(0, 2)),
                            ],
                            color: kPrimaryColor10,
                            borderRadius: BorderRadius.circular(20)),
                        margin: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Title : ${context.read<OrderBloc>().address?.title}')
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<OrderBloc>().add(AddOrderEvent());
                        },
                        child: Text('Confirm')),
                  ],
                )
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
        context
            .read<OrderBloc>()
            .add(ChangeAmountEvent(changeAmount: changeAmount));
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
