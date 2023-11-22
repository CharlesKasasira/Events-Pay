import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/events_screen.dart';
import 'package:packingticketingsystem/screens/paidevents_screen.dart';
import 'package:packingticketingsystem/screens/splash_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
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
                const Text(
                  'Kasasira Charles',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                const Text(
                  "charlesbro@gmail.com",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
              ],
            ),),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Events'),
            onTap: () {
              Get.off(() => EventsScreen());
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
            leading: const Icon(Icons.event),
            title: const Text('Paid Events'),
            onTap: () {
              Get.off(() => PaidTicketScreen());
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
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            onTap: () {
              // Get.to(
                // page that should be
                // () => const AccountPage(),
                // transition: Transition.cupertino,
                // duration: const Duration(milliseconds: 600),
                // curve: Curves.easeOut,
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
            }
          ),
        ]
      )
    );}}