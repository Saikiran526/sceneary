import 'package:flutter/material.dart';
import 'package:sceneary/core/navigation/app_routes.dart';
import 'package:sceneary/core/navigation/routes_path.dart';

class ShootingSchedulesNotificationScreen extends StatelessWidget {
  const ShootingSchedulesNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Widget notificationDetails(){
      return Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '“New Shooting Schedule Assigned to You”',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: height*0.01,),
            Text(
              '“Scenes 14 & 14A are scheduled on 12 Oct',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff888888)
              ),
            ),
            SizedBox(height: height*0.01,),
            SizedBox(
              width: width*0.6,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff4F4F4F),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                      )
                  ),
                  onPressed: (){
                    AppRouter.instance.push(RoutePaths.acceptRejectShootingSchedulesScreen);
                  },
                  child: Text(
                    'View Details',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500
                    ),
                  )
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text('2h ago'),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: height*0.01,),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: notificationDetails(),
            ),
            SizedBox(height: height*0.01,),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: notificationDetails(),
            ),
            SizedBox(height: height*0.01,),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: notificationDetails(),
            ),
            SizedBox(height: height*0.01,),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: notificationDetails(),
            )
          ],
        ),
      ),
    );
  }
}
