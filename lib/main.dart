import 'package:flutter/material.dart';
import 'package:permission_hamdler/map_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MapScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PermissionStatus? camera;
  PermissionStatus? location;
  PermissionStatus? bluetooth;
  PermissionStatus? microphone;
  PermissionStatus? sms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permission Handler"),
        leading: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Permissions"),
                    content: Container(
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Permission For Camera = ${camera!.name}"),
                          Text("Permission For Camera = ${location!.name}"),
                          Text("Permission For Camera = ${bluetooth!.name}"),
                          Text("Permission For Camera = ${microphone!.name}"),
                          Text("Permission For Camera = ${sms!.name}"),
                        ],
                      ),
                    ),
                  );
                  ;
                },
              );
            },
            icon: const Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {
                openAppSettings();
              },
              icon: const Icon(Icons.settings))
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                camera = await Permission.camera.request();
              },
              child: const Text("Permission For Camera"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                location = await Permission.location.request();
              },
              child: const Text("Permission For Location"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                bluetooth = await Permission.bluetooth.request();
              },
              child: const Text("Permission For Bluetooth"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                microphone = await Permission.microphone.request();
              },
              child: const Text("Permission For MicroPhone"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                sms = await Permission.sms.request();
              },
              child: const Text("Permission For SMS"),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
