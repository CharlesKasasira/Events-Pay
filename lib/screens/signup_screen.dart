import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:packingticketingsystem/controllers/auth_controllers.dart';
import 'package:packingticketingsystem/screens/login%20page.dart';
import 'package:packingticketingsystem/utils/constants.dart';
import 'package:packingticketingsystem/utils/validator.dart';
import 'package:packingticketingsystem/widgets/button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthController _authController = AuthController();
  bool _isLoading = false;
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneNumberController;
  late final TextEditingController _passwordController;
  final _focusEmail = FocusNode();
  final _focusName = FocusNode();
  final _focusPhoneNumber = FocusNode();
  final _focusPassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  String dialCode = '256';

  void _togglePasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
    });

    showDialog(
        // The user CANNOT close this dialog  by pressing outsite it
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return Dialog(
            // The background color
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  // The loading indicator
                  CircularProgressIndicator(
                    color: kOffBlack,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ),
          );
        });

    try {
      if (_formKey.currentState!.validate()) {
        _authController.signUp(
            _emailController.text.trim(),
            dialCode + _phoneNumberController.text.trim(),
            _passwordController.text.trim(),
            _nameController.text.trim()
          );
      }
    } catch (error) {
      kDefaultDialog("Failed", "$error");
    }

    if (!mounted) return;
    Navigator.of(context).pop();

    setState(() {
      _isLoading = false;
    });
  }

  void moveToLogin() {
    Get.off(
      () => const LoginPage(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
          onTap: () {
            _focusEmail.unfocus();
            _focusName.unfocus();
            _focusPhoneNumber.unfocus();
            _focusPassword.unfocus();
          },
          child: SafeArea(
              child: SingleChildScrollView(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            child: Container(
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
                        const SizedBox(height: 48,),

                      Form(
                        key: _formKey,
                        child: Column(children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Full Name',
                                style: kNunitoSansSemiBold18,
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                cursorColor: kLeadBlack,
                                controller: _nameController,
                                focusNode: _focusName,
                                validator: (value) =>
                                    Validator.validateName(
                                  name: value,
                                ),
                                decoration: inputDecorationConst.copyWith(
                                  labelText: "Fullname",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Phone Number',
                                  style: kNunitoSansSemiBold18,
                                ),
                                const SizedBox(height: 4),
                                IntlPhoneField(
                                  cursorColor: kLeadBlack,
                                  controller: _phoneNumberController,
                                  focusNode: _focusPhoneNumber,
                                  textInputAction: TextInputAction.next,
                                  decoration: inputDecorationConst.copyWith(
                                    labelText: "Phone Number",
                                  ),
                                  initialCountryCode: 'UG',
                                  onChanged: (phone) {},
                                  onCountryChanged: (country) {
                                    setState(() {
                                      dialCode = country.dialCode;
                                    });
                                  },
                                ),
                              ]),
                          const SizedBox(height: 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Email',
                                style: kNunitoSansSemiBold18,
                              ),
                              const SizedBox(height: 4),
                              TextFormField(
                                cursorColor: kLeadBlack,
                                controller: _emailController,
                                focusNode: _focusEmail,
                                validator: (value) =>
                                    Validator.validateEmail(
                                  email: value,
                                ),
                                decoration: inputDecorationConst.copyWith(
                                  labelText: "Email",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Password',
                                style: kNunitoSansSemiBold18,
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
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: GestureDetector(
                                      onTap: _togglePasswordVisibility,
                                      child: SvgPicture.asset(
                                          _showPassword
                                              ? "assets/icons/password_invisible.svg"
                                              : "assets/icons/password_visible.svg",
                                          height: 15,
                                          width: 20,
                                          colorFilter: const ColorFilter.mode(
                                              kTextGray, BlendMode.srcIn)),
                                    ),
                                  ),
                                  suffixIconConstraints:
                                      const BoxConstraints(maxWidth: 50),
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      CustomElevatedButton(
                        onTap: _signUp,
                        text: _isLoading ? "Loading" : "SIGN UP",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: kNunitoSansSemiBold18.copyWith(
                              color: kTextGray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextButton(
                            onPressed: moveToLogin,
                            child: Text('LOGIN',
                                style: kNunitoSansSemiBold18.copyWith(
                                    fontSize: 15)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ))),
    );
  }
}

//   // void moveToForgot() {
//   //   Get.off(
//   //     () => const ForgotPage(),
//   //     transition: Transition.cupertino,
//   //     duration: const Duration(milliseconds: 600),
//   //     curve: Curves.easeOut,
//   //   );
//   // }
// }