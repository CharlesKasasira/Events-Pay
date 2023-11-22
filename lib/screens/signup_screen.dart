import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Colors.black
      ), 
    child: Scaffold(
      // bottomNavigationBar: CustomNavBar(),
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
      child:Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
               fit: BoxFit.fill,
              image: AssetImage('assets/images/logo.png') )
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: fullName,
            decoration: InputDecoration(labelText: 'Full Name',
            focusColor: Colors.black)),
            SizedBox(height: 10,),
            TextField(
            controller: email,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email')),
            SizedBox(height: 10),
            TextField(
            controller: phone,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: 'Phone Number')),
            SizedBox(height:10),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height:10),
             TextField(
              controller: confirmPassword,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, 'login');
              } ,
               child: Text('Sign Up'),
               style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
               ),
               ),
               SizedBox(height:10),
               RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),recognizer: TapGestureRecognizer()
                      ..onTap=() {
                        Navigator.pushNamed(context, 'login');
                      }
                    
                    )
                  ]
                ) )
               

        ],)

      
      )

      )


    ));
  }
}