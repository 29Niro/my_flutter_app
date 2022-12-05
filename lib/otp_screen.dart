import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: const TextStyle(color: Colors.black),
        )),
      );
    } catch (e) {
      return Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color.fromARGB(255, 57, 138, 229),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 16,
            ),
          ),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Enter 6 digits verification code sent to your number',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(maxWidth: 500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        otpNumberWidget(0),
                        otpNumberWidget(1),
                        otpNumberWidget(2),
                        otpNumberWidget(3),
                        otpNumberWidget(4),
                        otpNumberWidget(5),
                      ],
                    ),
                  )
                ],
              )),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                constraints: const BoxConstraints(maxWidth: 500),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 57, 138, 229),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Confirm',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Color.fromARGB(255, 115, 174, 245),
                          ),
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              NumericKeyboard(
                onKeyboardTap: _onKeyboardTap,
                textColor: const Color.fromARGB(255, 57, 138, 229),
                rightIcon: const Icon(
                  Icons.backspace,
                  color: Color.fromARGB(255, 57, 138, 229),
                ),
                rightButtonFn: () {
                  setState(() {
                    text = text.substring(0, text.length - 1);
                  });
                },
              )
            ],
          ))
        ],
      )),
    );
  }
}
