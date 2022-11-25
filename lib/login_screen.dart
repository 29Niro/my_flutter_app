import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color(0xFF73AEF5),
          Color(0xFF61A4F1),
          Color(0xFF478DE0),
          Color(0xFF398AE5),
        ],
        stops: [0.1, 0.4, 0.7, 0.9],
      )),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 70.0),
          child: Text(
            'Sign In',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Robika',
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 129, 179, 240),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Email',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Robika',
                        fontSize: 16)),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 129, 179, 240),
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14.0),
                    prefixIcon: Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Robika',
                        fontSize: 16)),
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
