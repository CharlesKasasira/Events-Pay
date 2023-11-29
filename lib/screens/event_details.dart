import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/ticket_screen.dart';
import 'package:packingticketingsystem/screens/events_screen.dart';
import 'package:packingticketingsystem/widgets/appbar_avatar.dart';


class Events_Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: const Color.fromARGB(100, 158, 158, 158),
        backgroundColor: const Color(0xff1a1a1a),
        elevation: 0,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Event Details",style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 10,
            ),
            AppBarAvatar()
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset("assets/images/hajat.jpg",
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "eventName",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "eventDate",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "at eventLocation",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Ticket Prices",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              color: Colors.grey.shade200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTicketPriceRow("Bronze", "5000/="),
                  _buildTicketPriceRow("Silver", "10000/="),
                  _buildTicketPriceRow("Gold", "15000/="),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              color: Colors.black45,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // push to make payment screen but for testing pushing it to ticket screen
                  Get.off(() => TicketScreen());
                  // Handle button press
                },
                child: Text(
                  "Make Payment",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  Widget _buildTicketPriceRow(String name, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
