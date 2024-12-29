import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mate_order_app/Features/Home/locations/presentaion/model_view/cubit/locations_cubit.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/model_view/stores_bloc/stores_bloc.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/view-models/cubit/verify_cubit.dart';
import 'package:mate_order_app/Features/auth/login/presentation/view-models/cubit/login_cubit.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/Features/main%20home/home.dart';
import 'package:mate_order_app/Features/splash/views/splash_view.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/helpers/shared_pref.dart';
import 'Features/Home/Products/presentation/model_view/home_bloc/bloc/products_home_bloc.dart';
import 'core/bloc_helper/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const CounterObserver();

  bool isLoggedIn = await checkIfLoggedInUser();

  runApp(MateOrderApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MateOrderApp extends StatelessWidget {
  const MateOrderApp({super.key, required this.isLoggedIn});
  final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => VerifyCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => ProductsHomeBloc()),
        BlocProvider(create: (context) => StoresBloc()),
        BlocProvider(create: (context) => LocationsCubit(),)
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: isLoggedIn ? Home() : const SplashView(),
      ),
    );
  }
}

Future<bool> checkIfLoggedInUser() async {
  String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);

  if (userToken != null && userToken.isNotEmpty) {
    print("Token saved successfully: $userToken");
  } else {
    print("Token is not saved!");
  }

  return userToken != null && userToken.isNotEmpty;
}
