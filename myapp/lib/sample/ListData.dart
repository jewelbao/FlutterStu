/// 集合类型
class ListDataFunc {
  /// 固定长度列表
  void fixedLengthList() {
    // 指定长度后不可更改长度
    List<int> fixedLengthList = new List<int>(5);

    fixedLengthList[0] = 2;
    printInfo(fixedLengthList, "=================修改数组第一项的值");

    // 错误修改，不可变数组不能更改长度，以下会报错
    try {
      fixedLengthList.add(0);
      fixedLengthList.length = 6;
      printInfo(fixedLengthList, "=================修改数组");
    } catch (e) {
      printInfo(fixedLengthList, "=================尝试修改数组发生异常");
    }

    // 不可更改长度和值
    List<int> fixedLengthList2 =
        new List<int>.unmodifiable(new Iterable.empty());
    printInfo(
        fixedLengthList2, "=================创建一个不可变的空的数组=================");

    // 错误修改，不可变数组不能更改长度，以下会报错
    try {
      fixedLengthList2.length = 2;
      printInfo(fixedLengthList2, "=================修改数组长度");
    } catch (e) {
      printInfo(fixedLengthList2, "=================尝试修改数组长度发生异常");
    }

    List<int> fixedLengthList3 = new List<int>.unmodifiable([1, 2, 3]);
    printInfo(
        fixedLengthList3, "=================创建一个不可变的初始值的数组=================");

    // 错误修改，不可变数组不能更改长度，以下会报错
    try {
      fixedLengthList2[0] = 2;
      printInfo(fixedLengthList3, "=================修改数组第一项的值");
    } catch (e) {
      printInfo(fixedLengthList3, "=================尝试修改数组内容发生异常");
    }
  }

  void growList() {
    /// 不指定长度，可任意变更
    List<int> list2 = new List();
    printInfo(list2, "=================创建一个空数组=================");

    list2.add(0);
    printInfo(list2, "=================添加一个值到数组");

    list2.length = 0;
    printInfo(list2, "=================修改数组长度");

    list2.length = 3;
    printInfo(list2, "=================修改数组长度");

    list2[2] = 1000;
    printInfo(list2, "=================修改数组第二项的值");
  }

  void growList2() {
    List<int> list = [];
    printInfo(list, "=================创建空数组====================");

    list.add(0);
    printInfo(list, "=================添加一个值到数组");

    list.length = 5;
    printInfo(list, "=================修改数组长度");

    List<int> growList = [10, 100];
    printInfo(growList, "=================创建一个有初始值的数组=================");

    growList.add(200);
    printInfo(growList, "=================添加一个值到数组");

    List<int> growList2 = new List()..length = 3;
    printInfo(growList2, "=================创建一个空数组并且更改它的长度=================");
  }

  void growList3() {
    List list = new List.from([1,2,3], growable: false);
    printInfo(list, "=================创建一个有初始值的数组=================");
  }

  ///
  /// fixedLengthList 数组
  ///
  void printInfo(Iterable fixedLengthList, [String test]) {
    print(test);
    print("List长度 ${fixedLengthList.length}");
    print("List == ${fixedLengthList.toString()}");
  }
}
