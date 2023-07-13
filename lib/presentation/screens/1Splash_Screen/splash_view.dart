import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learn_admin/presentation/screens/2Teacher_Screen/teacher_view.dart';
import 'package:learn_admin/shared/routes.dart';
import '../../widgets/1Splash_Widget/body.dart';

class SplashView extends StatefulWidget {
  SplashView();

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  Timer? _timer;

  _SplashViewState();

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  _goNext() {
    navigateAndFinish(context, teacher_view());
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Splash_Body();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
