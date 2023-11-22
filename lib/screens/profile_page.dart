import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                width: 100.0, // Set the desired width and height for the avatar
                height: 100.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black, // Set the desired color for the border
                    width: 5.0, // Set the desired thickness for the border
                  ),
                ),
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/hajat.jpg'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Shanifah',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                //controller: fullName,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(height: 10),
              TextField(
                  //controller: email,
                  decoration: InputDecoration(labelText: 'Email')),
              SizedBox(
                height: 10,
              ),
              TextField(
                //controller: phone,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              SizedBox(height: 10),
              TextField(
                //controller: password,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.black),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.pinkAccent),
                ),
              ),
              SizedBox(height: 10),
            ],
          )),
        ));
  }
}
