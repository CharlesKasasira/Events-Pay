import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/payment.dart';
import 'package:packingticketingsystem/screens/ticket_screen.dart';
import 'package:packingticketingsystem/widgets/appbar_avatar.dart';
import 'package:packingticketingsystem/widgets/button.dart';


class Events_Details extends StatelessWidget {
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
              child: Image.asset("assets/images/xmascantanta.jpg",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Christmas Cantanta",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "24/12/2023",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              "Watoto",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Ticket Prices",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTicketPriceRow("Bronze", "5000/="),
                  SizedBox(height: 8),
                  _buildTicketPriceRow("Silver", "10000/="),
                  SizedBox(height: 8),
                  _buildTicketPriceRow("Gold", "15000/="),
                ],
              ),
            ),
            SizedBox(height: 16),

            CustomElevatedButton(onTap: (){
              Get.to(() => PaymentScreen());
            }, text: "Make Payment"),
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
