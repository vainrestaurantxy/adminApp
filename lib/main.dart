import 'package:admin_app/Data/Providers/cartProvider.dart';
import 'package:admin_app/Data/Providers/errorProvider.dart';
import 'package:admin_app/Data/Providers/imageUpload.dart';
import 'package:admin_app/ViewModel/HomeViewModel/AddPageViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Data/Providers/homeProvider.dart';
import 'Data/Providers/restaurantProvider.dart';
import 'Router/router.dart';
import 'injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(MultiProvider(providers: [
    ListenableProvider<GetMenu>(create: (_) => GetMenu()),
    ListenableProvider<ErrorProvider>(create: (_) => ErrorProvider()),
    ListenableProvider<ImageUpload>(create: (_) => ImageUpload()),
    ListenableProvider<RestaurantData>(
      create: (_) => RestaurantData(),
    ),
    ListenableProvider<CartProvider>(
      create: (_) => CartProvider(),
    ),
    ListenableProvider<HomeProvider>(create: (_) => HomeProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 746),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Admin App',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(primary: Color(0xFF241D43)),
        ),
      ),
    );
  }
}
