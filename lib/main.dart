import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:mate_order_app/Features/Home/locations/presentaion/model_view/location_cubit/locations_cubit.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/model_view/stores_bloc/stores_bloc.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/view-models/cubit/verify_cubit.dart';
import 'package:mate_order_app/Features/auth/login/presentation/view-models/cubit/login_cubit.dart';
import 'package:mate_order_app/Features/auth/logout/presentation/view_model/cubit/logout_cubit.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/Features/cart/presentation/model_view/cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/main%20home/home.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_image_cubit/profile_image_cubit.dart';
import 'package:mate_order_app/Features/splash/views/splash_view.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/bloc_helper/observer.dart';
import 'package:mate_order_app/core/helpers/shared_pref.dart';
import 'package:mate_order_app/core/notification/notification_service.dart';
import 'package:mate_order_app/firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Features/Home/Products/presentation/model_view/add_to_cart/add_to_cart_cubit.dart';
import 'Features/Home/Products/presentation/model_view/home_bloc/bloc/products_home_bloc.dart';
import 'Features/Home/map/presentation/model_view/cubit/map_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid && await Permission.notification.isDenied) {
    await Permission.notification.request();
  }
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('notification_icon.png');
  // await Firebase;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.instance.initialize();

  final bool isLoggedIn = await checkIfLoggedInUser();
  Bloc.observer = const CounterObserver();
  // BlocProvider.of<Prof>(context).showImage;

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
        BlocProvider(create: (context) => ProductsHomeBloc()),
        BlocProvider(create: (context) => StoresBloc()),
        BlocProvider(create: (context) => LocationsCubit()),
        BlocProvider(create: (context) => MapCubit()),
        BlocProvider(create: (context) => AddToCartCubit()),
        BlocProvider(create: (context) => ProfileImageCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => VerifyCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        color: Colors.white,
        home: isLoggedIn ? const Home() : const SplashView(),
      ),
    );
  }
}

Future<bool> checkIfLoggedInUser() async {
  final String? userToken =
      await SharedPrefHelper.getString(SharedPrefKeys.userToken);

  if (userToken != null && userToken.isNotEmpty) {
    print('user token:$userToken');
  } else {}

  return userToken != null && userToken.isNotEmpty;
}
