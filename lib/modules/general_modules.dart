import 'package:flutter/material.dart';
// import 'package:trial_1/main.dart';
// import 'package:trial_1/models/enrollment_module.dart';
// import 'package:trial_1/models/user_model.dart';

//a place to build and design logic for reusable widgets and useful assets such as the app bar, bottom bar and much more

const TextStyle defaultTextStyle = TextStyle(
    fontFamily: 'Arial',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Color.fromARGB(255, 134, 133, 133));

const themeColor = Color.fromARGB(255, 23, 111, 174);

TextStyle bannerTextStyle = defaultTextStyle.copyWith(
  
  fontSize: 24,
  color: themeColor,
  fontWeight: FontWeight.bold,
);



Container curriculumBox(text) {
  //creates a box around text, could be modified to add an icon as well, to the right of the text
  return Container(
    height: 50,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        //border
        border: Border.all(
      color: const Color.fromARGB(255, 208, 207, 207),
      width: 1,
    )),
    child: Text(
      text,
      style:
          defaultTextStyle.copyWith(fontSize: 17, fontWeight: FontWeight.w900),
    ),
  );
}


//homepage reusable widgets
// class CurrentModule extends StatelessWidget {
//   final UserProfile user;
//   const CurrentModule({super.key, required this.user});

  

//   @override
//   Widget build(BuildContext context) {
//     final enrolled = user.enrolled ?? false;
//     return Container(
//       height: 200,
//       width: 400,
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: const Color.fromARGB(255, 208, 207, 207),
//           width: 1,
//         ),
//       ),
//       child: Center(child: enrolled ? UserEnrollment(user: user,) : notEnrolledColumn()),
//     );
//   }

  Column notEnrolledColumn() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              'You are not currently enrolled in a module',
              textAlign: TextAlign.center,
              style: bannerTextStyle,
            ),
          ),
          const Text(
            ' Select one of the packages to get started',
            style: defaultTextStyle,
          )
        ]);
  }


// class UserEnrollment extends StatelessWidget {
//   final UserProfile user;
//   const UserEnrollment({
//     super.key, required this.user,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<List<EnrollmentModule>>(
//       stream: EnrollmentModule.fromFirestoreList(
//             FirebaseFirestore.instance
//                 .collection('enrollment')
//                 .doc(user.uid)
//                 .collection('modules'),
//             descending: true),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Column(
//                 children: [
//                   const Text('Check your connection and try again'),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushReplacementNamed(context, '/');
//                     },
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }
//         appState.enrollmentModules = snapshot.data;
//         final String? package = appState.enrollmentModules?.first.package;
//         final double progress = calculatePackageProgress(appState.enrollmentModules);
//         appState.totalProgress = progress;
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             //check whether user is enrolled
        
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   '$package:The \n comprehensive guide',
//                   style: bannerTextStyle,
//                 ),
//                 const Spacer(),
//                 FadeInImage.assetNetwork(
//                   placeholder: 'assets/images/grey.jpeg',
//                   fit: BoxFit.fill,
//                   image: 'https://picsum.photos/250?image=9',
//                   height: 65,
//                   width: 65,
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Text(
//                   'Course Progress',
//                   style: defaultTextStyle.copyWith(
//                       fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//                 const Spacer(),
//                 Text(
//                   '${progress.ceil()}% ',
//                   style: defaultTextStyle.copyWith(fontSize: 18),
//                 ),
//               ],
//             ),
//             //progress bar
//             LinearProgressIndicator(
//               value: progress !=0 ? progress/100 : 0, //if progress is 0 then show 0% else show progress
//               color: themeColor,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   'Continue Learning',
//                   style: bannerTextStyle,
//                 ),
//                 const Icon(
//                   Icons.arrow_circle_right,
//                   color: themeColor,
//                 )
//               ],
//             ),
//           ],
//         );
//       }
//     );

    
//   }

//   double calculatePackageProgress(List<EnrollmentModule>? enrollmentModules){
//     List<int> progress = [];
//     for (var module in enrollmentModules!){
//       progress.add(module.progress);
//     }

//     //calculate average value of items in list
//     double average = progress.reduce((a, b) => a + b) / progress.length;
//     return average;
//   }
// }

// Column introSection(text) {
//   return Column(
//       textBaseline: TextBaseline.alphabetic,
//       crossAxisAlignment: CrossAxisAlignment.baseline,
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 20,
//             left: 30,
//           ),
//           child: Text(
//             'Hi $text,',
//             style: bannerTextStyle,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             top: 10,
//             left: 30,
//           ),
//           child: Text(
//             'Welcome to the future of learning: knowledge reimagined, delivered seamlessly',
//             style: defaultTextStyle.copyWith(
//               color: Colors.grey,
//               fontSize: 15,
//             ),
//           ),
//         )
//       ]);
// }
