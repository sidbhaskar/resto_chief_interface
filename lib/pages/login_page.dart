import 'package:flutter/material.dart';
import 'package:resto_chief_interface/services/db.dart';

import '../components/orange_button.dart';
import 'otp_page.dart';
import 'signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();

  final _authService = AuthService();
  // void onLogin() async {
  //   if (phoneController.text.isEmpty || phoneController.text.length != 10) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please enter a valid phone number')),
  //     );
  //     return;
  //   }

  //   try {
  //     await authServices.sendOtp('+91${phoneController.text}');
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) =>
  //             OtpPage(phoneNumber: '+91${phoneController.text}'),
  //       ),
  //     );
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to send OTP: $e')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: const Color(0xff121222),
      // appBar: AppBar(
      //   backgroundColor: const Color(0xff121222),
      //   iconTheme: IconThemeData(color: Colors.white),
      // ),
      body: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.3,
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Please sign in to your existing account',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('PHONE'),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 10),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                  ),
                                ),
                                child: const Text(
                                  '+91',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: phoneController,
                                  style: const TextStyle(fontSize: 18),
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    hintText: 'Your number',
                                    hintStyle: TextStyle(fontSize: 18),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2.0),
                                    ),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                              child: Checkbox(
                                value: false,
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text("Remember me"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        OrangeButton(
                          text: 'LOG IN',
                          onTap: () {
                            final phone =
                                "+91${phoneController.text}"; // Get phone number from TextField
                            _authService.sendOTP(
                              phoneNumber: phone,
                              onCodeSent: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(message)),
                                );
                                print(message);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OtpPage(
                                      phoneNumber: '+91${phoneController.text}',
                                    ),
                                  ),
                                );
                              },
                              onError: (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(error)),
                                );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignupPage(),
                                    ));
                              },
                              child: const Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Color(0xffee7e3c),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
