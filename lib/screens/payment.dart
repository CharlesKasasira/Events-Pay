import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Declare variables to store the selected ticket type, number of tickets, and total price
  String _selectedTicketType = 'Bronze';
  int _numberOfTickets = 1;
  double _totalPrice = 5000;

  // Define a function to update the selected ticket type
  void updateSelectedTicketType(String? value) {
    print(value);
  }

  void main() {
    void Function(String)? myFunctionNullableVar = updateSelectedTicketType;
  }


  // Define a function to update the number of tickets
  void updateNumberOfTickets(int numberOfTickets) {
    setState(() {
      _numberOfTickets = numberOfTickets;
    });
  }

  // Define a function to calculate the total price
  void calculateTotalPrice() {
    setState(() {
      _totalPrice = _numberOfTickets * 5000;
    });
  }

  // Define a function to make the payment
  void makePayment() {
    // TODO: Implement your payment processing logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown menu to select the ticket type
            DropdownButton<String>(
              value: _selectedTicketType,
              items: const [
                DropdownMenuItem(value: 'Bronze', child: Text('Bronze')),
                DropdownMenuItem(value: 'Silver', child: Text('Silver')),
                DropdownMenuItem(value: 'Gold', child: Text('Gold')),
              ],
              onChanged: updateSelectedTicketType, // This is the correct line
            ),
            const SizedBox(height: 16.0),
            // Textfield to enter the number of tickets
            TextField(
              keyboardType: TextInputType.number,
              controller: TextEditingController(text: _numberOfTickets.toString()),
              onChanged: (value) {
                updateNumberOfTickets(int.parse(value)); // This is the correct line
              },
              decoration: const InputDecoration(
                labelText: 'Number of Tickets',
              ),
            ),
            const SizedBox(height: 16.0),
            // Text to display the total price
            Text(
              'Total: \u{20B9} ${_totalPrice.toString()}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            // Button to make the payment
            ElevatedButton(
              onPressed: makePayment,
              child: const Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
