part of '../snappy_toast.dart';

enum ToastPosition { top, center, bottom }

// Visual style: minimal (text+icon) or detailed (with close button)
enum ToastStyle { minimal, detailed }

enum DismissType {
  /// Dismiss by swiping (default).
  swipe,

  /// Dismiss by tapping the toast/snackbar.
  onTap,
}

/// Enum to define the haptic feedback intensity when toast/snackbar is shown.
enum HapticFeedbackType {
  /// Light vibration feedback.
  light,

  /// Medium vibration feedback.
  medium,

  /// Strong vibration feedback.
  heavy,
}

enum ToastType { success, error, warning, info }
