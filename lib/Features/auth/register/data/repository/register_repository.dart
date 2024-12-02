import 'package:mate_order_app/Features/auth/register/data/models/register_user_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

class RegisterRepository {
  late Api api;
  RegisterRepository(this.api);

  Future<RegisterUserModel> register(Map<String, dynamic> data) async {
    try {
      final registerUserModel = await api.post(
        endPoint: 'auth/register',
        data: data,
      );
      return RegisterUserModel.fromJson(registerUserModel);
    } catch (e) {
      print(e.toString());
      print('---------------------------');
      return RegisterUserModel();
    }
  }
}
