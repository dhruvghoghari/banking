import 'package:banking/ConfirmPin.dart';
import 'package:banking/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.grey,
              child: Column(
                children: [
                  SizedBox(height: 200.0),
                   Image.asset("img/SuccessLogIn.png"),
                  SizedBox(height: 30.0),
                  Container(
                    height: 50.0,
                    width: 150.0,
                    child: ElevatedButton(
                      onPressed: () async{

                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.clear();


                        Navigator.pop(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LogIn())
                        );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      ),
                      child: Text("Log Out",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Image.asset("img/SuccessLogIn.png"),