import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Profile',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headlineLarge,
      )),
    );
    body:
    SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            SizedBox(
              width: 120, height: 120,
              child: ClipRRect(
                borderRadius:BorderRadius.circular(100),
              
            )
          ],
        ),
      ),
    );
  }
}
