import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/ticket_screen.dart';
import 'package:packingticketingsystem/screens/events_screen.dart';


class Events_Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white),
              onPressed: () {
                Get.off(() => EventsScreen());
                // Handle back button press
              },
            ),
            Text("Event Details",style: TextStyle(color: Colors.white)),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/profile_image.jpg"),
          ),
        ],
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
