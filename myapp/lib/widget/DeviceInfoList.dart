import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class DeviceInfoList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new DeviceInfoState();
  }
}


class DeviceInfoState extends State<DeviceInfoList> {

  static final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
  Map<String, dynamic> deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedContainer(
        duration: Duration.zero,
        decoration: new BoxDecoration(
          color: Colors.white,
        ),
        child: new ListView(
          shrinkWrap: true,
          children: deviceData.keys.map((String property) {
            return new Row(
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(property, style: const TextStyle(fontWeight: FontWeight.bold),),
                ),
                new Expanded(child: new Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
                  child: new Text('${deviceData[property]}',),
                ))
              ],
            );
          }).toList(),
        ));
  }

  Future<Null> initPlatformState() async {
    Map<String, dynamic> deviceData;

    try{
      if(Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if(Platform.isIOS) {
        deviceData = readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = {'Error:' : 'Failed to get platform version'};
    }

    if(!mounted) return;
    setState(() {
      this.deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
    };
  }

  Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }
}