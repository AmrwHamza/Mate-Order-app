import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mate_order_app/Features/Nonification/presentation/model_view/cubit/notifications_cubit_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/add_order/add_order_cubit.dart';

import 'package:mate_order_app/Features/cart/locations/presentaion/model_view/location_cubit/locations_cubit.dart';
import 'package:mate_order_app/Features/Home/stores/presentation/model_view/stores_bloc/stores_bloc.dart';
import 'package:mate_order_app/Features/auth/OTP/presentation/view-models/cubit/verify_cubit.dart';
import 'package:mate_order_app/Features/auth/login/presentation/view-models/cubit/login_cubit.dart';
import 'package:mate_order_app/Features/auth/logout/presentation/view_model/cubit/logout_cubit.dart';
import 'package:mate_order_app/Features/auth/register/presentation/view-models/cubit/register_cubit.dart';
import 'package:mate_order_app/Features/cart/cart/presentation/model_view/cart_cubit/cart_cubit.dart';
import 'package:mate_order_app/Features/favorits/presentation/model_view/cubit/get_fav_cubit.dart';
import 'package:mate_order_app/Features/main%20home/home.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/GetOrderProducts/get_order_products_cubit.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/delete_product_from_order.dart/delete_product_from_order_cubit.dart';
import 'package:mate_order_app/Features/orders/presentation/model_view/get_orders/get_orders_cubit.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/change_password_cubit/change_password_cubit.dart';
import 'package:mate_order_app/Features/profile/presentation/view_model/profile_image_cubit/profile_image_cubit.dart';
import 'package:mate_order_app/Features/splash/views/splash_view.dart';
import 'package:mate_order_app/constants.dart';
import 'package:mate_order_app/core/bloc_helper/observer.dart';
import 'package:mate_order_app/core/helpers/shared_pref.dart';
import 'package:mate_order_app/core/notification/notification_service.dart';
import 'package:mate_order_app/firebase_options.dart';
import 'package:mate_order_app/theme_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'Features/Home/Products/presentation/model_view/home_bloc/bloc/products_home_bloc.dart';
import 'Features/Home/map/presentation/model_view/cubit/map_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
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

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: translations, // <-- change the path of the translation files
    fallbackLocale: const Locale('ar'),
    // startLocale: Locale('ar'),
    saveLocale: true,
    child: MateOrderApp(
      isLoggedIn: isLoggedIn,
    ),
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
        BlocProvider(create: (context) => ProfileImageCubit()),
        BlocProvider(create: (context) => ChangePasswordCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => VerifyCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => AddOrderCubit()),
        BlocProvider(create: (context) => GetOrdersCubit()),
        BlocProvider(create: (context) => GetOrderProductsCubit()),
        BlocProvider(create: (context) => DeleteProductFromOrderCubit()),
        BlocProvider(create: (context) => NotificationsCubit()),
        BlocProvider(create: (context) => GetFavCubit()),
      ],
      child: GetMaterialApp(
        theme: ThemeService().lightTheme,
        darkTheme: ThemeService().darkTheme,
        themeMode: ThemeService().getThemeMode(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        // color: Colors.white,
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
