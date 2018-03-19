import 'package:flutter/material.dart';


class MyButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: () => printInfo('onTap'),
      onDoubleTap: () => printInfo('onDoubleTap'),
      onLongPress: () => print('onLongPress'),
      onTapDown: (tapDownDetails) =>
          printInfo('onTapDown', tapDownDetails.globalPosition.toString()),
      onTapUp: (tapUpDetails) =>
          printInfo('onTapUp', tapUpDetails.globalPosition.toString()),
      onTapCancel: () => printInfo('onTapCancel'),
      onPanStart: (dragStartDetails) =>
          printInfo('onPanStart', dragStartDetails.globalPosition.toString(),
              dragStartDetails.sourceTimeStamp.toString()),
      onPanDown: (dragDownDetails) =>
          printInfo('onPanDown', dragDownDetails.globalPosition.toString()),
      onPanUpdate: (dragUpdateDetails) =>
          printInfo('onPanUpdate', dragUpdateDetails
              .globalPosition.toString(),
              dragUpdateDetails.sourceTimeStamp.toString(),
              dragUpdateDetails.delta.toString(),
              dragUpdateDetails.primaryDelta.toString()),
      onPanCancel: () => printInfo('onPanCancel'),
      onPanEnd: (dragEndDetails) =>
          printInfo('onPanEnd', dragEndDetails.velocity.toString(),
              dragEndDetails.primaryVelocity.toString()),

      child: new Container(
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(4.0),
          color: Colors.lightBlue[500],
        ),
        child: new Center(
          child: new Text('my button'),
        ),
      ),
    );
  }

  printInfo(String action, [info1 = '', info2 = '', info3 = '', info4 = '']) {
    print('MyButton was ' + action + ' ' + info1 + ' ' + info2 + ' ' + info3 +
        ' ' + info4);
  }
}