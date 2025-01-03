import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/profile/data/models/profile_inf/profile_inf_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class ProfileInfService {
  late Api api;

  ProfileInfService(this.api);

  Future<Either<Failure, ProfileInfModel>> showPersonalInf() async {
    final result = await api.getWithAuth(endPoint: 'auth/me');

    return result.fold(
      (failure) => left(failure),
      (data) => Right(ProfileInfModel.fromJson(data)),
    );
  }

  Future<Either<Failure, String>> updatePersonalInf(String firstName,
      String lastName, String email, String phoneNumber) async {
    final Map<String, dynamic> data = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phoneNumber,
    };
    final result = await api.putWithAuth(
      endPoint: 'update',
      queryParameters: data,
    );

    return result.fold(
      (failure) => left(failure),
      (data) => Right(data['message'] as String ),
    );
  }
}
