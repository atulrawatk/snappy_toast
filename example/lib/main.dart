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
      home: SmartSnackToastWrapper(child: const SmartSnackDemo()),
    );
  }
}

class SmartSnackDemo extends StatefulWidget {
  const SmartSnackDemo({super.key});

  @override
  State<SmartSnackDemo> createState() => _SmartSnackDemoState();
}

class _SmartSnackDemoState extends State<SmartSnackDemo> {
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
                  child: Text("Press Me!"))
            ],
          )),
    );
  }
}
