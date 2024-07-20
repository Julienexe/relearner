import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:relearner/main.dart';
import 'package:relearner/modules/general_modules.dart';

class PackagePage extends StatelessWidget {
  const PackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('reLearner', style: bannerTextStyle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 700,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Single Module', style: bannerTextStyle),
                    const Spacer(),
                    const Text('UGX', style: defaultTextStyle),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '100000',
                      style: bannerTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'For chronological consumption of modules in a predetermined order',
                  style: defaultTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(height: 16),
                Text('Select a module to learn', style: bannerTextStyle),
                const SizedBox(height: 8),
                MultiSelectContainer(
                  showInListView: false,
                    itemsDecoration: MultiSelectDecorations(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: themeColor.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    textStyles:  MultiSelectTextStyles(
                        textStyle: bannerTextStyle.copyWith(fontSize: 17)),
                    items: [
                      ...getCourses(),
                      
                    ],
                    onChange: (allSelectedItems, selectedItem) {}),
                const SizedBox(height: 16),
                Text('Start Learning Today', style: bannerTextStyle),
                const SizedBox(height: 8),
                const FeatureListItem(text: 'Self-Paced Learning Option'),
                const FeatureListItem(text: 'Practice Quizzes'),
                const FeatureListItem(text: 'Course videos and readings'),
                const FeatureListItem(text: 'Downloadable resources'),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          enrollMentPopup(context);
        },
        child: const Icon(Icons.add),
      )
    );
  }
}

class FeatureListItem extends StatelessWidget {
  final String text;

  const FeatureListItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check, color: themeColor),
          const SizedBox(width: 8),
          Expanded(
              child:
                  Text(text, style: defaultTextStyle.copyWith(fontSize: 20))),
        ],
      ),
    );
  }
}

List<MultiSelectCard> getCourses(){
  List<MultiSelectCard> courses = [];
  
  if (appState.courses != null) {
    for (var course in appState.courses!) {
      courses.add(MultiSelectCard(
        value: course.name,
        label: course.name,
      ));
    }
    
  }
  return courses;
}

enrollMentPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Enroll'),
        content: const Text('Are you sure you want to enroll in this course?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      );
    },
  );
}