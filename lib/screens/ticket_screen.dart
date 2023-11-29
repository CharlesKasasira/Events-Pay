import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/paidevents_screen.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:packingticketingsystem/widgets/appbar_avatar.dart';
import 'package:packingticketingsystem/widgets/button.dart';
import 'package:packingticketingsystem/widgets/myseparator.dart';


class TicketScreen extends StatelessWidget {
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
            Text("My Ticket",style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 10,
            ),
            AppBarAvatar()
          ],
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white, // Change color as needed
                borderRadius: BorderRadius.circular(4.0),
                boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // shadow color
                      spreadRadius: 5, // how much the shadow should spread
                      blurRadius: 7, // how blurry the shadow should be
                      offset: Offset(0, 2), // changes the shadow position
                    ),
                  ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Watoto Christmas Cantanta",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, color: kTinGrey,),
                      SizedBox(width: 8),
                      Text("Watoto Church (Downtown)"),
                    ],
                  ),
                  SizedBox(height: 16),
                  _buildTextPair("Ticket for", "Date"),
                  SizedBox(height: 16),
                  _buildTextPair("Charles Kasasira", "eventDate", isBold: true, textColor: Colors.green),
                  SizedBox(height: 32),
                  _buildTextPair("Ticket Type", "Time"),
                  SizedBox(height: 16),
                  _buildTextPair("eventTicket", "eventTime", isBold: true, textColor: Colors.green),

                  SizedBox(height: 24,),

                  const SizedBox(
                        height: 10,
                      ),
              const MySeparator(color: Colors.grey),
              const SizedBox(
                height: 16,
              ),

              Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Show the QR Code at the entrance",
                ),
                SizedBox(height: 16),
                Image.asset(
                  "assets/images/qr-code.png", color: Colors.black, // Replace with your QR code image
                  height: 100,
                ),
              ],
            ),
                ],
              ),
            ),
            
            
            SizedBox(height: 40),

            CustomElevatedButton(onTap: () {}, text: "Print Ticket"),
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
