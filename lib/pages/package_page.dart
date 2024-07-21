import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:relearner/main.dart';
import 'package:relearner/models/package_model.dart';
import 'package:relearner/modules/general_modules.dart';


class PackagePage extends StatelessWidget {
  const PackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    var package = appState.package;
    return Scaffold(
        appBar: AppBar(
          title: Text('reLearner', style: bannerTextStyle),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            height: 650,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(package!.name, style: bannerTextStyle),
                      const Spacer(),
                      const Text('UGX', style: defaultTextStyle),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        package.price.toString(),
                        style: bannerTextStyle.copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  packageDescription(package),
                  const SizedBox(height: 1),
                  package.name == "Single Module"
                      ? Text('Select a module to learn', style: bannerTextStyle)
                      : package.name == "Module Combination"
                          ? Text('Select modules to learn',
                              style: bannerTextStyle)
                          : Text('Curated Modules', style: bannerTextStyle),
                  SizedBox(
                    height: 350,
                    child: MultiSelectCheckList(
                        maxSelectableCount: package.name == "Single Module"
                            ? 1
                            : package.name == "Module Combination"
                                ? 4
                                : appState.courses!.length,
                        itemsDecoration: 
                        MultiSelectDecorations(
                          disabledDecoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: themeColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        textStyles: MultiSelectTextStyles(
                            selectedTextStyle:
                                bannerTextStyle.copyWith(fontSize: 17),
                            textStyle: defaultTextStyle.copyWith(fontSize: 17)),
                        items: [
                          ...getCourses(package),
                        ],
                        onChange: (allSelectedItems, selectedItem) {}),
                  ),
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
        ));
  }

  Text packageDescription(package) {
    if (package!.name == 'Single Module') {
      return Text(
        'For chronological consumption of modules in a predetermined order',
        style: defaultTextStyle.copyWith(fontSize: 20),
      );
    } else if (package!.name == 'Module Combination') {
      return Text(
        'A self curated blend of four modules of your choice',
        style: defaultTextStyle.copyWith(fontSize: 20),
      );
    } else {
      return Text(
        'A comprehensive guide to all modules',
        style: defaultTextStyle.copyWith(fontSize: 20),
      );
    }
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

List<CheckListCard> getCourses(PackageModel package) {
  List<CheckListCard> courses = [];

  if (appState.courses != null) {
    for (var course in appState.courses!) {
      courses.add(CheckListCard(
        selected: package.name == "Full Sequential" ? true : false,
        enabled: package.name == "Full Sequential" ? false : true,
        value: course.name,
        title: Text(course.name),
        subtitle: Text('${course.description.characters.take(50)}...'),
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

maxSelectedPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Maximum Selected'),
        content: const Text(
            'You have reached the maximum number of courses you can select'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      );
    },
  );
}
