
import 'dart:async';

class CounterBlock{
  int _counter =0;
  int get counter => _counter;
  //countroller input
  StreamController _inputController = StreamController();
  StreamSink get inputan => _inputController.sink;

  //countroller output
  StreamController _outController = StreamController();
  StreamSink get _sinkoutput => _inputController.sink;

  //StreamOutput
  Stream get output => _outController.stream;

  CounterBlock(){
    _inputController.stream.listen((event) {
      if(event=="Add"){
        _counter++;
      } else {
        _counter--;
      }
      
      _sinkoutput.add(_counter);
    });
  }

  void dispose(){
    _inputController.close();
    _outController.close();
  }
}