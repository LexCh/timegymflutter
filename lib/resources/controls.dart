import 'package:flutter/material.dart';

class TimerControls extends StatefulWidget {
  TimerControls({this.startCallback, this.pauseCallback, this.stopCallback});


  final Function startCallback;
  final Function stopCallback;
  final Function pauseCallback;
  @override
  _TimerControlsState createState() => _TimerControlsState();
}

enum TimerState {STOPPED, STARTED, PAUSED}

class _TimerControlsState extends State<TimerControls> {
    TimerState _state = TimerState.STOPPED;
  @override
  Widget build(BuildContext context) {
      switch(_state){
        case TimerState.STOPPED://CASE 1
          return _buildStartButton();
        case TimerState.STARTED://CASE 2
        return Column(
          children: <Widget>[
            _buildPauseButton(),
            SizedBox(height: 30.0,),
            _buildStopButton(scale: 0.5)//separador
          ],
        );
        case TimerState.PAUSED://CASE 3
        return Column(
          children: <Widget>[
            _buildStartButton(),
            SizedBox(height: 30.0,),
            _buildStopButton(scale: 0.5)//separador
          ],
        );
        default:
        return Container();
    }
  }
  
  Widget _buildStartButton({double scale = 1.0} ){
  return Container(
          height: 150.0 * scale,
          width: 150.0 * scale,
        decoration: BoxDecoration(
          color: Colors.green,
          boxShadow: [
            BoxShadow(
              color:  Colors.black26,
              blurRadius: 2.0,
              offset: Offset(0.0, 4.0),
            )
          ],
          shape: BoxShape.circle,
        ),
        child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  setState((){
                  _state = TimerState.STARTED;
              },);
              if(widget.startCallback !=  null) {
                widget.startCallback();
              }
            },
      borderRadius: BorderRadius.circular(100.0),
      child: Container(
        padding: EdgeInsets.only(
          left: 40.0 * scale,
          right: 20.0 * scale,
          top: 20.0 * scale,
          bottom: 20.0 * scale,
        ),//child: Icon(Icons.play_arrow, size: 80.0, ),
        child: Image.asset("assets/play.png"),
        ),
      ),
    ),
  );
}

Widget _buildStopButton({double scale = 1.0} ){
    return Container(
            height: 75.0,
            width: 75.0,
          decoration: BoxDecoration(
            color: Colors.red,
            boxShadow: [
              BoxShadow(
                color:  Colors.black26,
                blurRadius: 2.0,
                offset: Offset(0.0, 4.0),
              )
            ],
            shape: BoxShape.circle,
          ),
          child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    setState((){
                    _state = TimerState.STOPPED;
                },);
                if(widget.stopCallback !=  null)
                widget.stopCallback();
              },
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          padding: EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 20.0,
            bottom: 20.0,
          ),//child: Icon(Icons.play_arrow, size: 80.0, ),
          child: Image.asset("assets/stop.png"),
          ),
        ),
      ),
    );
  }

  Widget _buildPauseButton({double scale = 1.0} ){
    return Container(
            height: 150.0,
            width: 150.0,
          decoration: BoxDecoration(
            color: Colors.yellow,
            boxShadow: [
              BoxShadow(
                color:  Colors.black26,
                blurRadius: 2.0,
                offset: Offset(0.0, 4.0),
              )
            ],
            shape: BoxShape.circle,
          ),
          child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: (){
                    setState((){
                    _state = TimerState.PAUSED;
                },);
                if(widget.pauseCallback !=  null)
                widget.pauseCallback();
              },
        borderRadius: BorderRadius.circular(100.0),
        child: Container(
          padding: EdgeInsets.only(
            left: 40.0 * scale,
            right: 40.0 * scale,
            top: 40.0 * scale,
            bottom: 40.0 * scale,
          ),//child: Icon(Icons.play_arrow, size: 80.0, ),
          child: Image.asset("assets/pause.png"),
          ),
        ),
      ),
    );
  }
}