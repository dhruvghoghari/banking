import 'package:banking/ConfirmPin.dart';
import 'package:banking/HomeScreen.dart';
import 'package:banking/LogIn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  pindata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   if(prefs.containsKey("PinLogin"))
     {
       Navigator.pop(context);
       Navigator.push(context,
         MaterialPageRoute(builder: (context) => ConfirmPin())
        );
     }

   else
     {

       Navigator.pop(context);
       Navigator.push(context,
       MaterialPageRoute(builder: (context) => LogIn())
       );
     }
  }


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      pindata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("img/background.jpg"),
                    fit: BoxFit.cover
                )
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(height: 230.0),
                Center(child: Image.asset("img/Sbilogo.png")),
                SizedBox(height: 250.0),
                Text("Banking | Investing | Insurance",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
