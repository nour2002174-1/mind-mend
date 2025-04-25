import 'package:first_try/features/home/presentation/views/widgets/custom_navigator_bar.dart';
import 'package:first_try/features/login/presentation/views/login.dart';
import 'package:first_try/features/splach/presentation/views/splach_view.dart';
import 'package:flutter/material.dart';

class SplashToHomeRouter extends StatefulWidget {
  const SplashToHomeRouter({super.key});

  @override
  State<SplashToHomeRouter> createState() => _SplashToHomeRouterState();
}

class _SplashToHomeRouterState extends State<SplashToHomeRouter> {
  bool _isSplashDone = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isSplashDone = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isSplashDone ? Login_View() : Splach_View();
  }
}
