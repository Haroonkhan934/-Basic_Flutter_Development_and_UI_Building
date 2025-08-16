// File: lib/auth_view_model.dart
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  // Login Logic
  Future<bool> login(String email, String password) async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2)); // fake API delay
    _setLoading(false);

    if (email == "test@test.com" && password == "123456") {
      _setError(null);
      return true;
    } else {
      _setError("Invalid email or password");
      return false;
    }
  }

  // Signup Logic
  Future<bool> signup(String name, String email, String password) async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);

    _setError(null);
    return true; // Always success (demo)
  }

  // Forgot Password Logic
  Future<void> forgotPassword(String email) async {
    _setLoading(true);
    await Future.delayed(const Duration(seconds: 2));
    _setLoading(false);

    // Just showing success snackbar
    }
}
