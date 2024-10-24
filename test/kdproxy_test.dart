import 'package:flutter_test/flutter_test.dart';
import 'package:kdproxy/kdproxy.dart';
import 'package:kdproxy/kdproxy_platform_interface.dart';
import 'package:kdproxy/kdproxy_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKdproxyPlatform
    with MockPlatformInterfaceMixin
    implements KdproxyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final KdproxyPlatform initialPlatform = KdproxyPlatform.instance;

  test('$MethodChannelKdproxy is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKdproxy>());
  });

  test('getPlatformVersion', () async {
    Kdproxy kdproxyPlugin = Kdproxy();
    MockKdproxyPlatform fakePlatform = MockKdproxyPlatform();
    KdproxyPlatform.instance = fakePlatform;

    expect(await kdproxyPlugin.getPlatformVersion(), '42');
  });
}
