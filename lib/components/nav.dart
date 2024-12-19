import 'package:flutter/material.dart';

class Nav extends StatelessWidget implements PreferredSizeWidget {
  final String location;
  const Nav({super.key, required this.location});
  final count = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff7f8f9),
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
      child: AppBar(
        backgroundColor: Color(0xfff7f8f9),
        leading: Container(
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: Image.asset('assets/icons/Menu.png'),
            onPressed: () {
              debugPrint("Menu button pressed");
            },
          ),
        ),
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "LOCATION",
              style: TextStyle(
                color: Color(0xFFFC6E2A),
                fontFamily: 'Sen',
                fontSize: 13,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              location,
              style: const TextStyle(
                color: Color(0xFF676767),
                fontFamily: 'Sen',
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 40,
                  height: 45,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}
