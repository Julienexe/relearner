import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:relearner/main.dart';
import 'package:relearner/models/courses_model.dart';
import 'package:relearner/modules/general_modules.dart';

List<CourseModel> courses = [];

class Accordions extends StatelessWidget {
  const Accordions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Accordionz();
  }
}

class Accordionz extends StatefulWidget {
  const Accordionz({Key? key}) : super(key: key);

  @override
  _AccordionzState createState() => _AccordionzState();
}

class _AccordionzState extends State<Accordionz> {
  @override
  Widget build(BuildContext context) {
    return Accordion(
      headerBorderColor: secondaryColor,
      headerBorderWidth: 1,
      openAndCloseAnimation: true,
      children: [
        AccordionSection(
          contentBorderColor: secondaryColor,
          headerBorderRadius: 30,
          contentBorderRadius: 30,
          contentBackgroundColor: const Color.fromARGB(81, 255, 255, 255),
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          headerPadding: const EdgeInsets.all(10),
          headerBackgroundColor: const Color.fromARGB(124, 255, 255, 255),
          rightIcon: const Icon(Icons.class_),
          headerBorderColor: secondaryColor,
          header: const Text(
            'Modules',
            style: defaultTextStyle,
          ),
          content: FutureBuilder<List<CourseModel>>(
              future: appState.getCourses(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.done
                    ? snapshot.hasData
                        ? courses(snapshot.data)
                        : const Center(child: Text('Something Went Wrong'))
                    :
                    //progress indicator
                    const Center(child: CircularProgressIndicator());
              }),
        ),
      ],
    );
  }

  SizedBox courses(courses) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return curriculumBox(courses[index].name);
          }),
    );
  }
}
