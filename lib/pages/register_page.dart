import 'package:dob_input_field/dob_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:trial_1/constants/routes.dart';
// import 'package:trial_1/models/user_model.dart';
import 'package:relearner/modules/general_modules.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _firstname;
  late final TextEditingController _lastname;
  late final TextEditingController _country;
  late DateTime _date_of_birth;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _country = TextEditingController();
    _date_of_birth = DateTime.now();

    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        height: 800,
        child: ListView(
          children: [
            const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  'reLearner',
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 64, 120, 166),
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  'Learn Anew',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: 10,
            ),

            TextField(
              controller: _firstname,
              decoration: const InputDecoration(
                labelText: 'First Name',
                labelStyle: defaultTextStyle,
                prefixIcon: Icon(Icons.book),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _lastname,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                labelStyle: defaultTextStyle,
                prefixIcon: Icon(Icons.book),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _email,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: defaultTextStyle,
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _country,
              decoration: const InputDecoration(
                labelText: 'Country',
                labelStyle: defaultTextStyle,
                prefixIcon: Icon(Icons.flag),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 5.0),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //date of birth field
            DOBInputField(
              onDateSubmitted: (value) {
                setState(
                  () {
                    _date_of_birth = value;
                  },
                );
              },
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              showLabel: true,
              dateFormatType: DateFormatType.YYYYMMDD,
              autovalidateMode: AutovalidateMode.always,
              fieldLabelText: "Date of Birth",
              inputDecoration: const InputDecoration(
                  labelStyle: defaultTextStyle,
                  prefixIcon: Icon(Icons.calendar_month),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  )),
            ),

            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _password,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: defaultTextStyle,
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: defaultTextStyle,
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  )),
              obscureText: true,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                //create user exception handling coming in later
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email, password: password);
                // //print(userCredential);
                // //sending a verification email
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
                //create user profile for on app data usage
                // final userProfile =
                // UserProfile(
                //   uid: FirebaseAuth.instance.currentUser!.uid,
                //   email: email,
                //   dateOfBirth: _date_of_birth,
                //   country: _country.text,
                //   firstName: _firstname.text,
                //   lastName: _lastname.text,
                //   accountType: 'Student',
                //   enrolled: false,
                // );

                //send user profile to next page
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed(
                  "account type",
                  //arguments: userProfile,
                );
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 64, 120, 166)),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Arial',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(
                      "/login",
                    );
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
            const Center(
                child: Text(
              'By signing up to reLearner, you agree to our terms and Privacy Policy',
              style: TextStyle(
                fontSize: 10,
              ),
            ))
          ],
        ),
      ),
    );
  }

  //function to show a pop up date picker
}
