import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //builder 패턴 이용
    /*return MaterialApp(Scaffold(
        body: Builder(
        builder: (BuildContext ctx) {
      return Center();};*/

    //커스텀 위젯 사용
    return Scaffold(body: CustomWidget());
  }
}

class CustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "show me",
          style: TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(backgroundColor: Colors.red),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('hellow'),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'btn',
              onPressed: () {},
            ),
          ));
        },
      ),
    );
  }
}