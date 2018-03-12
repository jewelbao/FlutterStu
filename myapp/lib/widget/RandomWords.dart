import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

/// 随机文字控件
class RandomWords extends StatefulWidget {
  @override
  createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });
      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text('你喜欢'),
        ),
        body: new ListView(
          children: divided,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
//    final wordPair = new WordPair.random();
//    return new Text(wordPair.asPascalCase);

    return new Scaffold(
        appBar: new AppBar(
          title: new Text('随机文字列表'),
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.favorite), onPressed: _pushSaved)
          ],
        ),
        body: _buildSuggestions());
  }

  Widget _buildSuggestions() {
    return new ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return new Divider();

      final index = i ~/ 2; // 此处语法“i〜/ 2”表示将i除以2并返回整数结果，例如1，2，3，4，5经过计算得到0,1,1,2,2。
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      leading: new Image.network(
        'http://img2.imgtn.bdimg.com/it/u=1784123846,3228493594&fm=27&gp=0.jpg',
        scale: 1.0,
        repeat: ImageRepeat.repeat,
        width: 100.0,
        height: 100.0,
      ),
      title: new Text(pair.asPascalCase, style: _biggerFont),
      trailing: new Icon(
        alreadySaved ? Icons.delete : Icons.add,
        color: alreadySaved ? Colors.redAccent : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}
