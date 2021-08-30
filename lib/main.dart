import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {





  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer timeCounter;
  var time=0;
 void Restart(int i){
   if(timeCounter!=null){
     timeCounter.cancel();
   }
   setState(() {
     time=i;
   });
    timeCounter=Timer.periodic(Duration(seconds: 1), (timer) {setState(() {
      time<1?timer.cancel():time=time-1;
    }); });
  }
  void Continue(){
    Restart(time);
  }
  void Pause(){
    setState(() {
      timeCounter.cancel();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Count Down'),
      ),
      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Text('$time',style: TextStyle(fontSize: 60),),
           SizedBox(height: 100,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               RaisedButton(
                   padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),


                 child:Row(

               children: [
                 Icon(Icons.replay,),
                 Text('Restart',style: TextStyle(fontSize: 20),),
               ],
           )
              , onPressed: (){
                   Restart(15);
               }
               ),
               RaisedButton(
                   padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                   child: Row(

                     children: [
                       Icon(Icons.stop),
                       Text('pause',style: TextStyle(fontSize: 20)),
                     ],
                   ) ,
                   onPressed: (){
                     Pause();
                   }
               ),
               RaisedButton(
                 padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                   child:Row(
                     

                     children: [
                       Icon(Icons.play_arrow),
                       
                       Text('continue',style: TextStyle(fontSize: 20)),
                     ],
                   ) ,
                   onPressed: (){
                     Continue();
                   }
               ),

             ],
           )
         ],
       ),


      ),

    );
  }
}
