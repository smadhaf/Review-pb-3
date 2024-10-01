import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../widget/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  String? _gender;
  String? _displayEmail;
  String? _displayPassword;
  String? _displayGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Input Email
              CustomTextField(
                hintText: 'Email',
                controller: emailController,
              ),
              SizedBox(height: 16.0),
              CustomTextField(
                hintText: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 24.0),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text('Gender:'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<String>(
                          value: 'Male',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        Text('Male'),
                        Radio<String>(
                          value: 'Female',
                          groupValue: _gender,
                          onChanged: (String? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                        Text('Female'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _displayEmail = emailController.text;
                    _displayPassword = passwordController.text;
                    _displayGender = _gender;
                  });
                },
                child: Text('Sign In'),
              ),
              SizedBox(height: 24.0),
              if (_displayEmail != null && _displayPassword != null && _displayGender != null)
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hasil Input:'),
                      SizedBox(height: 8.0),
                      Text('Email: $_displayEmail'),
                      Text('Password: $_displayPassword'),
                      Text('Gender: $_displayGender'),
                    ],
                  ),
                ),

              SizedBox(height: 16.0),
              SignInButton(
                Buttons.google,
                text: "Sign in with Google",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
