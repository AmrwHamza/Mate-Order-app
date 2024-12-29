import 'package:either_dart/either.dart';
import 'package:mate_order_app/Features/Home/locations/data/models/address_list_model.dart';
import 'package:mate_order_app/core/utils/api_services.dart';
import 'package:mate_order_app/core/utils/error/failure.dart';

class ShowLocationsServices {
  Future<Either<Failure, AddressListModel>> showLocations() async {
    var result = await Api().getWithAuth(endPoint: 'showAddresses');
    print('Raw API Response: $result');

    return result.fold(
      (l) {
        print('lllllllllllllllllllllllll');
        return Left(l);
      },
      (r) {
        try {
          print("Success: Parsing addresses");
          return Right(AddressListModel.fromJson(r as List));
        } catch (e) {
          print("Parsing error: $e");
          return const Left(UnknownFailure('Error parsing response'));
        }
      },
    );
  }
}
