import 'package:flutter/material.dart';

class DrawerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Drawer"),
          centerTitle: true,
          /*leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print("leading icon clicked");
            },
          ),*/
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("search Button Clicked");
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/pug.png'),
                  backgroundColor: Colors.orange[200],
                ),
                accountName: Text("soon2"),
                accountEmail: Text("soon2@gmail.com"),
                onDetailsPressed: (){
                  print("arrow clicked");
                },
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40)
                  )
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                tileColor: Colors.grey[500],
                title: Text("home"),
                onTap: (){
                  print("home clicked");
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_a_photo_sharp),
                tileColor: Colors.grey[500],
                title: Text("gallery"),
                onTap: (){
                  print("gallery clicked");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
