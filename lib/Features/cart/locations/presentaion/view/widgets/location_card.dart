import 'package:flutter/material.dart';
import 'package:mate_order_app/Features/cart/locations/presentaion/view/widgets/choose_location_button.dart';
import 'package:mate_order_app/Features/cart/locations/presentaion/view/widgets/delete_location_button.dart';
import 'package:mate_order_app/constants.dart';

import '../../../../../Home/oredr/presentation/model_view/bloc/order_bloc.dart';
import '../../../data/models/address_list_model.dart';

class LocationCard extends StatelessWidget {
  const LocationCard(
      {super.key, required this.address});
  final Address address;
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColor5,
        ),
        height: 70,
        width: MediaQuery.of(context).size.width * .7,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title:${address.title}'),
                  Text('Description:${address.description}')
                ],
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            DeleteLocationButton(
              id: address.id,
            ),
            const SizedBox(
              width: 15,
            ),
            ChooseLocationButton(address: address,),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }
}
