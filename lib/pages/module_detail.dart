import 'package:flutter/material.dart';
import 'package:relearner/main.dart';
import 'package:relearner/models/courses_model.dart';
import 'package:relearner/modules/general_modules.dart';

class LearningPage extends StatelessWidget {
  const LearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CourseModel course = appState.course!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'reLearner',
          style: bannerTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey,
              height: 200,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                course.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                course.description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 100,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 8),
                        const Text('Video title', textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 100,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 8),
                        const Text('Video title', textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 100,
                          width: double.infinity,
                        ),
                        const SizedBox(height: 8),
                        const Text('Video title', textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
