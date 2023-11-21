import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:packingticketingsystem/screens/splash_screen.dart';
import 'package:packingticketingsystem/utils/color_constants.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await FlutterConfig.loadEnvVariables();

  // await dotenv.load(fileName: ".env");
  String url = "https://qapzckuxjzmzhauswejx.supabase.co";
  String anonKey =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFhcHpja3V4anptemhhdXN3ZWp4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzYxNDQwMDcsImV4cCI6MTk5MTcyMDAwN30.ayJd8Aq7cHgEQ4VaL9UPEO-u21QVyvcqleKggHLIxY8";
  await Supabase.initialize(
    url: url,
    anonKey: anonKey,
  );
  runApp(const MyApp(title: 'Title'));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required String title});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ksecondary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return GetMaterialApp(
        title: 'Events Ticket',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorConstants.ksecondary,
        ),
        home: AnimatedSplashScreen(
            splash: 'events_pay\assets\images\logo.png',
            duration: 3000,
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.blue,
            nextScreen: const MyApp(title: 'Title')));
    // Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Container(
    //         height: 100,
    //         width: 100,
    //         color: Colors.black,
    //       ),
    //       const Text(
    //         'Welcome to Events Pay',
    //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    //       ),
    //     ],
    //   ),
    // ),
  }
}
