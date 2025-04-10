part of '../snappy_toast.dart';

class ToastManager {
  final String message;
  final ToastType type;
  final Duration duration;
  final ToastPosition position;
  final Widget Function(String message, ToastType type)? builder;
  final OverlayState overlayState;
  final int priority;
  final IconData? customIcon;
  final ToastStyle style;
  final DismissType dismissType;

  ToastManager({
    required this.message,
    required this.type,
    required this.duration,
    required this.position,
    required this.builder,
    required this.overlayState,
    required this.priority,
    required this.customIcon,
    required this.style,
    required this.dismissType,
  });

  // Build the visual widget for the toast
  Widget build(VoidCallback onDismiss) {
    double? top;
    double? bottom;
    Alignment alignment;

    // Position handling
    switch (position) {
      case ToastPosition.top:
        top = 50;
        alignment = Alignment.topCenter;
        break;
      case ToastPosition.center:
        alignment = Alignment.center;
        break;
      case ToastPosition.bottom:
      default:
        bottom = 50;
        alignment = Alignment.bottomCenter;
        break;
    }

    // Build the toast content
    Widget toastContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: type.color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 10),
        ],
      ),
      child: style == ToastStyle.minimal
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(customIcon ?? type.icon, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(message,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center),
                ),
              ],
            )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(customIcon ?? type.icon, color: Colors.white, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(message,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      textAlign: TextAlign.center),
                ),
                if (dismissType == DismissType.swipe) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onDismiss,
                    child:
                        const Icon(Icons.close, color: Colors.white, size: 18),
                  ),
                ],
              ],
            ),
    );

    // Return positioned toast in overlay
    return Positioned(
      top: top,
      bottom: bottom,
      left: 20,
      right: 20,
      child: Align(
        alignment: alignment,
        child: ToastAnimatedWidget(
          duration: duration,
          onDismissed: onDismiss,
          child: Material(
            color: Colors.transparent,
            child: builder != null
                ? builder!(message, type)
                : dismissType == DismissType.onTap
                    ? GestureDetector(onTap: onDismiss, child: toastContent)
                    : Dismissible(
                        key: UniqueKey(),
                        direction: DismissDirection.up,
                        onDismissed: (_) => onDismiss(),
                        child: toastContent,
                      ),
          ),
        ),
      ),
    );
  }
}
