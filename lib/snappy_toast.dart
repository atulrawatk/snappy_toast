/// A lightweight, no-context, no-navigator-key toast/snackbar manager for Flutter.
///
/// SnappyToast allows you to show toast and snackbar messages anywhere in your app
/// without needing to pass `BuildContext`, use `Navigator`, or wrap widgets in `Stack`.
///
/// Features:
/// - Queue-based toast display
/// - Supports multiple toast styles and positions
/// - Works with snackbars too
/// - No dependency on context or overlay setup by the user
/// - Easy to configure, extend, and customize
///
/// Example:
/// dart
/// SnappyToast.showToast('This is a toast!');
/// SnappyToast.showSnack('This is a snack!');
/// 
library snappy_toast;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'core/snappy_toast_x.dart';        // Core logic for showing toast/snack.
part 'core/toast_manager.dart';         // Internal toast/snack queue manager.
part 'enums/enums.dart';                // All enums for config and customization.
part 'widgets/smart_snack_toast_wrapper.dart';  // App-level wrapper with overlay.
part 'widgets/toast_animated_widget.dart';      // Animation widget for toasts.
part 'extensions.dart';                 // Helpful extensions.