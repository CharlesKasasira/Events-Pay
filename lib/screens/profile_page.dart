import 'package:flutter/material.dart';
import 'package:packingticketingsystem/widgets/drawer.dart';


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          
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
        }),
          title: Text(
            'Profile',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                width: 200.0, // Set the desired width and height for the avatar
                height: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black, // Set the desired color for the border
                    width: 5.0, // Set the desired thickness for the border
                  ),
                ),
                child: const CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/hajat.jpg'),
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
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Delete Account',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color.fromARGB(219, 236, 28, 28)),
                ),
              ),
              SizedBox(height: 10),
            ],
          )
          )),
        ));
  }
}
