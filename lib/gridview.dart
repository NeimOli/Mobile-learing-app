import 'package:flutter/material.dart';
import 'package:season_sir_mobileapp/routes.dart';

enum griddata{
  Login,
  ConversationApp,
  Map,
  Esewa,
  WebView,
  SignUp
}

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  List<griddata> gridlistitem = griddata.values;
  navigatorfunction(String name){
    if(name.contains("login")){
      Navigator.of(context).pushNamed(AppRoute.login);
    }else if(name.contains("esewa")){
      Navigator.of(context).pushNamed(AppRoute.esewa);
    }else if(name.contains("webview")){
      Navigator.of(context).pushNamed(AppRoute.webview);
    }else if(name.contains("conversation")){
      Navigator.of(context).pushNamed(AppRoute.conversation);
    }else if(name.contains("map")){
      Navigator.of(context).pushNamed(AppRoute.maps);
    }else if(name.contains("signup")){
      Navigator.of(context).pushNamed(AppRoute.signup);
    }
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width:size.width,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                height: size.height/1.4,
                width: size.width/1.5,
                child:GridView.builder(
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                  itemCount: 6,
                  padding: EdgeInsets.zero,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        navigatorfunction(gridlistitem[index].name);
                      },
                      child: Container(
                        color: Colors.black12,
                        margin: EdgeInsets.all(5),
                      child: Text (gridlistitem[index].name, style:TextStyle(
                          color:Colors.black, fontSize:16
                      ),),),
                    );
                  },
                ),
              )
            ]
        ),
      ),
    );
  }
}