import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastTest extends StatelessWidget {
  const ToastTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Center(
          child: Scaffold(
            body: TextButton(
              onPressed: () {
                showToast();
                print("토스트");
              },
              child: Text("토스트 버튼"),
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber
              )
              ),
            ),
          ),
        );
  }
}

void showToast() {
  Fluttertoast.showToast(msg: "토스트ㅡ틑",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT
  );
}