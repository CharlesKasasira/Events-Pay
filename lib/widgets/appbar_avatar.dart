import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarAvatar extends StatefulWidget {
  const AppBarAvatar({super.key});

  @override
  State<AppBarAvatar> createState() => _AppBarAvatarState();
}

class _AppBarAvatarState extends State<AppBarAvatar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          // Get.to(
          //   () => const AccountPage(),
          //   curve: Curves.easeOut,
          // );
        },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(75.0),
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 200, 200, 200),
          ),
          child: Image.asset("assets/images/avatar_icon.png"),
        )
      )
    );
  }
}