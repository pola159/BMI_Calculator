import 'package:flutter/material.dart';

import 'finalPage.dart';
import 'gender.dart';

class calculatBmI extends StatefulWidget {
  final mORf;

  const calculatBmI(this.mORf, {Key? key}) : super(key: key);

  @override
  State<calculatBmI> createState() => _calculatBmIState();
}

class _calculatBmIState extends State<calculatBmI> {
  double _he = 170;
  double _wi = 60;
  double _age = 25;
  double _BMI = 20.761;
  void cal (){
    _BMI = (_wi / (_he*_he))*10000;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (con) {
                return genderPage();
              }));
            },
            icon: Icon(Icons.arrow_back)),
        backgroundColor: const Color.fromRGBO(186, 104, 200, 1),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(20),
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
                height: 100,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Height = ${_he.round()} CM",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Slider(
                      value: _he,
                      onChanged: (double v) => setState(() {
                        _he = v;
                        cal ();
                      }),
                      thumbColor: Color.fromRGBO(149, 83, 160, 1),
                      activeColor: Color.fromRGBO(186, 104, 200, 1),
                      inactiveColor: Color.fromRGBO(186, 104, 200, 0.4),
                      max: 210,
                      min: 100,
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
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
                    height: 100,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Weight = ${_wi.round()} KG",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  --_wi;
                                  cal ();
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromRGBO(186, 104, 200, 1),
                                  child: Icon(
                                    Icons.minimize,
                                    size: 40,
                                    color: Color.fromRGBO(248, 249, 250, 1),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ++_wi;
                                  cal ();
                                });
                              },
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Color.fromRGBO(186, 104, 200, 1),
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Color.fromRGBO(248, 249, 250, 1),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
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
                    height: 100,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Age = ${_age.round()} Year",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  --_age;
                                  cal ();

                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromRGBO(186, 104, 200, 1),
                                  child: Icon(
                                    Icons.minimize,
                                    size: 40,
                                    color: Color.fromRGBO(248, 249, 250, 1),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  ++_age;
                                  cal ();
                                });
                              },
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor:
                                    Color.fromRGBO(186, 104, 200, 1),
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: Color.fromRGBO(248, 249, 250, 1),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(top: 20 , left: 20 , right: 20 , bottom: 15),
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
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (widget.mORf == true)
                        ? Image.asset(
                            "images/Man thinking-amico.png",
                            height: _he + 70,
                          )
                        : Image.asset(
                            "images/Woman thinking-amico.png",
                            height: _he + 70,
                          )
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c){
                  double bmi = double.parse(_BMI.toStringAsFixed(3));
                  return bmiPage(bmi,widget.mORf);
                }));
              },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(186, 104, 200, 1),
                  ),
               child: Text("calculator" ,style: TextStyle(fontSize: 20),)),
            ],
          ),
        ),
      ),
    );
  }
}
