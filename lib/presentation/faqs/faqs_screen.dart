import 'package:flutter/material.dart';
import 'package:sceneary/presentation/app_utils/app_widgets.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: customAppBar(title: 'FAQS'),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffE0E0E0),
                  width: 1
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What is Call Sheet ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333)
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffE0E0E0),
                  width: 1
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What is Call Sheet ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333)
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.02,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Color(0xffE0E0E0),
                  width: 1
                )
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 21.0,vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'What is Call Sheet ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333)
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
