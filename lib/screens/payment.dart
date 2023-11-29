import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:packingticketingsystem/screens/ticket_screen.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:packingticketingsystem/widgets/appbar_avatar.dart';
import 'package:packingticketingsystem/widgets/button.dart';
import 'package:packingticketingsystem/widgets/myseparator.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  // Declare variables to store the selected ticket type, number of tickets, and total price
  // String _selectedTicketType = 'Bronze';
  String _numberOfTickets = "1";
  double _totalPrice = 5000;
  String amount = '5000';

  // List of items in our dropdown menu
  List<String> items = [
    'Bronze',
    'Silver',
    'Gold',
  ];

  String dropdownvalue = 'Bronze';

  Map<String, String> feesPerItems = {
    "Bronze": "5000",
    "Silver": "10000",
    "Gold": "100000",
  };

  dynamic selected = 1;

  List checkListItems = [
    {
      "id": 1,
      "value": false,
      "title": "MTN MoMo",
    },
    {
      "id": 2,
      "value": false,
      "title": "Airtel Money",
    },
  ];

  // Define a function to update the selected ticket type
  void updateSelectedTicketType(String? value) {
    print(value);
  }

  void main() {
    void Function(String)? myFunctionNullableVar = updateSelectedTicketType;
  }


  // Define a function to update the number of tickets
  void updateNumberOfTickets(String numberOfTickets) {
    setState(() {
      _numberOfTickets = numberOfTickets;
    });
  }

  // Define a function to calculate the total price
  void calculateTotalPrice() {
    setState(() {
      _totalPrice = int.parse(_numberOfTickets) * 5000;
    });
  }

  // Define a function to make the payment
  void makePayment() {
    // TODO: Implement your payment processing logic here
    Get.to(() => TicketScreen());
  }

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
            Text("Payment",style: TextStyle(color: Colors.white)),
            SizedBox(
              width: 10,
            ),
            AppBarAvatar()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Select Ticket Type",
                    style: TextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      border: Border.all(color: kTinGrey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton(
                      hint: const Text("Select Car Class"),
                      isDense: true,
                      isExpanded: true,
                      value: dropdownvalue,
                      dropdownColor: Colors.white,
                      onChanged: (String? newValue) {
                        print(newValue);
                        setState(() {
                          dropdownvalue = newValue!;
                          amount = (int.parse(_numberOfTickets) * int.parse(feesPerItems[newValue]!)).toString();
                        });
                      },

                       // add extra sugar..
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 42,
                      underline: const SizedBox(),

                      // Array list of items
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),

                    )
                    )
                ],
              ),
              const SizedBox(height: 16.0),
              // Textfield to enter the number of tickets
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Number of Tickets",
                    style: TextStyle(),
                  ),
                  const SizedBox(height: 4,),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: TextEditingController(text: _numberOfTickets.toString()),
                    onChanged: (value) {
                      updateNumberOfTickets(value); // This is the correct line
                    },
                    decoration: inputDecorationConst.copyWith(
                      label: Text("Number of Tickets")
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
      
              const SizedBox(
                        height: 10,
                      ),
              const MySeparator(color: Colors.grey),
              const SizedBox(
                height: 16,
              ),
      
              // Text to display the total price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total:',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(
                    '${amount.toString()}',
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
      
              const SizedBox(
                        height: 10,
                      ),
              const MySeparator(color: Colors.grey),
              const SizedBox(
                height: 10,
              ),
                const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Choose Payment Method",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
      
              Container(
              margin: const EdgeInsets.only(left: 15),
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 10, right: 2),
                  decoration: BoxDecoration(
                        color: const Color(0xffffcc00),
                        border: Border.all(
                            color: selected == 2 ? kTinGrey : ksecondary),
                        borderRadius: BorderRadius.circular(8)),
              child: CheckboxListTile(
                      activeColor: ksecondary,
                      // checkboxShape: ,
                      controlAffinity: ListTileControlAffinity.trailing,
                      secondary: SvgPicture.asset(
                        "assets/icon/mtn.svg",
                        width: 50,
                      ),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        "${checkListItems[0]["title"]}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                      ),
                      value: checkListItems[0]["value"] == true,
                      onChanged: (value) {
                        setState(() {
                          for (var element in checkListItems) {
                            element["value"] = false;
                          }
                          checkListItems[0]["value"] = value;
                          selected = checkListItems[0]["id"];
                        });
                      },
                    ),
                  ),
              const SizedBox(
                    height: 10,
                  ),
              Container(
                    margin: const EdgeInsets.only(left: 15),
                    padding: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 10, right: 2),
                    decoration: BoxDecoration(
                        color: const Color(0xffee1c25),
                        border: Border.all(
                            color: selected == 1 ? kTinGrey : ksecondary),
                        borderRadius: BorderRadius.circular(8)),
                    child: CheckboxListTile(
                      activeColor: ksecondary,
                      // checkboxShape: ,
                      controlAffinity: ListTileControlAffinity.trailing,
                      secondary: SvgPicture.asset("assets/icon/airtel.svg"),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        "${checkListItems[1]["title"]}",
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      value: checkListItems[1]["value"] == true,
                      onChanged: (value) {
                        setState(() {
                          for (var element in checkListItems) {
                            element["value"] = false;
                          }
                          checkListItems[1]["value"] = value;
                          selected = checkListItems[1]["id"];
                        });
                      },
                    ),
                  ),
      
                const SizedBox(height: 16,),
      
              CustomElevatedButton(onTap: makePayment, text: "Pay Now")
            ],
          ),
        ),
      ),
    );
  }
}
