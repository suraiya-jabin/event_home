import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 60,
            title: const Text(
              "Profile",
              style: TextStyle(
                color: Colors.indigoAccent,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Container(
                  height: 150,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/undraw_engineering.svg',
                  ),
                ),
                const SizedBox(height: 40),
                buildMenuItem(Icons.person_2_outlined, "User"),
                const SizedBox(height: 10),
                buildMenuItem(Icons.settings, "Settings"),
                const SizedBox(height: 10),
                buildMenuItemWithDropdown(
                    Icons.payment_outlined, "Payment", context),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem(IconData iconData, String text) => Container(
        height: 60,
        width: 360,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 22, 22, 22).withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
          color: Color.fromARGB(255, 176, 188, 255),
        ),
        child: Row(
          children: [
            const SizedBox(width: 30),
            Icon(iconData, color: Colors.black),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );

  Widget buildMenuItemWithDropdown(
          IconData iconData, String text, BuildContext context) =>
      GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  height: 100,
                  color: const Color.fromARGB(255, 176, 188, 255),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Cash',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Digital Wallet',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          height: 60,
          width: 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: const Offset(0, 3),
              ),
            ],
            color: const Color.fromARGB(255, 176, 188, 255),
          ),
          child: Row(
            children: [
              const SizedBox(width: 30),
              Icon(iconData, color: Colors.black),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 170),
              const Icon(Icons.arrow_drop_down, size: 30, color: Colors.black),
            ],
          ),
        ),
      );
}
