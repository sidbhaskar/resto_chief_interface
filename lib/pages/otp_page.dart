import 'package:flutter/material.dart';
import 'package:resto_chief_interface/pages/dashboard.dart';

import '../../components/orange_button.dart';
import 'login_page.dart';
import '../services/db.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  const OtpPage({required this.phoneNumber, super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  // late String pn;
  // final authServices = AuthService();
  final _authService = AuthService();

  // @override
  // void initState() {
  //   super.initState();
  //   pn = widget.phoneNumber;
  // }

  final List<String> _otp = [
    '',
    '',
    '',
    '',
  ];
  int _currentIndex = 0;

  // void _onVerifyOtp() async {
  //   final otp = _otp.join(); // Combine the OTP digits into a single string
  //   if (otp.length != 6) {
  //     // Firebase OTPs are typically 6 digits
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please enter a valid 6-digit OTP')),
  //     );
  //     return;
  //   }

  //   try {
  //     final user = await authServices.verifyOtp(otp); // Call your AuthService
  //     if (user != null) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(content: Text('OTP Verified Successfully!')),
  //       );
  //       // Navigate to the home screen or next step
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //             builder: (context) =>
  //                 const LoginPage()), // Replace with your home page
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //             content: Text('Verification failed. Please try again.')),
  //       );
  //     }
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Error verifying OTP: $e')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff121222),
      appBar: AppBar(
        backgroundColor: const Color(0xff121222),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Verification',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'We have sent a code to your number',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    widget.phoneNumber,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('CODE'),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Resending OTP...')),
                            );
                            // authServices.sendOtp(pn); // Resend OTP
                          },
                          child: const Text(
                            'Resend',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'in.50sec',
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _buildOtpBoxes(),
                    const SizedBox(height: 30),
                    OrangeButton(
                      text: 'VERIFY OTP',
                      onTap: () async {
                        final otp = _otp.join();
                        if (otp.length != 4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter complete OTP')),
                          );
                          return;
                        }

                        final success = await _authService.verifyOTP(
                          otp: otp,
                          onError: (error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(error)),
                            );
                          },
                        );

                        if (success && mounted) {
                          // Navigate to home page or wherever you want after successful login
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Dashboard()),
                            (route) => false,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 100),
                    Expanded(
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 12,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                        ),
                        itemBuilder: (context, index) {
                          String buttonText;
                          if (index < 9) {
                            buttonText = (index + 1).toString();
                          } else if (index == 9) {
                            buttonText = '';
                          } else if (index == 10) {
                            buttonText = '0';
                          } else {
                            buttonText = '⌫';
                          }
                          return buttonText.isNotEmpty
                              ? _buildNumpadButton(buttonText)
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onKeyPress(String value) {
    setState(() {
      if (value == '⌫') {
        if (_currentIndex > 0) {
          _otp[_currentIndex - 1] = '';
          _currentIndex--;
        }
      } else if (_currentIndex < _otp.length) {
        _otp[_currentIndex] = value;
        _currentIndex++;
      }
    });
  }

  Widget _buildOtpBoxes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: _otp.map((digit) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5.0),
          alignment: Alignment.center,
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F5FA),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            digit,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNumpadButton(String value) {
    return GestureDetector(
      onTap: () => _onKeyPress(value),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
