import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:packingticketingsystem/controllers/auth_controllers.dart';
import 'package:packingticketingsystem/screens/signup_screen.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:packingticketingsystem/utils/validator.dart';
import 'package:packingticketingsystem/widgets/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage ({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = AuthController();
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _passwordController;
  bool _isLoading = false;
  final _focusPhoneNumber = FocusNode();
  final _focusPassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String dialCode = '256';

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState!.validate()) {
      print(_phoneNumberController.text.trim());
      print(_passwordController.text.trim());
      _authController.signIn(
        dialCode + _phoneNumberController.text.trim(),
        _passwordController.text.trim(),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  void moveToSignup() {
    Get.off(
      () => const SignUpPage(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  void moveToForgotPassword() {
    Get.off(
      () => const SignUpPage(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:GestureDetector(
          onTap: () {
            _focusPhoneNumber.unfocus();
            _focusPassword.unfocus();
          },
          child: SafeArea(
            child: SingleChildScrollView(
                reverse: true,
                physics: const BouncingScrollPhysics(),
                child:Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 50),
                        const SizedBox(height: 20),

                        Center(child: Image.asset('assets/images/logo.png')),
                        const SizedBox(height: 64,),
                                  
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  const Text(
                                    'Phone Number',
                                    style: kNunitoSans16,
                                  ),
                                  const SizedBox(height: 4),
                                  IntlPhoneField(
                                    cursorColor: kLeadBlack,
                                    controller: _phoneNumberController,
                                    focusNode: _focusPhoneNumber,
                                    textInputAction: TextInputAction.next,
                                    decoration: inputDecorationConst.copyWith(
                                      labelText: "777777777",
                                    ),
                                    initialCountryCode: 'UG',
                                    onChanged: (phone) {},
                                    onCountryChanged: (country) {
                                      setState(() {
                                        dialCode = country.dialCode;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height:8),

                            Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Password',
                                style: kNunitoSans16,
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                cursorColor: kLeadBlack,
                                controller: _passwordController,
                                obscureText: !_showPassword,
                                focusNode: _focusPassword,
                                validator: (value) =>
                                    Validator.validatePassword(
                                  password: value,
                                ),
                                decoration: inputDecorationConst.copyWith(
                                  labelText: "Password",
                                )
                              )
                            ]
                        ),


                            ],
                          ),
                        ),
                                  
                        const SizedBox(height:22),
                                  
                        CustomElevatedButton(
                        onTap: _signIn,
                        text: _isLoading ? "Loading" : "LOGIN",
                      ),
                                  
                       const SizedBox(height:10),
                                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: moveToForgotPassword,
                            child: const Text(
                              'Forgot Password?',
                              style: kNunitoSansSemiBold18,
                            ),
                          ),
                        ],
                      ),
                                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account,",
                            style: kNunitoSansSemiBold18.copyWith(
                              color: kLeadBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: moveToSignup,
                            child: Text(
                              'SIGN UP',
                              style:
                                  kNunitoSansSemiBold18.copyWith(fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      
                      
                      ],),
                  ),
                )
                  
            ),
          ),
        )


    );
  }
}