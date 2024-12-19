import 'package:flutter/material.dart';

class RunningOrdersCard extends StatelessWidget {
  final String tag;
  final String orderName;
  final String orderId;
  final int orderPrice;
  RunningOrdersCard(
      {required this.tag,
      required this.orderName,
      required this.orderId,
      required this.orderPrice,
      super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Row(
      children: [
        Container(
          height: width * 0.35,
          width: width * 0.35,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: Container(
            height: width * 0.3,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '#$tag',
                        style: const TextStyle(
                            color: Color(0xffFF7622), fontSize: 18),
                      ),
                      Text(
                        orderName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ID: $orderId',
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '₹${orderPrice.toString()}',
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 7),
                        decoration: BoxDecoration(
                          color: const Color(0xffFF7622),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: const Color(0xffFF7622),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Color(0xffFF7622)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
