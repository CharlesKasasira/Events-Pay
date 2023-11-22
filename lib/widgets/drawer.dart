import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/profile_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
              height: 4,
            ),
            Text(
              'Charles',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            Text(
              "charleskasasira01@gmail.com",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      ListTile(
        leading: const Icon(Icons.payment_outlined),
        title: const Text('Make Payment'),
        onTap: () {
          Get.back();
          // Get.to(
          //   () => PaymentPage(
          //           user: widget.user,
          //           firstName: widget.firstName,
          //           lastName: widget.lastName),
          //   transition: Transition.cupertino,
          //   duration: const Duration(milliseconds: 600),
          //   curve: Curves.easeOut,
          // );
        },
      ),
      ListTile(
        leading: const Icon(Icons.message_outlined),
        title: const Text('Chat'),
        onTap: () {
          Get.back();
          // Get.to(
          //   () => const ChatPage(),
          //   transition: Transition.cupertino,
          //   duration: const Duration(milliseconds: 600),
          //   curve: Curves.easeOut,
          // );
        },
      ),
      ListTile(
        leading: const Icon(Icons.person_outline),
        title: const Text('Profile'),
        onTap: () {
          Get.to(() => ProfilePage(), transition: Transition.cupertino);
          // Get.to(
          //   () => const AccountPage(),
          //   transition: Transition.cupertino,
          //   duration: const Duration(milliseconds: 600),
          //   curve: Curves.easeOut,
          // );
        },
      ),
      const SizedBox(
        height: 20,
      ),
      const Divider(
        thickness: 1,
      ),
      ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Log Out'),
          onTap: () async {
            // _authController.signOut();
          }),
    ]));
  }
}
