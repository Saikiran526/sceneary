import 'package:flutter/material.dart';
import 'package:sceneary/presentation/search_result_screen/utils.dart';

class SearchResultScreen extends StatelessWidget {
  const SearchResultScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final height = MediaQuery.of(context).size.height;
    // final width= MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(21.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Photographer
            Text(
              'Photographer',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: height*0.02,),

            ...[1,2,3,4].map((_){
              return Column(
                children: [
                  searchProfiles(size:size),
                  SizedBox(height: height*0.01,),
                ],
              );
            }).toList(),


          ],
        ),
      ),
    ) ;
  }
}
