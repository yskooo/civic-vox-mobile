import 'package:app/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'login_page.dart';

class AddressSignUpPage extends StatefulWidget {
  @override
  _AddressSignUpPageState createState() => _AddressSignUpPageState();
}

class _AddressSignUpPageState extends State<AddressSignUpPage> {
  String? _selectedPurok;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AuthForm(
                labelText: 'Province',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Municipality',
                obscureText: false,
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Barangay',
                obscureText: false,
              ),
              SizedBox(height: 20),
              // Purok dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Purok',
                ),
                value: _selectedPurok,
                onChanged: (newValue) {
                  setState(() {
                    _selectedPurok = newValue;
                  });
                },
                items: [
                  'Pandel - Purok 1',
                  'Westland - Dapitilog Purok 2',
                  'Centro - Purok 3',
                  'Rillorta - Purok 4',
                  'Lagtao - Purok 5',
                  'Magat - Purok 6',
                  'Highway - Purok 7'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              AuthForm(
                labelText: 'Street Name, Building, House Number',
                obscureText: false,
              ),
              SizedBox(height: 20),
              // Submit button
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage()),
                    );
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Proceed',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // Sized box
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
