import 'dart:async';

class StreamHelper<T> {
  final Map<String, StreamSubscription<T>> _subMap = {};
  
  /// Get a Subscription with `key`
  /// @param {String} key
  /// @returns {Subscription}
  StreamSubscription<T>? getSubscription(String key) {
    return _subMap[key];
  }
  
  /// Store the instanse of a Subscription with `key` and `Subscription instance`
  /// @param {String} key
  /// @param {Subscription} subscription
  /// @returns {void}
  void subscribe(String key, StreamSubscription<T> streamSubscription) {
    if (_subMap[key] != null) {
      _subMap[key]?.cancel();
    }
    _subMap[key] = streamSubscription;
  }
  
  /// Unsubscribe a Subscription with `key`
  /// @param {String} key
  /// @returns {void}
  void unsubscribe(String key) {
    if (_subMap[key] != null) {
      _subMap[key]?.cancel();
      _subMap.remove(key);
    }
  }
  
  /// Unsubscribe all the exsisting Subscriptions
  /// @returns {void}
  void unsubscribeAll() {
    for (String key in _subMap.keys) {
      if (_subMap[key] != null) {
        _subMap[key]?.cancel();
      }
    }
  }
}
