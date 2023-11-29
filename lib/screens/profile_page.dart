import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:packingticketingsystem/widgets/appbar_avatar.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final storage = GetStorage();
  late Map profileMap = storage.read('profile');
  late String fullName = profileMap['fullName'] ?? "";
  late String email = profileMap['email'] ?? "";
  late String? phone = supabase.auth.currentUser?.phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        shadowColor: const Color.fromARGB(100, 158, 158, 158),
        backgroundColor: const Color(0xff1a1a1a),
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Profile",style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const SizedBox(height: 16),
            Center(
              child: ClipRRect(
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
            ),
            const SizedBox(
              height: 8,
            ),
            Center(
              child: Text(
                fullName,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: kNunitoSansSemiBold18.copyWith(
                    color: Colors.black
                  ),
                ),
                Text(
                  fullName,
                  style: kNunitoSans16,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: kNunitoSansSemiBold18.copyWith(
                    color: Colors.black
                  ),
                ),
                Text(
                  email,
                  style: kNunitoSans16,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone Number",
                  style: kNunitoSansSemiBold18.copyWith(
                    color: Colors.black
                  ),
                ),
                Text(
                  "$phone",
                  style: kNunitoSans16,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  style: kNunitoSansSemiBold18.copyWith(
                    color: Colors.black
                  ),
                ),
                const Text(
                  "************",
                  style: kNunitoSans16,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
            const SizedBox(height: 32),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.delete_outline, color: Colors.redAccent,),
                  SizedBox(width: 4,),
                  Text("Delete Account", style: TextStyle(color: Colors.redAccent, fontSize: 18, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
              ],
            ),
          ),
        ));
  }
}
