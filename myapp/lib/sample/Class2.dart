/// 工厂构造函数
void main() {

  var logger = new Logger('UI');
  logger.log('Button clicked');
}

/// 使用factory关键字实现构造函数时，不一定要创建一个类的新实例，例如，一个工厂的构造函数可能从缓存中返回一个实例，或者返回一个子类的实例
class Logger {
  final String name;
  bool mute = false;

  static final Map<String, Logger> cache = {};

  factory Logger(String name) {
    if (cache.containsKey(name)) {
      return cache[name];
    } else {
      final logger = new Logger.internal(name);
      cache[name] = logger;
      return logger;
    }
  }

  Logger.internal(this.name);

  log(String msg) {
    if(!mute) {
      print('$name $msg');
    }
  }

}