

class BaseDataFunc {
  int _counter = 0;
  int figureA = -100;
  double figureC = 108.80889;
  double figureF = 99.838889;
  int figureD = 108;
  int figureE = 88;
  String helloW = "Hello world!";
  String trimW = "\tHello world!\n";
  String phonePre = "86";

  /// 基础类型示例
  void baseFunc() {
    print("是否负数:" + figureA.isNegative.toString());
    print("是否有限:" + figureA.isFinite.toString());
    print("是否无限:" + figureA.isInfinite.toString());
    print("是否偶数:" + figureA.isEven.toString());
    print("是否奇数:" + figureA.isOdd.toString());
    print("是否非数字:" + figureE.isNaN.toString());
    print("返回符号(-1.0:值小于0、+1.0:值大于0、-0.0/0.0/NaN:值是其本身):" +
        figureC.sign.toString());
    print("运行类型：" + figureA.runtimeType.toString());
    print("占存储位：" + _counter.bitLength.toString());
    print("绝对值：" + figureA.abs().toString());
    print("字符串：" + figureA.toString());
    print("108.80889整型值：" + figureC.toInt().toString());
    print("99.838889整型值：" + figureF.toInt().toString());
    print("108.80889双精度值：" + figureC.toDouble().toString());
    print("99.838889双精度值：" + figureF.toDouble().toString());
    print("108.80889大于本身的双精度值：" + figureC.ceilToDouble().toString());
    print("99.838889大于本身的双精度值：" + figureF.ceilToDouble().toString());
    print("108.80889小于本身的双精度值：" + figureC.floorToDouble().toString());
    print("99.838889小于本身的双精度值：" + figureF.floorToDouble().toString());
    print("108.80889四舍五入的双精度值：" + figureC.roundToDouble().toString());
    print("99.838889四舍五入的双精度值：" + figureF.roundToDouble().toString());
    print("108.80889保留几位小数的字符串：" + figureC.toStringAsFixed(2));
    print("99.838889保留几位小数的字符串：" + figureF.toStringAsFixed(2));
    print("108.80889保留几位数后精确结果的字符串：" + figureC.toStringAsPrecision(6));
    print("99.838889保留几位数后精确结果的字符串：" + figureF.toStringAsPrecision(5));
    print("对比：" + figureF.compareTo(figureA).toString());
    print("对比：" + figureF.compareTo(figureF).toString());
    print("对比：" + figureF.compareTo(figureC).toString());
    print(
        "控制数字在指定区间：" + figureF.clamp(10.00000, 100.000000).toStringAsFixed(6));
    print("88与5的截取余数：" + figureE.remainder(5).toString());
    print("88与5的最大公约数：" + figureE.gcd(5).toString());
    print("2的2次幂值的字符串：" + 2.toStringAsExponential(2));

    print("返回字符串的UTF-16代码单元列表" + helloW.codeUnits.toString());
    print("返回字符串的UTF-16代码单元列表" + helloW.codeUnitAt(0).toString());
    print("我是中国人".codeUnits);
    print("返回根据代码单元生成的哈希码" + helloW.hashCode.toString());
    print("字符串的长度" + helloW.length.toString());
    print("返回字符串Unicode代码的可迭代对象" + helloW.runes.toString());

    print("截取0到4的字符串：" + helloW.substring(0, 4));
    print("在字符串中插入 $helloW");
    print("$trimW 去掉前空格" + trimW.trimLeft());
    print("$trimW 去掉后空格" + trimW.trimRight());
    print("$trimW 去掉前后空格" + trimW.trim());
    print("$helloW 拆分" + helloW.split(new RegExp(r"l*")).toString());
    print("$helloW 包含" +
        helloW.contains(new RegExp(r'[A-Za-z]'), helloW.length - 2).toString());
    print("$helloW 包含" +
        helloW.contains(new RegExp(r'[A-Za-z]'), helloW.length - 1).toString());

    phonePre = phonePre.padLeft(3, '+');
    print("$phonePre 前补占位符" + phonePre);
    print("$phonePre 后补占位符" + phonePre.padRight(4, "x"));

    print("$helloW 索引" + helloW.indexOf('d').toString());
    print("$helloW 索引" + helloW.indexOf(new RegExp(r' ')).toString());
    print("$helloW last索引" + helloW.lastIndexOf("l").toString());
    print("$helloW last索引" + helloW.lastIndexOf(new RegExp(r'l')).toString());

    print("$helloW 替换" + helloW.replaceAll('l', 'L').toString());

    RegExp exp = new RegExp(r"(\w+)");
    // 返回正则表达式的哈希码
    print(exp.hashCode);
    // 正则表达式是否区分大小写
    print(exp.isCaseSensitive);
    // 正则表达式是否匹配多行
    print(exp.isMultiLine);
    // 返回源正则表达式字符串
    print(exp.pattern);
    // 返回对象运行时的类型
    print(exp.runtimeType);
    // 返回正则表达式匹配项的可迭代对象
    print(exp.allMatches("l"));
    // 搜索并返回第一个匹配项，没有则返回null
    print(exp.firstMatch("l"));
    // 正则表达式是否找到匹配项
    print(exp.hasMatch("as"));
    // 从第几个字符开始匹配正则表达式
    print(exp.matchAsPrefix("ab cd", 3));
    // 返回正则表达式的第一个匹配字符串
    print(exp.stringMatch("abc de"));
    // 返回正则表达式的字符串表示
    print(exp.toString());
    //验证邮政编码的正则，返回是否匹配的布尔值
    RegExp postalcode = new RegExp(r'(\d{6})');
    print(postalcode.hasMatch("510000"));
    //验证手机号码的正则，以Iterable< Match >返回所有匹配项
    RegExp mobile = new RegExp(
        r"(0|86|17951)?(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
    Iterable<Match> mobiles =
    mobile.allMatches("13812345678 12345678901 17012345678 8615202011224");
    for (Match m in mobiles) {
      String match = m.group(0);
      print(match);
    }
    //验证身份证号码的正则，返回第一个匹配的字符串
    RegExp identity = new RegExp(r"\d{17}[\d|x]|\d{15}");
    print(identity.stringMatch("My id number is 35082419931023527x"));
    //验证网址URL的正则，如果匹配成功以Match返回匹配项，否则返回null
    RegExp url = new RegExp(r"^((https|http|ftp|rtsp|mms)?:\/\/)[^\s]+");
    print(url.stringMatch("http://www.google.com"));
  }
}