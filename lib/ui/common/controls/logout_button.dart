import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:namste_jharkhand/logic/login_logic.dart';
import 'package:namste_jharkhand/main.dart';
import 'package:namste_jharkhand/ui/common/controls/buttons.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, this.size = 40});
  
  final double size;

  @override
  Widget build(BuildContext context) {
    // Only show logout button if user is authenticated
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink(); // Hide button if not authenticated
        }
        
        return AppBtn.basic(
          onPressed: () => _handleLogout(context),
          semanticLabel: 'Logout',
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              color: Colors.red.shade600,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 20,
            ),
          ),
        );
      },
    );
  }

  void _handleLogout(BuildContext context) async {
    final authManager = AuthManager(loadingProvider: authLoadingProvider);
    await authManager.logout(context);
  }
}