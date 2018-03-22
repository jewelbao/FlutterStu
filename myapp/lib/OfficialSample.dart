import 'package:flutter/material.dart';
import 'package:myapp/widget/Counter.dart';
import 'package:myapp/widget/MyButton.dart';
import 'package:myapp/widget/DeviceInfoList.dart';

// 基础控件布局验证
class MyAppBar extends StatelessWidget {

  MyAppBar({this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    // Container会创建一个矩形的容器。
    // 此容器可以用BoxDecoration装饰（背景、边框、阴影）。
    // container可以设置内外边距和大小，
    // 也可以使用matrix在三维空间中转换。
    return new Container(
      height: 56.0,
      // px单位
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.green[500]),
      child: new Row( // Row会创建一个水平方向的伸缩容器，类似Web的FlexBox
        children: <Widget>[
          new IconButton(
              icon: new Icon(Icons.menu), tooltip: 'menu', onPressed: null),
          new Expanded(child: title),
          new IconButton(
              icon: new Icon(Icons.search), tooltip: 'search', onPressed: null),
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new MyAppBar(title: new Text('BaseWidgetSampleTitle',
            style: Theme
                .of(context)
                .primaryTextTheme
                .title,
            textAlign: TextAlign.center,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.0,
            maxLines: 1,
          )),
          new Expanded(
              child: new Center(child: new Text('BaseWidgetSampleContent'),)),
        ],
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {

  @override
  Widget build(context) =>
      new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.blue,
          leading: new IconButton(
              icon: new Icon(Icons.menu),
              onPressed: null),
          title: new Text('Example title'),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.search), onPressed: null)
          ],
        ),
        body: new Center(
          child: new Column(
            children: <Widget>[
              new GestureDetectorButton(),
              new Counter(),
            ],
          ),
        ),
//        drawer: new AnimatedContainer(
//            duration: Duration.zero,
//            width: 200.0,
//            decoration: new BoxDecoration(
//              color: Colors.white,
//            ),
//            child: new Column(
//              children: <Widget>[
//                new Text('hahah',),
//                new Text('hahah'),
//                new Text('hahah'),
//                new Text('hahah'),
//                new Text('hahah'),
//              ],
//            )),
        drawer: new DeviceInfoList(),
        floatingActionButton: new FloatingActionButton(
            child: new Icon(Icons.message),
            onPressed: null),
        bottomNavigationBar: new Container(
          height: 56.0,
          decoration: new BoxDecoration(color: Colors.blue),
          child: new Row(
            children: <Widget>[
              new Expanded(child: new IconButton(
                  icon: new Icon(Icons.print), onPressed: null)),
              new Expanded(child: new IconButton(
                  icon: new Icon(Icons.list), onPressed: null)),
              new Expanded(child: new IconButton(
                  icon: new Icon(Icons.add), onPressed: null))
            ],
          ),
        ),
      );
}