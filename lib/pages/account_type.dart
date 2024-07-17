import 'package:flutter/material.dart';

class AccountTypeSelection extends StatefulWidget {
  const AccountTypeSelection({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AccountTypeSelectionState createState() => _AccountTypeSelectionState();
}

class _AccountTypeSelectionState extends State<AccountTypeSelection> {
  bool showDetailsGuardian = false;
  bool showDetailsTeenagers = false;

  void toggleDetails(String type) {
    setState(() {
      if (type == 'guardian') {
        showDetailsGuardian = !showDetailsGuardian;
        showDetailsTeenagers = false;
      } else {
        showDetailsTeenagers = !showDetailsTeenagers;
        showDetailsGuardian = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //final creds = ModalRoute.of(context)!.settings.arguments as List<String>;
    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        children: [
          const SizedBox(height: 50), // for padding at the top
          const Center(
            child: Text(
              'Select Account Type',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => toggleDetails('guardian'),
                child: Column(
                  children: [
                    Container(
                      width: 170,
                      height: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/guardian.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Guardian', style: TextStyle(fontSize: 18)),
                    if (showDetailsGuardian)
                      Column(
                        children: [
                          const Text('Guardian account details...'),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Select Guardian'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => toggleDetails('teenagers'),
                child: Column(
                  children: [
                    Container(
                      width: 170,
                      height: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage('assets/teenagers.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text('Teenagers and Beyond', style: TextStyle(fontSize: 18)),
                    if (showDetailsTeenagers)
                      Column(
                        children: [
                          const Text('Teenagers and beyond account details...'),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Select Teenagers'),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
