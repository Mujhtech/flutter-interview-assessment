import 'package:flutter/material.dart';
import 'package:flutter_interview_1/api.dart';
import 'package:flutter_interview_1/pages/SignIn.dart';

class HomeScreen extends StatefulWidget {
  final String name;
  final String id;
  final String token;
  final String email;

  const HomeScreen(this.name, this.email, this.id, this.token);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isloading = false;
  Api api = Api();

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
            title: Text('Welcome back'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(15, height / 10, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipOval(
                      child: Material(
                        color: Color(0xFFFFEB3C), // button color
                        child: InkWell(
                          splashColor: Colors.transparent, // inkwell color
                          child: SizedBox(
                              width: 100,
                              height: 100,
                              child: Center(
                                  child: Text(
                                widget.name.toUpperCase().substring(0, 1),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 36),
                              ))),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.name.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 36),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.email,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: height / 2.5,
                  ),
                  MaterialButton(
                    elevation: 0,
                    hoverElevation: 0,
                    focusElevation: 0,
                    highlightElevation: 0,
                    onPressed: () async {
                      setState(() {
                        isloading = true;
                      });
                      try {
                        final response = await api.deleteAccount(widget.token);
                        print(response);
                        setState(() {
                          isloading = false;
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return SignInScreen();
                        }));
                      } catch (err) {
                        print(err.toString());
                        setState(() {
                          isloading = false;
                        });
                        final snackBar = SnackBar(
                            content: Text('Invalid Username/Password'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width - 50,
                      height: 60,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Log out!',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          isloading
                              ? CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.black),
                                )
                              : Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                )
                        ],
                      ),
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
