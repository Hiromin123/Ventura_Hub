import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/add_post_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Investor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _getInitialScreen(), // Здесь вызываем проверку на авторизацию
      routes: {
        '/home': (context) => HomeScreen(),
        '/add_post': (context) => AddPostScreen(),
      },
    );
  }

  // Метод для проверки авторизации и выбора стартового экрана
  Widget _getInitialScreen() {
    // Получаем текущего пользователя
    User? user = FirebaseAuth.instance.currentUser;

    // Если пользователь авторизован, отправляем его на главный экран
    if (user != null) {
      return HomeScreen();
    } else {
      // Если не авторизован, показываем экран авторизации
      return LoginScreen();
    }
  }
}
