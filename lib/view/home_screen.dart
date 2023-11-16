// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/controller/home_controller.dart';

import '../widgets/appbar.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: ScreenDrawer()),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), child: CustomappBar()),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() => controller.value.value == false
                ? Positioned(
                    top: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        height: 90,
                        color: Colors.amber,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 50,
                              child: Icon(
                                Icons.person_off_outlined,
                                color: Colors.amber,
                              ),
                            ),
                            title: Text(
                              'Your are offline',
                              style: GoogleFonts.urbanist(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Go online a start accepting job',
                              style: GoogleFonts.urbanist(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                        )),
                  )
                : const SizedBox())
          ],
        ),
      ),
    );
  }
}
