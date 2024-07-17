import 'package:flutter/material.dart';
import 'package:relearner/main.dart';
import 'package:relearner/models/user_model.dart';
import 'package:relearner/modules/accordions.dart';
import 'package:relearner/modules/general_modules.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    UserModel user = appState.userModel!;
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi ${user.firstname},',
              style: bannerTextStyle,
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome to the future of learning: knowledge reimagined, delivered seamlessly',
              style: defaultTextStyle
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        );
                      },

                      'https://via.placeholder.com/150',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    
                    const SizedBox(width: 16),
                    Expanded(
                      child: appState.userModel!.enrolled? enrolledColumn() : notEnrolledColumn(),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Packages',
              style: defaultTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 155,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,

                children: [
                  _buildPackageCard('Single Module'),
                  _buildPackageCard('Module Combination'),
                  _buildPackageCard('Full Sequential'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Accordions(),
          ],
        ),
      ),
    );
  }

  Column enrolledColumn() {
    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Single Module: The comprehensive guide',
                          style: bannerTextStyle.copyWith(fontSize: 19),
                        ),
                        const SizedBox(height: 8),
                        const Text('Course Progress',style: defaultTextStyle,),
                        const SizedBox(height: 4),
                        const LinearProgressIndicator(value: 0.0),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Continue Learning',style: TextStyle(color: themeColor),),
                                SizedBox(width: 8),
                                Icon(Icons.arrow_forward,color: themeColor,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
  }

  Widget _buildPackageCard(String title) {
    return Card(
      elevation: 2,
      child: Container(
        width: 113,
        height: 155,
        padding: const EdgeInsets.only(
          top: 8,
          left: 6,
          right: 6,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 15 ),
            ),
          ],
        ),
      ),
    );
  }
  }

