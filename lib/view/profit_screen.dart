import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_app/controller/driver_controller.dart';
import 'package:taxi_app/model/revenue.dart';
import 'package:taxi_app/widgets/textfields/signup_textfields.dart';

class ProfitScreen extends StatelessWidget {
  ProfitScreen({super.key});

  final startDateController = TextEditingController();
  final endDateController = TextEditingController();
  final DriverController contorller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search your profit"),
      ),
      body: Column(
        children: [
          Card(
            color: const Color.fromARGB(255, 195, 195, 195),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomTextfield(
                      controller: startDateController, hintText: "Start Date"),
                  CustomTextfield(
                      controller: endDateController, hintText: "End Date"),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        contorller.getRevenue();
                      },
                      child: const Text("Search"))
                ],
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            child: contorller.revenue.isEmpty
                ? const Center(
                    child: Text("No datas, In this date "),
                  )
                : ListView.builder(
                    itemCount: contorller.revenue.length,
                    itemBuilder: (context, index) {
                      Revenue revenue = contorller.revenue[index];
                      return ListTile(
                        title: Text(
                            "Booking id : ${revenue.bookingId.toString()}"),
                        subtitle: Text(revenue.date),
                        trailing: Text(
                          "₹ ${revenue.fare.toString()}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
          ))
        ],
      ),
    );
  }
}
