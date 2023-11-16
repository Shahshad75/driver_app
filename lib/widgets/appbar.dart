// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/controller/home_controller.dart';

class CustomappBar extends StatelessWidget {
  CustomappBar({super.key});
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        toolbarHeight: 90.0,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 255, 200, 0),
          child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
        ),
        title: Obx(
          () => Text(controller.value.value == false ? 'Offline' : 'Online',
              style: GoogleFonts.urbanist(
                  color: const Color.fromARGB(255, 65, 65, 65),
                  fontSize: 22,
                  fontWeight: FontWeight.w600)),
        ),
        actions: [
          Obx(
            () => CupertinoSwitch(
              activeColor: const Color.fromARGB(255, 255, 200, 0),
              value: controller.value.value,
              onChanged: (value) {
                controller.value.value = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
