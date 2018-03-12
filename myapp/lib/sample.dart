import 'package:flutter/material.dart';

import 'package:myapp/data/BaseData.dart';
import 'package:myapp/data/ListData.dart';
import 'package:english_words/english_words.dart';

class Home extends StatelessWidget {
  int i;

  ListDataFunc listDataFunc = new ListDataFunc();
  BaseDataFunc baseDataFunc = new BaseDataFunc();

  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();

    return new Material(
      child: new Column(
        children: <Widget>[
          new ToolbarOne(
            title: new Center(
                child: new Text('标题中',
                    style: Theme.of(context).primaryTextTheme.title)),
          ),
          new ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: <Widget>[
              new Bird(
                child: new Text("基础数据用法"),
                onPressed: baseDataFunc.baseFunc,
              ),
              new Bird(
                child: new Text("数组数据--不可变数据用法"),
                onPressed: listDataFunc.fixedLengthList,
              ),
              new Bird(
                child: new Text("数组数据--可变数据用法1"),
                onPressed: listDataFunc.growList,
              ),
              new Bird(
                child: new Text("数组数据--可变数据用法2"),
                onPressed: listDataFunc.growList2,
              ),
              new Bird(
                child: new Text("数组数据--可变数据用法3"),
                onPressed: listDataFunc.growList3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ToolbarOne extends StatelessWidget {
  ToolbarOne({this.title});

  final BaseDataFunc func = new BaseDataFunc();
  final ListDataFunc listDataFunc = new ListDataFunc();
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 20.0),
      height: 56.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: new BoxDecoration(color: Colors.blue[500]),
      child: new Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.menu),
//            onPressed: showMenu(context),
            onPressed: listDataFunc.fixedLengthList,
            tooltip: '点点点',
          ),
          new Expanded(child: title),
          new IconButton(
            icon: new Icon(Icons.access_time),
//            onPressed: showTime(context),
            onPressed: listDataFunc.growList3,
            tooltip: '哒哒哒',
          )
        ],
      ),
    );
  }
}

class Bird extends StatefulWidget {
  const Bird({
    Key key,
    this.color: Colors.redAccent,
    this.child,
    this.onPressed,
  })
      : super(key: key);

  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  @override
  State<StatefulWidget> createState() => new BirdState();
}

class BirdState extends State<Bird> {
  double _size = 1.0;

  void grow() {
    setState(() {
      _size + -0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new InkResponse(
      onTap: widget.onPressed,
      child: widget.child,
      highlightColor: Theme.of(context).highlightColor,
      splashColor: Theme.of(context).splashColor,
    );
  }
}
