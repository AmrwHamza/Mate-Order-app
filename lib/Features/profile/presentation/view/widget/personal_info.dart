import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_inf_cubit/profile_inf_cubit.dart';
import 'package:mate_order_app/floating_message.dart';

// ignore: must_be_immutable
class PersonalInfo extends StatelessWidget {
  PersonalInfo({super.key});

  String? firstName;
  String? lastName;
  String? email;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInfCubit, ProfileInfState>(
      builder: (context, state) {
        if (state is ProfileGetInfSuccess) {
          firstName = state.profileInfModel.firstName;
          lastName = state.profileInfModel.lastName;
          email = state.profileInfModel.email;
        } else if (state is ProfileInfFailure) {
          FloatingMessage(
              'Failed to load your information , please restart the application ',
              4,
              context);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$firstName $lastName',
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              '$email',
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Color(0xFF8D8D8D),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        );
      },
    );
  }
}
