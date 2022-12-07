import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;
import 'package:my_flutter_app/login_screen.dart';

late String stringResponse;
late Map mapResponse;
late Map dataResponse;
late List listResponse;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (response.statusCode == 200) {
      setState(() {
        // stringResponse = response.body;
        mapResponse = json.decode(response.body);
        // dataResponse = mapResponse['data'];
        listResponse = mapResponse['data'];
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo Profile"),
          leading: BackButton(onPressed: () {
            FirebaseAuth.instance.signOut().then((value) {
              // ignore: avoid_print
              print("Signed Out");
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const LoginScreen())));
            });
          }),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 100,
                      child: CircleAvatar(
                          radius: 98,
                          backgroundImage:
                              NetworkImage(listResponse[index]['avatar'])),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          listResponse[index]['first_name'].toString(),
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          listResponse[index]['last_name'].toString(),
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.email,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          listResponse[index]['email'].toString(),
                          style: const TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          // ignore: unnecessary_null_comparison
          itemCount: listResponse == null ? 0 : listResponse.length,
        ));
  }
}
