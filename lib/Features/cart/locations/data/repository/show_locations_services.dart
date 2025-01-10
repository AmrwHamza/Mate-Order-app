import 'package:either_dart/either.dart';
import 'package:mate_order_app/Features/cart/locations/data/models/address_list_model.dart';
import 'package:mate_order_app/Features/cart/locations/data/models/delete_address_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class LocationsServices {
  Future<Either<Failure, AddressListModel>> showLocations() async {
    final result = await Api().getWithAuth(endPoint: 'showAddresses');

    return result.fold(
      (l) {
        return Left(l);
      },
      (r) {
        try {
          return Right(AddressListModel.fromJson(r as List));
        } catch (e) {
          return const Left(UnknownFailure('Error parsing response'));
        }
      },
    );
  }

  Future<Either<Failure, DeleteAddressModel>> deleteAddress(
      {required int id}) async {
    final result =
        await Api().deleteWithAuth(endPoint: 'deleteAddress/$id', data: {});

    return result.fold(
      (l) => Left(l),
      (r) {
        return Right(DeleteAddressModel.fromJson(r));
      },
    );
  }
}
