import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxi_app/widgets/driver_revenue_side/history_listtile.dart';
import 'package:taxi_app/widgets/driver_revenue_side/revenue_table.dart';
import 'package:taxi_app/widgets/texts/short_text.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.amber,
        title: const Text('Helo Ameen'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.question_mark)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "\$320",
                    style: GoogleFonts.urbanist(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w700),
                  ),
                  const ShortText(text: 'Today profit,with out tip', otp: true),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: RevenueTable(
                          totaldrive: '30', profit: '1000', tips: '100'))
                ],
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return UserInfo();
                },
              ))
        ],
      ),
    );
  }
}
