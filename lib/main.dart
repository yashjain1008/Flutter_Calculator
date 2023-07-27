import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULATE.yj',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'CALCULATE.yj'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textcontroller = TextEditingController();
  final _addcontroller = TextEditingController();
  final _subcontroller = TextEditingController();

  int _counter = 0;
  int _adct = 0;
  int _subct = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _adct++;
      if (_subct > 0) {
        _subct--;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _subct++;
      if (_adct > 0) {
        _adct--;
      }
    });
  }

  void _ResetCounter() {
    setState(() {
      _counter = 0;
      _subct = 0;
      _adct = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              '$_counter',
              //Theme.of(context).textTheme.headline4,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black.withOpacity(1.0),
                  height: 1,
                  fontSize: 150),
            ),

            const Text(
              'Result',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                  height: 1,
                  fontSize: 20),
            ),
            Container(
              height: 40,
              width: 200,
              child: TextField(
                controller: _textcontroller,
                decoration: InputDecoration(
                  hintText: 'Enter number',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textcontroller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  ),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            MaterialButton(
                onPressed: () {
                  setState(() {
                    _counter = int.parse(_textcontroller.text);
                    _textcontroller.clear();
                  });
                },
                color: Colors.black,
                child: Text('post', style: TextStyle(color: Colors.white))),
            //ADDITION-------------------------------------------------------------
            SizedBox(
              
              child: Row(
                children: <Widget>[
                  SizedBox( width: 210,
                    //flex:5,child:Container(color: Colors.black,alignment: Alignment.center,),
                    // Container(color: Colors.blue,alignment: Alignment.center,),

                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            '$_adct',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.blue.withOpacity(1.0),
                                height: 1,
                                fontSize: 65),
                            //style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'ADDITION',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.blue,
                                height: 1,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          child: Container(
                            height: 40,
                            width: 150,
                            child: TextField(
                              controller: _addcontroller,
                              decoration: InputDecoration(
                                hintText: 'Enter number',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _addcontroller.clear();
                                  },
                                  icon: Icon(Icons.clear),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _counter =
                                      _counter + int.parse(_addcontroller.text);
                                      _addcontroller.clear();
                                });
                              },
                              color: Colors.blue,
                              child: Text('post',
                                  style: TextStyle(color: Colors.white))),
                        ),
                        Container(
                            //color: Colors.blue,
                            //alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.all(10),
                            child: FloatingActionButton(
                              backgroundColor: Colors.blue,
                              onPressed: _incrementCounter,
                              child: Icon(Icons.add), //,color: Colors.black
                            )),
                      ],
                    ),
                  ),
                  //SUBTRACTION-------------------------------------------------------------
                  SizedBox(
                    //flex:5,child:Container(color: Colors.black,alignment: Alignment.center,),
                    // Container(color: Colors.blue,alignment: Alignment.center,),
                    
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          child: Text(
                            '$_subct',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.green.withOpacity(1.0),
                                height: 1,
                                fontSize: 65),
                            // style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'SUBTRACTION',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.green,
                                height: 1,
                                fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          child: Container(
                            height: 40,
                            width: 150,
                            child: TextField(
                              controller: _subcontroller,
                              decoration: InputDecoration(
                                hintText: 'Enter number',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _subcontroller.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  _counter =_counter - int.parse(_subcontroller.text);
                                _subcontroller.clear();});
                              },          
                              color: Colors.green,
                              child: Text('post',
                                  style: TextStyle(color: Colors.white))),
                        ),
                        Container(
                            //alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.all(10),
                            child: FloatingActionButton(
                              backgroundColor: Colors.green,
                              onPressed: _decrementCounter,
                              child: Icon(Icons.remove),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Container(---------------------------------------------------------------------------------
            //    alignment: new Alignment(-0.1,10.0),
            //   margin:EdgeInsets.all(10),
            //   child: FloatingActionButton(
            //     onPressed: _ResetCounter,
            //     child: Icon(Icons.restore),
            //   )
            // ),--------------------------------------------------------------------------------
            // SizedBox(
            //     flex: 4,
            //     child: Row(
            //       children: <Widget>[
            //     SizedBox(
            //       //flex:5,child:Container(color: Colors.black,alignment: Alignment.center,),
            //       // Container(color: Colors.blue,alignment: Alignment.center,),
            //       child: Column(
            //         children: <Widget>[
            //           Container(
            //             color: Colors.blue,
            //             height: 35,
            //             width: 35,
            //           ),
            //           SizedBox(
            //             child: Container(
            //               color: Colors.amber,
            //               width: 35,
            //             ),
            //           ),
            //           Container(
            //             color: Colors.blue,
            //             height: 35,
            //             width: 35,
            //           ),
            //         ],
            //       ),
            //     ),
            //     SizedBox(
            //       flex: 5,
            //       child: Container(
            //         color: Colors.yellow,
            //         alignment: Alignment.center,
            //       ),
            //     ),
            //   ],
            // )
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ResetCounter,
        tooltip: 'Reset',
        child: const Icon(Icons.restore),
      ),
      //  // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
