import 'package:mate_order_app/Features/auth/register/data/models/register_user_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

class RegisterRepository {
  final Api api;
  RegisterRepository(this.api);

  Future<RegisterUserModel> register(data) async {
    final registerUserModel = await api.post(
      endPoint: 'auth/register',
      data: data,
    );
    return RegisterUserModel.fromJson(registerUserModel);
  }
}
