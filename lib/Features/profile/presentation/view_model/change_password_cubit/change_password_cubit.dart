import 'package:bloc/bloc.dart';

import 'package:mate_order_app/Features/profile/data/repos/change_password_repo/change_password_service.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  bool isLoading = false;

  Future<void> changePassword(
      String endpoint, Map<String, dynamic> data) async {
    isLoading = true;
    emit(ChangePasswordLoading());
    final result = await ChangePasswordService(Api())
        .changePassword(endpoint: endpoint, data: data);

    result.fold(
      (failure) {
        isLoading = false;
        emit(ChangePasswordFailure(error: failure.message));
      },
      (response) {
        isLoading = false;
        emit(ChangePasswordSuccess(message: response.message));
      },
    );
  }
}
