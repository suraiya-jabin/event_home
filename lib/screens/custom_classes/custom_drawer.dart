import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'country_dropdown_search.dart';

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
                buildCountryDropdownSearch(context),
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
              color: const Color.fromARGB(255, 22, 22, 22).withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: const Offset(0, 4),
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
          ],
        ),
      );

  Widget buildMenuItemWithDropdown(
          IconData iconData, String text, BuildContext context) =>
      Container(
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
      );

  Widget buildCountryDropdownSearch(BuildContext context) => Container(
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
            const Icon(Icons.location_on, color: Colors.black),
            const SizedBox(width: 10),
            const Text(
              'Country',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: CountryDropdownSearch(
                onChanged: (String? value) {},
              ),
            ),
          ],
        ),
      );
}
