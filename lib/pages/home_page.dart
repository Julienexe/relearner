import 'package:flutter/material.dart';
import 'package:relearner/modules/general_modules.dart';
import 'package:relearner/pages/login_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCurriculum = 'Curriculum';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi Julian,',
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
                      'https://via.placeholder.com/150',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Continue Learning',style: TextStyle(color: themeColor),),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_forward,color: themeColor,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
              height: 150,
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
            DropdownButton<String>(
              value: selectedCurriculum,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCurriculum = newValue!;
                });
              },
              items: <String>['Curriculum', 'Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageCard(String title) {
    return Card(
      elevation: 2,
      child: Container(
        width: 113,
        height: 150,
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

