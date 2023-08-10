import 'package:banking/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ConfirmPin extends StatefulWidget {
  const ConfirmPin({Key? key}) : super(key: key);

  @override
  State<ConfirmPin> createState() => _ConfirmPinState();
}

class _ConfirmPinState extends State<ConfirmPin> {

  TextEditingController _pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("img/LockLogo.jpg"),
                  fit: BoxFit.cover
              )
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,),
                      onPressed: () {
                        Navigator.pop(context);
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
                    SizedBox(height: 80.0),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2.0,
                            blurRadius: 5.0,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: _pin,
                        keyboardType: TextInputType.number,
                        obscureText: true,
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
                    SizedBox(height: 30.0),
                    Container(
                      height: 50.0,
                      width: 150.0,
                      child: ElevatedButton(
                        onPressed: () async{
                          var pin = _pin.text.toString();

                          if(pin.length<=0)
                          {
                            var snackbar = SnackBar(
                              content: Text("Enter Valid Pin "),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          }
                          else
                            {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              if(pin==prefs.getString("pin").toString())
                              {

                                prefs.setString("PinLogin", "Yes");
                                Navigator.of(context).pop();
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => HomeScreen()),
                                );
                              }
                              else
                              {
                                var snackbar = SnackBar(
                                  content: Text(" Pin Not Match"),
                                  backgroundColor: Colors.redAccent,
                                  duration: Duration(seconds: 4),
                                  elevation: 5.0,
                                  action: SnackBarAction(textColor: Colors.white,label: "Close",onPressed: (){},),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackbar);
                              }
                            }
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
