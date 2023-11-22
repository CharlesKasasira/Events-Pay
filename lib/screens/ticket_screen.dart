import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/paidevents_screen.dart';


class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white),
              onPressed: () {
                // take back to payment screen but for testing it push to paid ticket screen
                Get.off(() => PaidTicketScreen());
                // Handle back button press
              },
            ),
            Text("My Ticket", style: TextStyle(color: Colors.white)),
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
            // First Container
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue, // Change color as needed
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Malalas",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Text("Church"),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildTextPair("Ticket for", "Date"),
                  SizedBox(height: 16),
                  _buildTextPair("Kasasira Charles", "eventDate", isBold: true, textColor: Colors.green),
                  SizedBox(height: 32),
                  _buildTextPair("Ticket Type", "Time"),
                  SizedBox(height: 16),
                  _buildTextPair("eventTicket", "eventTime", isBold: true, textColor: Colors.green),
                ],
              ),
            ),
            // Dotted Line
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: CustomPaint(
                painter: DottedLinePainter(),
              ),
            ),
            // Second Container
            Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.blue, // Change color as needed
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  Text(
                    "Show the QR Code at the entrance",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Image.asset(
                    "assets/images/qr-code.png", // Replace with your QR code image
                    height: 100,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Print Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Handle print button press
                },
                child: Text("Print Ticket"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextPair(String leftText, String rightText, {bool isBold = false, Color textColor = Colors.black}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        Text(
          rightText,
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: textColor,
          ),
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2.0;

    final double startY = 0.0;
    final double endY = size.height;

    double currentY = startY;
    const double dashHeight = 5.0;
    const double gapHeight = 5.0;

    while (currentY < endY) {
      canvas.drawLine(
        Offset(0, currentY),
        Offset(0, currentY + dashHeight),
        paint,
      );

      currentY += dashHeight + gapHeight;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
