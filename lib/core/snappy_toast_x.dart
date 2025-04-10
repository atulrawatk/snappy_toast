part of '../snappy_toast.dart';

class SmartToast {
  static final SmartToast _instance = SmartToast._internal();
  factory SmartToast() => _instance;
  SmartToast._internal();

  // Holds queued toasts and active toasts on screen
  static final List<ToastManager> _queue = [];
  static final List<OverlayEntry> _activeToasts = [];

  // Max number of toasts shown at once
  static const int _queueLimit = 3;

  // Global overlay state
  static late OverlayState _overlayState;

  // Call this once to initialize with OverlayState
  static void initialize(OverlayState state) {
    _overlayState = state;
  }

  /// Shows a toast
  static void show({
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 2),
    ToastPosition position = ToastPosition.bottom,
    Widget Function(String message, ToastType type)? builder,
    bool dismissAll = false,
    int priority = 0,
    bool haptic = false,
    HapticFeedbackType hapticType = HapticFeedbackType.light,
    IconData? customIcon,
    ToastStyle style = ToastStyle.detailed,
    DismissType dismissType = DismissType.swipe,
  }) {
    if (_overlayState.mounted == false) return;

    // Optionally clear all current toasts
    if (dismissAll) {
      for (final active in _activeToasts) {
        active.remove();
      }
      _activeToasts.clear();
      _queue.clear();
    }

    // Optional haptic feedback
    if (haptic) {
      switch (hapticType) {
        case HapticFeedbackType.light:
          HapticFeedback.lightImpact();
          break;
        case HapticFeedbackType.medium:
          HapticFeedback.mediumImpact();
          break;
        case HapticFeedbackType.heavy:
          HapticFeedback.heavyImpact();
          break;
      }
    }

    // Create a toast entry
    final toast = ToastManager(
      message: message,
      type: type,
      duration: duration,
      position: position,
      builder: builder,
      overlayState: _overlayState,
      priority: priority,
      customIcon: customIcon,
      style: style,
      dismissType: dismissType,
    );

    // If max limit reached, add to queue
    if (_activeToasts.length >= _queueLimit) {
      _queue.add(toast);
      _queue.sort((a, b) => b.priority.compareTo(a.priority));
    } else {
      _show(toast);
    }
  }

  // Internal method to show a toast
  static void _show(ToastManager toast) {
    late OverlayEntry entry;

    // Build the actual overlay entry
    entry = OverlayEntry(
      builder: (context) => toast.build(() {
        // On dismiss: remove from active and show next from queue
        entry.remove();
        _activeToasts.remove(entry);
        if (_queue.isNotEmpty) {
          final next = _queue.removeAt(0);
          _show(next);
        }
      }),
    );

    toast.overlayState.insert(entry);
    _activeToasts.add(entry);
  }

  // Clear all toasts and queue
  static void dismissAll() {
    for (final active in _activeToasts) {
      active.remove();
    }
    _activeToasts.clear();
    _queue.clear();
  }
}
