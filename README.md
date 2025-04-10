# Snappy Toast

A lightweight, snappy toast and snackbar manager for Flutter.  
✨ Show beautiful toast messages or stylish snackbars — without needing `BuildContext`, `Navigator`, or `Stack` setup.

---
## 💡 Why Snappy Toast?
Avoid boilerplate code.
Works outside widget tree or GetX/Navigator stacks.
Clean overlay-based toast & snackbar manager.

## 🚀 Features

- ✅ Show toast anywhere — without context!
- 🪄 Snackbar support too — separate from toast
- 🔔 Queue system with prioritization
- 🎨 Multiple toast styles (minimal or detailed)
- 📱 Configurable position (top, center, bottom)
- 🧩 Custom icons, durations, and dismiss types
- 💥 Optional haptic feedback
- 🚫 Auto-dismiss and swipe-to-dismiss support

---

## 🛠 Installation

Add the dependency to your `pubspec.yaml`:

```yaml
dependencies:
  snappy_toast:
    path: ../snappy_toast # local testing, update when published
```
## 🧪 Example Usage
### 1️⃣ Initialize
Wrap your app with SnappyToastInitializer:

```dart
    void main() {
      runApp(SnappyToastInitializer(child: MyApp()));
      }
```
✅ You don't need a navigatorKey or extra Stack.

### 2️⃣ Show a Toast
```dart
    SnappyToast.show(
      message: "Hello from toast!",
      type: ToastType.success,
      position: ToastPosition.bottom,
      );
```
### 3️⃣ Show a Snackbar
```dart
    SnappyToast.showSnackBar(
        message: "This is a snackbar",
        type: ToastType.warning,
        duration: Duration(seconds: 3),
        );
```
## 🎛 Configurations

| Parameter     | Description                            | Default     |
|---------------|----------------------------------------|-------------|
| `type`        | success, error, warning, info          | `info`      |
| `position`    | top, center, bottom (toast only)       | `bottom`    |
| `style`       | minimal, detailed                      | `detailed`  |
| `dismissType` | swipe or onTap                         | `swipe`     |
| `duration`    | Show time                              | 2 seconds   |
| `customIcon`  | Override the icon                      | `null`      |
| `priority`    | Priority in the toast queue            | `0`         |
| `haptic`      | Enable haptic feedback                 | `false`     |
| `dismissAll`  | Remove all previous toasts/snackbars   | `false`     |

## ✨ Author
Made with ❤️ by Samuel & Atul