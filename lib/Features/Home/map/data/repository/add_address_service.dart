import 'package:dartz/dartz.dart';
import 'package:mate_order_app/Features/Home/map/data/models/add_address_model.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

import '../../../../../core/utils/api_services.dart';

class AddAddressService {
  Future<Either<Failure, AddAddressModel>> addAddress(
      {required String title,
      required String description,
      required double longitude,
      required double latitude}) async {
    final result = await Api().postWithAuth(endPoint: 'addAddress', data: {
      "title": title,
      "description": description,
      "longitude": longitude,
      "latitude": latitude
    });

    return result.fold(
      (l) => Left(l),
      (r) => Right(AddAddressModel.fromJson(r)),
    );
  }
}
