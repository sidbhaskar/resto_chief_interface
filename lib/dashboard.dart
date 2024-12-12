import 'package:flutter/material.dart';
import 'package:resto_chief_interface/nav.dart';
import 'package:resto_chief_interface/running_orders_card.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xfff7f8f9),
      appBar: const Nav(location: 'Jammu'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: height * 0.75,
                            padding: const EdgeInsets.all(18),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '20 Running Orders',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: const EdgeInsets.only(top: 20),
                                        child: RunningOrdersCard(
                                          tag: 'Breakfast',
                                          orderName: 'Chicken Bhuma',
                                          orderId: '3202',
                                          orderPrice: 60,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: height * 0.17,
                      width: width * 0.42,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '20',
                            style: TextStyle(
                                fontSize: 60, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'RUNNING ORDERS',
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: height * 0.17,
                    width: width * 0.42,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '05',
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'ORDER REQUEST',
                          style: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: height * 0.24,
                color: Colors.black12,
                child: const Center(
                  child: Text('soon'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: height * 0.13,
                color: Colors.black12,
                child: const Center(
                  child: Text('soon'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: height * 0.2,
                color: Colors.black12,
                child: const Center(
                  child: Text('soon'),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: height * 0.1,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/icons/dashboard.png',
              height: 20,
              color: Colors.orange,
            ),
            const Icon(
              Icons.menu,
              size: 30,
              color: Colors.grey,
            ),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xfffdf1f2),
                border: Border.all(color: Colors.orange),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  size: 30,
                  color: Colors.orange,
                ),
              ),
            ),
            const Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: Colors.grey,
            ),
            const Icon(
              Icons.person_outline_rounded,
              size: 30,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
