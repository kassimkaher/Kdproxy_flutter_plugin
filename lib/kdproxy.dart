import 'dart:async';

import 'package:flutter/services.dart';

/// A flutter plugin to read network proxy info from native. It can be used to set up the network proxy for flutter.
class Kdproxy {
  /// channel
  static const MethodChannel _channel = MethodChannel('kdproxy');

  /// ProxySetting
  static Future<ProxySetting?> get getProxy async {
    return _channel //
        .invokeMapMethod<String, dynamic>('getProxySetting')
        .then((e) => ProxySetting._fromMap(e ?? {}));
  }
}

/// ProxySetting
class ProxySetting {
  /// host
  String? host;

  /// port
  int? port;

  /// private
  ProxySetting._({
    this.host,
    this.port,
  });

  /// private
  factory ProxySetting._fromMap(Map<String, dynamic> map) {
    return ProxySetting._(
      host: map['host'],
      port: map['port'] != null //
          ? int.parse(map['port'].toString())
          : null,
    );
  }

  /// enabled
  bool get isProxyApply =>
      (host?.isNotEmpty ?? false) && //
      ((port ?? 0) > 0);
}
