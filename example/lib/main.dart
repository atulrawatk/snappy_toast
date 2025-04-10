import 'package:flutter/material.dart';
import 'package:snappy_toast/snappy_toast.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Toast Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SmartSnackToastWrapper(child: const SmartFormDemo()),
    );
  }
}

class SmartFormDemo extends StatefulWidget {
  const SmartFormDemo({super.key});

  @override
  State<SmartFormDemo> createState() => _SmartFormDemoState();
}

class _SmartFormDemoState extends State<SmartFormDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Toast Example')),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [

              /// smart_snack_toast
              ElevatedButton(
                  onPressed: () {
                    SmartToast.show(
                      message: "Hello from SmartToast!",
                      type: ToastType.success,
                      haptic: true,
                      hapticType: HapticFeedbackType.heavy,
                      dismissType: DismissType.onTap,
                    );
                  },
                  child: Text("AA DBA DE!"))
            ],
          )),
    );
  }
}