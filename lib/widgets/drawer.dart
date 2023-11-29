import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:packingticketingsystem/controllers/auth_controllers.dart';
import 'package:packingticketingsystem/screens/events_screen.dart';
import 'package:packingticketingsystem/screens/home_screen.dart';
import 'package:packingticketingsystem/screens/profile_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final AuthController _authController = AuthController();
  final storage = GetStorage();
  late Map profileMap = storage.read('profile');
  late String fullName = profileMap['fullName'] ?? "";
  late String email = profileMap['email'] ?? "";
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: Color(0xff1A1A1A),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(75.0),
              child: Container(
                width: 80,
                height: 80,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 200, 200, 200),
                ),
                child: Image.asset("assets/images/avatar_icon.png"),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              fullName,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            Text(
              email,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      ListTile(
        leading: const Icon(Icons.home_rounded),
        title: const Text('Home'),
        onTap: () {
          Get.back();
          Get.to(
            () => const HomeScreen(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.event_outlined),
        title: const Text('Events'),
        onTap: () {
          Get.back();
          Get.to(
            () => EventsScreen(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        },
      ),
      ListTile(
        leading: const Icon(Icons.person_outline),
        title: const Text('Profile'),
        onTap: () {
          Get.back();
          Get.to(
            () => ProfilePage(),
            transition: Transition.cupertino,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOut,
          );
        },
      ),
      const SizedBox(
        height: 32,
      ),
      const Divider(
        thickness: 1,
      ),
      ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () async {
            Get.back();
            _authController.signOut();
          }),
    ]));
  }
}
