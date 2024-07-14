import 'package:flutter/material.dart';
import 'package:relearner/modules/general_modules.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const LearningDashboard();
  }
}

class LearningDashboard extends StatefulWidget {
  const LearningDashboard({super.key});

  @override
  _LearningDashboardState createState() => _LearningDashboardState();
}

class _LearningDashboardState extends State<LearningDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Current Package: Single module',
              style: bannerTextStyle,
            ),
            const SizedBox(height: 8),
            const LinearProgressIndicator(value: 0.0),
            const SizedBox(height: 4),
            Text(
              '0%',
              style: bannerTextStyle,
            ),
            const SizedBox(height: 16),
            Text(
              'Curated modules',
              style: bannerTextStyle,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                curriculumBox("Learning how to learn"),
                FilledButton(
                  
                    style: ButtonStyle(
                      side:
                          WidgetStateProperty.all<BorderSide>(const BorderSide(
                        
                    color: Color.fromARGB(255, 208, 207, 207),
                    width: 1,
                  
                      )),
                      backgroundColor:
                          WidgetStateProperty.all<Color>(Colors.white),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Start',style: defaultTextStyle,),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                text: '659 ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
                children: [
                  TextSpan(
                      text: 'learners are currently learning this module',
                      style: defaultTextStyle),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Testimonial from learner in current module',
              style: bannerTextStyle,
            ),
            const SizedBox(height: 8),
            Center(
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 200,
                    width: 400,
                    padding: const EdgeInsets.all(2),
                    child: const Center(
                      child: Text(
                        'Nothing here yet',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
