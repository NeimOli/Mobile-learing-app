import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:season_sir_mobileapp/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return loginpageState();
  }
}
class loginpageState extends State<loginpage>{
  TextEditingController _phonenumber = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readfromStorage();
  }

  readfromStorage() async {
    isloading = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var phonenumber = prefs.getString("phonenumber");
    var password = prefs.getString("password");
    if (phonenumber != null && password !=null) {
      setState(() {
        _phonenumber.text = phonenumber;
        _password.text = password;
      });

      Future.delayed(const Duration(
        seconds: 1)).whenComplete((){
          Navigator.of(context).pushNamed(AppRoute.conversation);
      });
    } else{
      setState(() {
        isloading = false;
      });
    }
  }

  storeinstorage() async {
    setState(() {
      isloading = true;
    });
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();
    prefs.setString("phonenumber", _phonenumber.text);
    prefs.setString("password", _password.text);
    setState(() {
      isloading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; // screen size
    return Scaffold(

      body: Container(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.person,size: 50,color: Colors.black,),
            Container(
              height: size.height/2.5,
              width: size.width/1.1,
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Signin",style: TextStyle(color: Colors.white,fontSize: 40),),
                  Text("Phone Number",
                    style: TextStyle(color: Colors.black,
                        fontSize: 14),),
                  Container(
                    width: size.width/1.2,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white
                        ,borderRadius:BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _phonenumber,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(border: InputBorder.none ),
                      style: const TextStyle(color: Colors.black,),
                      maxLines: 1,

                    ),
                  ),
                  Text("Password",
                    style: TextStyle(color: Colors.black,
                        fontSize: 14),),
                  Container(
                    width: size.width/1.2,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        color: Colors.white
                        ,borderRadius:BorderRadius.circular(10)
                    ),
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(border: InputBorder.none ),
                      style: const TextStyle(color: Colors.black,),
                      maxLines: 1,
                      onSubmitted: (txt){
                        if(_phonenumber.text != null && _password != null){
                          storeinstorage();
                        }
                      },

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isloading?const CircularProgressIndicator():
                      GestureDetector(
                        onTap: (){
                          if(_phonenumber.text != null && _password != null){
                            storeinstorage();
                            Navigator.of(context).pushNamed(AppRoute.conversation);
                          }
                      },

                        child: Container(
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.only(left:20,right: 20,top: 10,bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text("Login",style: TextStyle(color: Colors.white,
                              fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}