import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:project_telegram/constants.dart';
import 'dart:async';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _LogInState();
}

class _LogInState extends State<LogInPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool pressAttention = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('COSMOS'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      'Welcome!',
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  textColor: kPrimaryColor,
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: pressAttention ? kPrimaryColor : kPressedColor,
                      child: Text('Login'),
                      onPressed: () async {
                        pressAttention = true;
                        String phonenumber = phoneController.text;
                        String password = passwordController.text;
                        String body = '{"phonenumber": "$phonenumber", "password": "$password"}';
                        Map<String, String> headers = {"Content-type": "application/json"};
                        String loginUrl = hostname + userLogInEndpoint;
                        Response resp = await post(loginUrl, headers: headers, body: body);

                        int statusCode = resp.statusCode;
                        String respBody = resp.body;
                        print(statusCode);
                        print(respBody);

                        print(statusCode);
                        if (statusCode < 300) {
                          showAlertDialog(context);
                        } else {
                          // TODO Add Error Alert
                        }
                      },
                    )),
                Container(
                    child: Row(
                  children: <Widget>[
                    const Text("Haven't got any account?",
                        style: TextStyle(fontSize: 13)),
                    TextButton(
                      style: TextButton.styleFrom(primary: kPrimaryColor),
                      child: const Text(
                        'Create a new one',
                        style: TextStyle(
                            fontSize: 15, decoration: TextDecoration.underline),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("COSMOS")),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    )),
                signUpContainer(firstNameController, "First Name"),
                signUpContainer(lastNameController, "Last Name"),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Phone No.',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 60,
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Sign Up'),
                      onPressed: () async {
                        print("Sign Up request");
                        String signupUrl = hostname + userSignUpEndpoint;
                        String phonenumber = phoneController.text;
                        String password = passwordController.text;
                        String username = firstNameController.text +
                            " " + lastNameController.text;
                        String body = '{"username": "$username", '
                            '"phonenumber": "$phonenumber",'
                            '"password": "$password"}';
                        Map<String, String> headers = {"Content-type": "application/json"};
                        Response resp = await post(signupUrl, headers: headers, body: body);
                        int statusCode = resp.statusCode;
                        print(statusCode);
                        if (statusCode < 300) {
                          showAlertDialog(context);
                        } else {
                          // TODO Add Error Alert
                        }
                      },
                    ))
              ],
            )));
  }

  Container signUpContainer(TextEditingController controller, String label) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: const Text("Let's Log in",
    style: TextStyle(
      color: kPressedColor
    )),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LogInPage()),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: kSecondaryColor,
    title: const Text("Sign Up Successfully",
    style: TextStyle(color: kPressedColor)),
    // content: const Text("You have created a new COSMOS account!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}