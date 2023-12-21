import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanshot/pages/dashboard.dart';
import 'package:scanshot/pages/login_page.dart';
import 'package:scanshot/pages/session_manager.dart';
import 'package:scanshot/pages/splash_screen.dart';

// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           WidgetsBinding.instance!.addPostFrameCallback((_) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => DashboardPage()),
//             );
//           });
//         } else {
//           WidgetsBinding.instance!.addPostFrameCallback((_) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => Splash()),
//             );
//           });
//         }
//         return Scaffold(); // return default widget
//       },
//     );
//   }
// }

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: SessionManager.isLoggedIn(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          bool isLoggedIn = snapshot.data ?? false;
          if (isLoggedIn) {
            return FutureBuilder<String?>(
              future: SessionManager.getUserId(),
              builder: (context, userSnapshot) {
                if (userSnapshot.connectionState == ConnectionState.done) {
                  String? userId = userSnapshot.data;
                  if (userId != null) {
                    // Arahkan ke halaman dashboard
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardPage()),
                      );
                    });
                  } else {
                    // Jika ID pengguna tidak tersedia, arahkan ke halaman login
                    WidgetsBinding.instance!.addPostFrameCallback((_) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    });
                  }
                } else {
                  return Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }
                return Scaffold();
              },
            );
          } else {
            return LoginPage();
          }
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
