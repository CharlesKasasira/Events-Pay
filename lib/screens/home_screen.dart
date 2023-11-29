import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:packingticketingsystem/screens/event_details.dart';
import 'package:packingticketingsystem/utils/color_constants.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:packingticketingsystem/widgets/appbar_avatar.dart';
import 'package:packingticketingsystem/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storage = GetStorage();
  late Map profileMap = storage.read('profile');
  late String fullName = profileMap['fullName'] ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.kprimary,
      appBar: AppBar(
        shadowColor: const Color.fromARGB(100, 158, 158, 158),
        backgroundColor: const Color(0xff1a1a1a),
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 10,
            ),
            AppBarAvatar()
          ],
        ),
        leading: Builder(builder: (context) {
          return Container(
            width: 25,
            height: 25,
            margin: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 5),
            child: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          );
        }),),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Major Events',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
                      "assets/images/proclaim.jpg",
                      width: MediaQuery.of(context).size.width,
                    ),
          const SizedBox(height: 18),

          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              color: Colors.white,
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Events List", style: TextStyle(fontSize: 18),),
                  ),
                  Divider( thickness: 1,),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => Events_Details(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Ink(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset("assets/images/xmascantanta.jpg", width: 56, height: 56,)),
                        title: Text("Christmas Cantant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        subtitle: Row(
                          children: [
                            Text("12/12/2023"),
                            SizedBox(width: 8,),
                            Text("Watoto", style: TextStyle(color: kGreen),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => Events_Details(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Ink(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset("assets/images/meatandloaf.jpg")),
                        title: Text("Meat and Loaf", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        subtitle: Row(
                          children: [
                            Text("12/04/2023"),
                            SizedBox(width: 8,),
                            Text("Lugogo cricket Oval", style: TextStyle(color: kGreen),),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => Events_Details(),
                        transition: Transition.cupertino,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Ink(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset("assets/images/youth.jpg", width: 56, height: 56,)),
                        title: Text("Munyigo Pro Max", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                        subtitle: Row(
                          children: [
                            Text("01/01/2024"),
                            SizedBox(width: 8,),
                            Text("Uganda Museum", style: TextStyle(color: kGreen),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          
        ]
      ),
      drawer: const MyDrawer(),
    );
  }
}