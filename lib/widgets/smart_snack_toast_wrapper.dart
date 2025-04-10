part of '../snappy_toast.dart';

/// Wrap your entire app with this widget to enable snappy toasts/snackbars.
///
/// This sets up the necessary overlay behind the scenes.
class SmartSnackToastWrapper extends StatelessWidget {
  /// The main child of the app, usually your MaterialApp or CupertinoApp.
  final Widget child;

  /// Creates a wrapper that enables the global toast/snackbar overlay.
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
        )
      ],
    );
  }
}
