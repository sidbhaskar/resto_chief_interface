import 'package:flutter/material.dart';

import '../../components/orange_button.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xff121222),
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * 0.25,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Please sign up to get started',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('NAME'),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 25),
                          child: const TextField(
                            style: TextStyle(fontSize: 18),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: 'john doe',
                              hintStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                            ),
                          ),
                        ),
                        const Text('PHONE'),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 25),
                          child: const TextField(
                            style: TextStyle(fontSize: 18),
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              hintText: '012356789',
                              hintStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                            ),
                          ),
                        ),
                        const Text('EMAIL'),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 25),
                          child: const TextField(
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              hintText: 'user@email.com',
                              hintStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                            ),
                          ),
                        ),
                        const Text('ADDRESS'),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 25),
                          child: const TextField(
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.location_on,
                                color: Colors.grey,
                              ),
                              hintText: 'jammu, kunjwani',
                              hintStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('STREET'),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 25),
                                  width: width * 0.4,
                                  child: const TextField(
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      hintText: 'street 10',
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('PINCODE'),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 25),
                                  width: width * 0.4,
                                  child: const TextField(
                                    style: TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                      hintText: '34987',
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.grey),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.blue, width: 2.0),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Text('APPARTMENT'),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 25),
                          child: const TextField(
                            style: TextStyle(fontSize: 18),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: '154',
                              hintStyle:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 18),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const OrangeButton(
                          text: 'SIGN UP',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account?',
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
                                      builder: (context) => const LoginPage(),
                                    ));
                              },
                              child: const Text(
                                'LOG IN',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
