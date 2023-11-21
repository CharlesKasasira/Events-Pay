import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/home_screen.dart';
import 'package:packingticketingsystem/screens/events_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.wait([]).then((responseList) async {
      Get.off(() => EventsScreen(), transition: Transition.fadeIn);
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Welcome to Events", style: TextStyle(fontSize: 22),),
      ),
    );
  }
}