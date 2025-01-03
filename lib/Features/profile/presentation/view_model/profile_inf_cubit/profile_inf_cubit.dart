// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mate_order_app/Features/profile/data/models/profile_inf/profile_inf_model.dart';
import 'package:mate_order_app/Features/profile/data/repos/profile_inf_repo/profile_inf_service.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

part 'profile_inf_state.dart';

class ProfileInfCubit extends Cubit<ProfileInfState> {
  ProfileInfCubit() : super(ProfileInfInitial());
  bool isLoading = false;

  Future<void> showPersonalInf() async {
    isLoading = true;
    emit(ProfileInfLoading());
    final result = await ProfileInfService(Api()).showPersonalInf();

    result.fold((failure) {
      isLoading = false;
      emit(ProfileInfFailure(failure.message));
    }, (data) {
      isLoading = false;
      emit(ProfileGetInfSuccess(data));
    });
  }

  Future<void> updatePersonalInf(String firstName, String lastName,
      String email, String phoneNumber) async {
    isLoading = true;
    emit(ProfileInfLoading());
    final result = await ProfileInfService(Api())
        .updatePersonalInf(firstName, lastName, email, phoneNumber);

    result.fold((failure) {
      isLoading = false;
      emit(ProfileInfFailure(failure.message));
    }, (data) {
      isLoading = false;
      emit(ProfileUpdateInfSuccess(message:  data));
    });
  }
}
