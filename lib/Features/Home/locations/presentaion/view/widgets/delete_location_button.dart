import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/model_view/delete_location/delete_location_cubit.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/model_view/location_cubit/locations_cubit.dart';
import 'package:mate_order_app/constants.dart';

class DeleteLocationButton extends StatelessWidget {
  const DeleteLocationButton({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteLocationCubit(),
      child: BlocConsumer<DeleteLocationCubit, DeleteLocationState>(
        listener: (context, state) {
          if (state is DeleteLocationSuccess) {
            Get.snackbar('Done', state.message);

            context.read<LocationsCubit>().getLocations();
          }
        },
        builder: (context, state) {
          if (state is DeleteLocationLoading) {
            return CircularProgressIndicator(
              color: kPrimaryColor10,
            );
          } else {
            return GestureDetector(
              onTap: () {
                context.read<DeleteLocationCubit>().deleteLocation(id: id);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.redAccent),
                child: Icon(
                  Icons.delete,
                  size: 20,
                  color: const Color.fromARGB(255, 91, 91, 91),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}