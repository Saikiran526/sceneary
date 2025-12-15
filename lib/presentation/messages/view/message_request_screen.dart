import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sceneary/presentation/messages/viewmodel/messages_individual_viewmodel.dart';

class MessageRequestScreen extends StatelessWidget {
  const MessageRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MessagesIndividualViewmodel(context: context),
      child: Consumer(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Message Requests',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children:List.generate(6, (index){
                  return Column(
                    children: [
                      SizedBox(height: 16,),
                       Container(
                    width: 328,
                    height: 64,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xFFD9D9D9),
                            ),
                            const SizedBox(width: 16),
                            const Text(
                              'Ram',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                         Row(
                          children: [
                             Container(
                              width: 80,
                              height: 28,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xFF454545),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF3D3D3D),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8), 
                            Container(
                              width: 80,
                              height: 28,
                              padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                              decoration: BoxDecoration(
                                color: Color(0xFF4F4F4F),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Center(
                                child: Text(
                                  "Accept",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                    ],
                  );
                })
              ),
            ),
          );
        },
      ),
    );
  }
}
