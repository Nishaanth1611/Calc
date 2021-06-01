import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'logic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey ,
      ),
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

Logic calc = Logic();

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  @override
  Widget build(BuildContext context) {
    //Calculator
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Calc'),
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Nishaanth K'),
              accountEmail: Text('nishtinaa1611@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('NK'),
              ),
            ),
            ListTile(
                title: Text('About Developer'),
                leading: Icon(Icons.inbox),
                onTap: () => launch('https://www.linkedin.com/in/nishaanth-k/')
            ),
            Divider(
              height: 1,
            ),
            ListTile(
                title: Text('Get Code'),
                leading: Icon(Icons.info_outlined),
                onTap: () => launch('https://github.com/Nishaanth1611')
            ),
            Divider(
              height: 1,
            ),
            ListTile(
                title: Text('Contact Info'),
                leading: Icon(Icons.contact_page_sharp),
                onTap: () => launch('https://www.instagram.com/mr.infatuator/')
            ),
            Divider(
              height: 1,
            ),
            ListTile(
                title: Text('More Info'),
                leading: Icon(Icons.contact_mail_outlined),
                onTap: () => launch('https://wa.me/918939324321')
            ),
            Divider(
              height: 1,
            )
          ],
        ),
      ),
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(calc.finalResult,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calculatorButton('AC', Colors.grey, Colors.black, (){setState(() {
                  calc.reset();
                });}),
                calculatorButton('+/-', Colors.grey, Colors.black, (){setState(() {
                  calc.negative();
                });}),
                calculatorButton('%', Colors.grey, Colors.black, (){setState(() {
                  calc.percentage();
                });}),
                calculatorButton('÷', Colors.grey, Colors.black, (){setState(() {
                  calc.div();
                });}),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calculatorButton('7', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("7");
                });}),
                calculatorButton('8', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("8");
                });}),
                calculatorButton('9', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("9");
                });}),
                calculatorButton('x', Colors.grey, Colors.black, (){setState(() {
                  calc.mul();
                });}),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calculatorButton('4', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("4");
                });}),
                calculatorButton('5', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("5");
                });}),
                calculatorButton('6', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("6");
                });}),
                calculatorButton('-', Colors.grey, Colors.black, (){setState(() {
                  calc.sub();
                });}),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                calculatorButton('1', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("1");
                });}),
                calculatorButton('2', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("2");
                });}),
                calculatorButton('3', Colors.grey, Colors.black, (){setState(() {
                  calc.setNumber("3");
                });}),
                calculatorButton('+', Colors.grey, Colors.black, (){setState(() {
                  calc.add();
                });}),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                RaisedButton(
                  onPressed:() {
                    calc.setNumber("0");
                  },
                  padding: EdgeInsets.fromLTRB(34, 20, 128, 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  child: Text('0',
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.black),
                  ),
                  color: Colors.grey,
                ),
                calculatorButton('.', Colors.grey, Colors.black, (){setState(() {
                  calc.decimal();
                });}),
                calculatorButton('=', Colors.grey, Colors.black, (){setState(() {
                  calc.execute();
                });}),
              ],
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }
}
Widget calculatorButton(
    String btnText, Color btnColor, Color btnTextColor, onpress) {
  return Container(
    child: RaisedButton(
      onPressed: onpress,
      child: Text(btnText, style: TextStyle(fontSize: 35, color: btnTextColor)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: btnColor,
      padding: EdgeInsets.all(20),
    ),
  );
}
