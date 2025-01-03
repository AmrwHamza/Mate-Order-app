import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/Home/oredr/presentation/model_view/bloc/order_bloc.dart';
import 'package:mate_order_app/constants.dart';

import '../../../data/models/address_list_model.dart';

class ChooseLocationButton extends StatelessWidget {
  const ChooseLocationButton({
    super.key,
required this.orderBloc, required this.address,
  });
  final Address address;
  final OrderBloc orderBloc;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      
        orderBloc
            .add(ChooseLocationEvent(address));
        Navigator.pop(context);
      },
      child: Container(
        height: 30,
        width: 30,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor8),
        child: const Icon(
          Icons.add_circle_outline_outlined,
          size: 20,
          color: Color.fromARGB(255, 91, 91, 91),
        ),
      ),
    );
  }
}
