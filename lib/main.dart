import 'package:device_preview/device_preview.dart';
import 'package:first_try/features/home/presentation/views/widgets/bottom_nav_viewmodel.dart';
import 'package:first_try/features/splach/presentation/views/widgets/SplashToHomeRouter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:first_try/features/splach/presentation/views/splach_view.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => BottomNavViewModel()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashToHomeRouter(),
    );
  }
}
