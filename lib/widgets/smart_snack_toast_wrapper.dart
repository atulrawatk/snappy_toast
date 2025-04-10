part of '../snappy_toast.dart';

class SmartSnackToastWrapper extends StatelessWidget {
  final Widget child;

  const SmartSnackToastWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) {
            SmartToast.initialize(Overlay.of(context));
            return child;
          },
        ),
      ],
    );
  }
}