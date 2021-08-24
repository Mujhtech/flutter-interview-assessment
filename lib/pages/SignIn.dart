import 'package:flutter/material.dart';
import 'package:flutter_interview_1/pages/SignUp.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: Color(0xFFFBFBFB),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Color(0xFF43A047),
        ),
        height: height / 2.25,
      ),
      Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, height / 10, 15, height / 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sign In',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Login to start posting free ads & premium ads',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: email,
                            validator: (email) {
                              RegExp regex = new RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                              if (email!.isEmpty)
                                return 'Email address Field is required';
                              else if (!regex.hasMatch(email))
                                return 'Email address is not valid';
                              else
                                return null;
                            },
                            onChanged: (v) {},
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 20,
                            ),
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              errorStyle: TextStyle(color: Colors.black38),
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colors.black45,
                              ),
                              fillColor: Color(0xFFFFFFFF),
                              filled: true,
                            ),
                            autocorrect: false,
                            autofocus: false,
                          ),
                          TextFormField(
                            controller: password,
                            validator: (pp) {
                              if (pp!.isEmpty)
                                return 'Password Field is required';
                              else
                                return null;
                            },
                            onChanged: (v) {},
                            keyboardType: TextInputType.visiblePassword,
                            style: TextStyle(
                              color: Colors.black38,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0))),
                              focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(0))),
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.black38,
                              ),
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
                              errorStyle: TextStyle(color: Colors.black38),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                                child: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black45,
                                ),
                              ),
                              fillColor: Color(0xFFFFFFFF),
                              filled: true,
                            ),
                            obscureText: !_passwordVisible,
                            autocorrect: false,
                            autofocus: false,
                          ),
                          MaterialButton(
                            elevation: 0,
                            hoverElevation: 0,
                            focusElevation: 0,
                            highlightElevation: 0,
                            onPressed: () async {
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                            },
                            color: Color(0xFFFFEB3C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 60,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Login!',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                  Icon(Icons.arrow_forward)
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.black45, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                    child: Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account yet?",
                          style: TextStyle(color: Colors.black45, fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUpScreen();
                            }));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.black, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
