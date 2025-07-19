import 'dart:async';

import 'package:flutter/material.dart';

class CheckInController with ChangeNotifier {
  Timer? _timer;
  Duration _elapsed = Duration.zero;
  Duration get elapsed => _elapsed;

  String? selectedProject;
  String? selectedGate;
  String? workType;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer?.cancel();
    _elapsed = Duration.zero;

    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      _elapsed += Duration(seconds: 1);
      notifyListeners();
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    _elapsed = Duration.zero;
    selectedProject = null;
    selectedGate = null;
    workType = null;
    notifyListeners(); // Optional: trigger UI update to reflect stopped state
  }

  void setProject(String? value) {
    selectedProject = value;
    notifyListeners();
  }

  void setGate(String? value) {
    selectedGate = value;
    notifyListeners();
  }

  void setWorkType(String? value) {
    workType = value;
    notifyListeners();
  }

  bool validateCheckIn(BuildContext context) {
    if (selectedProject == null || selectedGate == null || workType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please select Project, Gate, and Work Type")),
      );
      return false;
    }
    return true;
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(duration.inHours)}:"
        "${twoDigits(duration.inMinutes.remainder(60))}:"
        "${twoDigits(duration.inSeconds.remainder(60))}";
  }
}
