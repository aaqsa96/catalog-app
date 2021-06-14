import 'package:flutter/material.dart';
import 'package:flutter_catalog_app/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name, password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ////// for form
  String text = ' ';
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.canvasColor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Welcome $text',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Name",
                        hintText: "Enter your name",
                      ),
                      onChanged: (value) {
                        setState(() {
                          text = value;
                        });
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "name field cannot be empty";
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        name = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your password",
                      ),
                      obscureText: true,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Password field cannot be empty";
                        } else if (value.length < 6) {
                          return "Password cannot be less then 7 digits";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Material(
                      ///to show ripple effect on its top it require material widget
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              changeButton = true;
                            });
                            await Future.delayed(Duration(seconds: 2));
                            await Navigator.pushNamed(
                                context, MyRoutes.homeRoute);
                            setState(() {
                              ///it will move it on its back state
                              changeButton = false;
                            });
                          } //if end bracket
                        },
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    /////////////////////////
                    // RaisedButton(
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //   },
                    //   child: Text(
                    //     "submit",
                    //     style: TextStyle(
                    //       color: Colors.white,
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    //   color: Colors.deepPurple,
                    // ),
                    //////////// ///////////////////////
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
