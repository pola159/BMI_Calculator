import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dataInput.dart';

class genderPage extends StatefulWidget {
  const genderPage({Key? key}) : super(key: key);

  @override
  State<genderPage> createState() => _genderPageState();
}

class _genderPageState extends State<genderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "SELECT YOUR GENDER",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            genderButton(
                "images/Man thinking-amico.png", "male", calculatBmI(true) , context),
            genderButton(
                "images/Woman thinking-amico.png", "female", calculatBmI(false) , context),

          ],
        ),
      ),
    );
  }
}

Widget genderButton(String imagePath, String gender, Widget f , BuildContext c) {
  return InkWell(
    onTap: () {
      Navigator.of(c).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return f;
      }));

    },
    child: Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Color.fromRGBO(248, 249, 250, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            imagePath,
            width: 200,
            height: 200,
          ),
          Text(
            gender,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
