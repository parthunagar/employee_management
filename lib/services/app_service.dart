
import 'package:employee_management/helper/stream_helper.dart';

class AppService extends StreamHelper {
  // final BehaviorSubject<HomeViewTab> _homeViewTabBS = BehaviorSubject<HomeViewTab>()..sink.add(HomeViewTab.Shy);
  // late final Stream<HomeViewTab> _homeViewTabObs;
  // late final StreamSink<HomeViewTab> _homeViewTabSink;
  bool _initiated = false;

  AppService._(
    this.enableLogs,
  ) {
    // _homeViewTabObs = _homeViewTabBS.stream;
    // _homeViewTabSink = _homeViewTabBS.sink;
    init();
  }

  static AppService? _instance;

  static AppService getInstance({
    bool enableLogs = false,
  }) {
    _instance ??= AppService._(
      enableLogs,
    );
    if (enableLogs) {}
    return _instance!;
  }

  final bool enableLogs;

  bool get initiated => _initiated;

  void init() {
    _initiated = true;
  }

  void reload() {
    return init();
  }

  // Stream<HomeViewTab> get homeTab {
  //   return _homeViewTabObs;
  // }

  // setHomeTab(HomeViewTab value) {
  //   _homeViewTabSink.add(value);
  // }

  dispose() {
    unsubscribeAll();
    // _homeViewTabSink.add(HomeViewTab.IceBreaker);
    _initiated = false;
  }
}
