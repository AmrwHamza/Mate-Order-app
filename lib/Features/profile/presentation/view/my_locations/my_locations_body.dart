import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mate_order_app/Features/cart/locations/presentaion/model_view/location_cubit/locations_cubit.dart';
import 'package:mate_order_app/Features/cart/locations/presentaion/view/widgets/location_card.dart';
import 'package:mate_order_app/constants.dart';

import 'my_location_card.dart';

class MyLocationsBody extends StatelessWidget {
  const MyLocationsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<LocationsCubit>().getLocations();
    return LiquidPullToRefresh(
      height: 60,
      showChildOpacityTransition: false,
      // backgroundColor: Colors.white,
      color: kPrimaryColor4,
      springAnimationDurationInMilliseconds: 500,
      onRefresh: () async {
        context.read<LocationsCubit>().getLocations();
      },
      child: BlocConsumer<LocationsCubit, LocationsState>(
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
                    return MyLocationCard(
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
                        style: const ButtonStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(kPrimaryColor8)),
                    
                      child: const Text('try again'))
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
