import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentations/subscription/subscription_viewmodel.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<SubscriptionViewmodel>(context);

    // if (providerData.selectDate == null) {
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     providerData.selectedDate(context);
    //   });
    // }

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 228, 227, 227),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(left: 5),
                      icon: const Icon(Icons.arrow_back_ios, size: 16),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Calender",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        providerData.selectedDate(context);
                      },
                      child: Text('PickDate'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  height: 93,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 228, 227, 227),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text(
                          "Mark Your Availability",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Spacer(),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.black,
                          child: Icon(Icons.add, color: Colors.white, size: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
