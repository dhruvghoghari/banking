import 'package:banking/ConfirmPin.dart';
import 'package:banking/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  TextEditingController _pin = TextEditingController();
  TextEditingController _confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                  image: AssetImage("img/LockLogo.jpg"),
                    fit: BoxFit.cover
                )
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                      Image.asset("img/SBI.png",height: 80.0,width: 80.0,),
                      SizedBox(height: 30.0,),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text("WELCOME TO SBIBank",style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),)
                            ],
                          ),
                          Row(
                            children: [
                              Text("Login Your Account",style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blue
                              ),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                         Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                             decoration: BoxDecoration(
                               boxShadow: [
                                 BoxShadow(
                                   color: Colors.grey.withOpacity(0.5),
                                   offset: Offset(0, 2),
                                   blurRadius: 5,
                                   spreadRadius: 0,
                                 ),
                               ],
                            color: Color(0xffFFFFFF),
                               borderRadius: BorderRadius.circular(8.0),
                           ),
                        child: TextField(
                          controller: _pin,
                       keyboardType: TextInputType.number,
                       style: TextStyle(
                       fontSize: 16.0,
                        color: Colors.black,
                      ),
                     decoration: InputDecoration(
                     labelText: "Pin",
                     labelStyle: TextStyle(
                         color:Colors.grey,
                         fontWeight: FontWeight.bold,
                       fontSize: 20.0,
                     ),
                    icon: Icon(Icons.lock,color: Color(0xff0d47a1),),
                          ),
                        ),
                       ),
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              offset: Offset(0, 2),
                              blurRadius: 5,
                              spreadRadius: 0,
                            ),
                          ],
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: TextField(
                          controller: _confirm,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: "Confirm",
                            labelStyle: TextStyle(
                              color:Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                            icon: Icon(Icons.visibility,color: Color(0xff0d47a1),),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      Container(
                        height: 50.0,
                        width: 150.0,
                        child: ElevatedButton(
                          onPressed: () async{
                            var pin = _pin.text.toString();
                            var confirm = _confirm.text.toString();

                            if(pin.length<=0)
                              {
                                var snackbar = SnackBar(
                                  content: Text("Enter Valid Pin  ",style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 4),
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                            else if(confirm.length<=0)
                                {
                                  var snackbar = SnackBar(
                                    content: Text("Enter Confirm Pin "),
                                    backgroundColor: Colors.redAccent,
                                    duration: Duration(seconds: 4),
                                    elevation: 5.0,
                                    action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                }
                            else
                              {
                                if(pin==confirm)
                                  {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString("PinLogin", "Yes");
                                    prefs.setString("pin", pin);

                                    Navigator.pop(context);
                                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => HomeScreen()),
                                    );
                                  }
                                else
                                  {
                                    var snackbar = SnackBar(
                                      content: Text(" Pin & Confirm Incorrect  "),
                                      backgroundColor: Colors.redAccent,
                                      duration: Duration(seconds: 4),
                                      elevation: 5.0,
                                      action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                  }
                              };
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(Color(0xff0d47a1)),
                          ),
                          child: Text("Proceed",style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
