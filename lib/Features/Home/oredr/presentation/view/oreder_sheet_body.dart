import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/Products/data/models/products_with_category_model/products_with_category/products_with_category.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        print("Current State: $state");

        int amount = 0;
        dynamic price = 0;
        if (state is ChangedAmount || state is ErrorChange) {
          amount = (state as dynamic).amount;
          price = (state as dynamic).price;
        }
        print("Current State: $amount");

        return SliverToBoxAdapter(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonInSheet(
                  changeAmount: -10,
                  icon: Text(
                    '-10',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonInSheet(
                  changeAmount: -1,
                  icon: Text(
                    '-1',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '$amount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonInSheet(
                  changeAmount: 1,
                  icon: Text(
                    '+1',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                ButtonInSheet(
                  changeAmount: 10,
                  icon: Text(
                    '+10',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Text('max : ${product.amount}'),
            Text(
              "Price: \$ $price",
            ),
            if (amount > 0)
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => LocationsView());
                    },
                    child: Text('locations')),
              )
          ],
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
  });
  final int changeAmount;
  final Widget icon;
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
          color: kPrimaryColor5,
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
