import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage ({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController password = TextEditingController();

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 100,),
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/logo.png') )
                          ),
                        ),SizedBox(height: 10,),
                        TextField(
                            controller: phoneNumber,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(labelText: 'Phone Number')),
                        SizedBox(height:10),
                        TextField(
                          controller: password,
                          obscureText: true,
                          decoration: InputDecoration(labelText: 'Password')),
                        SizedBox(height:20),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, 'home');
                          } ,
                          child: Text('LOGIN'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                          ),
                        ),
                        SizedBox(height:10),
                        RichText(
                            text: TextSpan(
                                text: "Don't have an account? ",
                                style: TextStyle(color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        decoration: TextDecoration.underline,
                                      ),recognizer: TapGestureRecognizer()
                                    ..onTap=() {
                                      Navigator.pushNamed(context, 'signup');
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