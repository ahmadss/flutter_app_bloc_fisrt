import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_fisrt/bloc/counter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }

}

class HomePage extends StatefulWidget{

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterBlock _counterBlock = CounterBlock();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _counterBlock.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Bloc")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              initialData: _counterBlock.counter,
              stream: _counterBlock.output,
              builder: (context, snapshot) =>
            Text("Angka saat ini ${snapshot.data}", style: TextStyle(fontSize: 25),),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.add), onPressed: (){
                  _counterBlock.inputan.add("Add");
                }),
                IconButton(icon: Icon(Icons.remove), onPressed: (){
                  _counterBlock.inputan.add("minus");
                })

              ],
            )
          ],
        ),
      ),
    );
  }
}


