import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/cart/locations/presentaion/model_view/location_cubit/locations_cubit.dart';
import 'package:mate_order_app/Features/cart/locations/presentaion/view/widgets/location_card.dart';
import 'package:mate_order_app/constants.dart';

import '../../../../Home/oredr/presentation/model_view/bloc/order_bloc.dart';

class LocationsBody extends StatelessWidget {
  const LocationsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<LocationsCubit>().getLocations();
    return BlocConsumer<LocationsCubit, LocationsState>(
      listener: (context, state) {
        if (state is LocationsError) {
          Get.snackbar('Error', (state as dynamic).message);
        }
      },
      builder: (context, state) {
        if (state is LocationsLoading || state is LocationsInitial) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: kPrimaryColor3,
                )
              ],
            ),
          );
        }

        if (state is LocationsSuccess) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .85,
              child: ListView.builder(
                itemCount: context
                        .read<LocationsCubit>()
                        .addressListModel
                        .addresses
                        ?.length ??
                    0,
                itemBuilder: (context, index) {
                  return LocationCard(
                    address: context
                        .read<LocationsCubit>()
                        .addressListModel
                        .addresses![index],
                  );
                },
              ));
        }

        if (state is LocationsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<LocationsCubit>().getLocations();
                    },
                    child: const Text('Try again'))
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
