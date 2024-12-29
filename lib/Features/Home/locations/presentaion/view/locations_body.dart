import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/model_view/cubit/locations_cubit.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/view/widgets/location_card.dart';

class LocationsBody extends StatelessWidget {
  const LocationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LocationsCubit>().getLocations();
    return BlocConsumer<LocationsCubit, LocationsState>(
      listener: (context, state) {
        if (state is LocationsError) {
          Get.snackbar('Error', state.message);
        }
      },
      builder: (context, state) {
        if (state is LocationsLoading || state is LocationsInitial) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          );
        }

        if (state is LocationsSuccess) {
          return Expanded(
              child: ListView.builder(
            itemCount: state.addressListModel.addresses?.length ?? 0,
            itemBuilder: (context, index) {
              return LocationCard(
                  address: state.addressListModel.addresses![index]);
            },
          ));
        }
        return SizedBox.shrink();
      },
    );
  }
}
