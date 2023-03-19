import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        MainScreen.routeName: (ctx) => const MainScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2),
        () => Navigator.of(context).pushNamed(MainScreen.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: ((MediaQuery.of(context).size.width) / 25) * 4,
          ),
          Column(
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height / 100) * 23,
              ),
              SvgPicture.string(
                  '''<svg width="250" height="250" viewBox="0 0 250 250" fill="none" xmlns="http://www.w3.org/2000/svg">
<path opacity="0.2" d="M212.314 65.2908C233.824 92.4408 236.193 140.728 215.778 172.797C195.545 204.685 152.526 220.173 115.341 216.711C78.1556 213.431 46.621 191.201 31.3094 162.229C15.9978 133.257 16.9092 97.5428 32.5854 73.6727C48.2615 49.8026 78.8847 37.9586 114.612 35.0432C150.157 32.1277 190.805 38.1408 212.314 65.2908Z" fill="#86CCE9"/>
<circle opacity="0.5" cx="236.016" cy="170.078" r="6.32813" fill="#52B6DF"/>
<circle opacity="0.5" cx="25.1562" cy="196.094" r="12.6563" fill="#52B6DF"/>
<circle opacity="0.5" cx="28.6716" cy="51.9531" r="4.92188" fill="#52B6DF"/>
<path d="M191.237 80.1809C207.549 100.648 209.346 137.049 193.863 161.224C178.519 185.263 145.894 196.938 117.693 194.329C89.4923 191.856 65.5768 175.098 53.9647 153.257C42.3525 131.417 43.0437 104.494 54.9324 86.4995C66.821 68.5051 90.0453 59.5766 117.14 57.3788C144.097 55.181 174.925 59.714 191.237 80.1809Z" fill="#52B6DF"/>
<path d="M110.085 111.215C110.085 120.238 108.008 128.304 104.757 134.04C101.471 139.839 97.2576 142.855 93.0689 142.855C88.8802 142.855 84.6665 139.839 81.3805 134.04C78.1301 128.304 76.053 120.238 76.053 111.215C76.053 102.191 78.1301 94.1257 81.3805 88.3898C84.6665 82.591 88.8802 79.5741 93.0689 79.5741C97.2576 79.5741 101.471 82.591 104.757 88.3898C108.008 94.1257 110.085 102.191 110.085 111.215Z" stroke="#E7F5FB" stroke-width="4.21875"/>
<ellipse cx="101.861" cy="118.491" rx="5.63222" ry="15.8357" transform="rotate(9.18795 101.861 118.491)" fill="#110C0C"/>
<path d="M176.986 111.215C176.986 120.238 174.909 128.304 171.658 134.04C168.372 139.839 164.159 142.855 159.97 142.855C155.781 142.855 151.568 139.839 148.282 134.04C145.031 128.304 142.954 120.238 142.954 111.215C142.954 102.191 145.031 94.1257 148.282 88.3898C151.568 82.591 155.781 79.5741 159.97 79.5741C164.159 79.5741 168.372 82.591 171.658 88.3898C174.909 94.1257 176.986 102.191 176.986 111.215Z" stroke="#E7F5FB" stroke-width="4.21875"/>
<ellipse cx="168.762" cy="118.491" rx="5.63222" ry="15.8357" transform="rotate(9.18795 168.762 118.491)" fill="#110C0C"/>
</svg>
'''),
              SizedBox(height: (MediaQuery.of(context).size.height) / 50 * 9),
              const SizedBox(
                  height: 70, width: 70, child: CircularProgressIndicator()),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
