import 'package:flutter/material.dart';
import 'package:relearner/main.dart';
import 'package:relearner/modules/general_modules.dart';
// import 'package:trial_1/appstate/app_state.dart';
// import 'package:trial_1/constants/routes.dart';
// import 'package:trial_1/models/user_model.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();

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

    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 710,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30,),
              const Text(
                'reLearner',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 64, 120, 166),
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'Learn Anew',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.bold,
                ),
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
              const SizedBox(height: 4),
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
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password ?',
                  style: defaultTextStyle,
                ),
              ),
              const SizedBox(height: 5),
              FilledButton(
                onPressed: () async{
                final email = _email.text;
                final password = _password.text;
                appState.loginSequence(email, password, context);
                
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 64, 120, 166)),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  minimumSize:
                      WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 3),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Color.fromARGB(255, 31, 87, 165), width: 1.0),
                  ),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed("/register");
                  },
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                        const Color.fromARGB(255, 31, 87, 165)),
                    shape: WidgetStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    )),
                    minimumSize:
                        WidgetStateProperty.all(const Size(double.infinity, 48)),
                  ),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your register logic here
                },
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 92, 91, 91)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 92, 91, 91), width: 1.0),
                  )),
                  minimumSize:
                      WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //google icon
                    Image.asset('assets/img/google-color.png', height: 20, width: 20),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      'SIGN IN WITH GOOGLE',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Add your register logic here
                },
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 92, 91, 91)),
                  shape: WidgetStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 92, 91, 91), width: 1.0),
                  )),
                  minimumSize:
                      WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //google icon
                    Image.asset('assets/img/apple.png', height: 20, width: 20),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text(
                      'SIGN IN WITH APPLE',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
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
      ),
    ),
    );
  }
}
