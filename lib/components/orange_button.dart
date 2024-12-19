import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const OrangeButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.08,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(245, 141, 29, 1),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
