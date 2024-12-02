import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mate_order_app/Features/auth/OTP/data/models/verify_model.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/core/utils/api_services.dart';

class VerifyService {

  late Api api;
  VerifyService(this.api);

  Future<VerifyModel> verify({required Map<String, dynamic> data,required String token }) async {
    try {
      var verifyModel = await api.post(endPoint: 'verify', data: data,headers:{
        'BearerToken': token

      } );
      return VerifyModel.fromJson(verifyModel);
    } catch (e) {
      print(e.toString());
      print('-- in verify service---------------------');
      return VerifyModel();
    }
  }
}
