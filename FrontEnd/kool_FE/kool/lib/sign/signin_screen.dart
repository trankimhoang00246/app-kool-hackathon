import 'dart:convert';
import 'package:kool/server_ip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kool/dashboard_screen.dart';
import 'package:kool/adder/fancy_button.dart';
import 'package:kool/sign/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../choose_mi_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late String username;
  late String password;
  late String checkPassword;
  // Obtain shared preferences.
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> loginUser() async {
    try {
      final response = await http.post(
        Uri.parse('http://$serverIp:8080/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "userName": username,
          "password": password,
        }),
      );

      if (response.body.toString() != '') {
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setString('userId', response.body);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChooseMIScreen()),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Column(
              children: [
                SvgPicture.string(
                    '''<svg width="129" height="129" viewBox="0 0 129 129" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M64.5 10.75C34.83 10.75 10.75 34.83 10.75 64.5C10.75 94.17 34.83 118.25 64.5 118.25C94.17 118.25 118.25 94.17 118.25 64.5C118.25 34.83 94.17 10.75 64.5 10.75ZM64.5 69.875C61.5438 69.875 59.125 67.4562 59.125 64.5V43C59.125 40.0438 61.5438 37.625 64.5 37.625C67.4562 37.625 69.875 40.0438 69.875 43V64.5C69.875 67.4562 67.4562 69.875 64.5 69.875ZM69.875 91.375H59.125V80.625H69.875V91.375Z" fill="#DF2626"/>
</svg>
'''),
                const Text('Error'),
              ],
            ),
            content: const Text('Widget name same a other widget.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.string(
                    '''<svg width="117" height="58" viewBox="0 0 117 58" fill="none" xmlns="http://www.w3.org/2000/svg">
<rect width="117" height="58" rx="29" fill="#1B82FA"/>
<path d="M41.4091 35V23.3636H45.4773C46.2879 23.3636 46.9564 23.5038 47.483 23.7841C48.0095 24.0606 48.4015 24.4337 48.6591 24.9034C48.9167 25.3693 49.0455 25.8864 49.0455 26.4545C49.0455 26.9545 48.9564 27.3674 48.7784 27.6932C48.6042 28.0189 48.3731 28.2765 48.0852 28.4659C47.8011 28.6553 47.4924 28.7955 47.1591 28.8864V29C47.5152 29.0227 47.8731 29.1477 48.233 29.375C48.5928 29.6023 48.8939 29.928 49.1364 30.3523C49.3788 30.7765 49.5 31.2955 49.5 31.9091C49.5 32.4924 49.3674 33.017 49.1023 33.483C48.8371 33.9489 48.4186 34.3182 47.8466 34.5909C47.2746 34.8636 46.5303 35 45.6136 35H41.4091ZM42.8182 33.75H45.6136C46.5341 33.75 47.1875 33.572 47.5739 33.2159C47.964 32.8561 48.1591 32.4205 48.1591 31.9091C48.1591 31.5152 48.0587 31.1515 47.858 30.8182C47.6572 30.4811 47.3712 30.2121 47 30.0114C46.6288 29.8068 46.1894 29.7045 45.6818 29.7045H42.8182V33.75ZM42.8182 28.4773H45.4318C45.8561 28.4773 46.2386 28.3939 46.5795 28.2273C46.9242 28.0606 47.197 27.8258 47.3977 27.5227C47.6023 27.2197 47.7045 26.8636 47.7045 26.4545C47.7045 25.9432 47.5265 25.5095 47.1705 25.1534C46.8144 24.7936 46.25 24.6136 45.4773 24.6136H42.8182V28.4773ZM54.2017 35.2045C53.6487 35.2045 53.1468 35.1004 52.696 34.892C52.2453 34.6799 51.8873 34.375 51.6222 33.9773C51.357 33.5758 51.2244 33.0909 51.2244 32.5227C51.2244 32.0227 51.3229 31.6174 51.5199 31.3068C51.7169 30.9924 51.9801 30.7462 52.3097 30.5682C52.6392 30.3902 53.0028 30.2576 53.4006 30.1705C53.8021 30.0795 54.2055 30.0076 54.6108 29.9545C55.1411 29.8864 55.571 29.8352 55.9006 29.8011C56.2339 29.7633 56.4763 29.7008 56.6278 29.6136C56.7831 29.5265 56.8608 29.375 56.8608 29.1591V29.1136C56.8608 28.553 56.7074 28.1174 56.4006 27.8068C56.0975 27.4962 55.6373 27.3409 55.0199 27.3409C54.3797 27.3409 53.8778 27.4811 53.5142 27.7614C53.1506 28.0417 52.8949 28.3409 52.7472 28.6591L51.4744 28.2045C51.7017 27.6742 52.0047 27.2614 52.3835 26.9659C52.7661 26.6667 53.1828 26.4583 53.6335 26.3409C54.0881 26.2197 54.535 26.1591 54.9744 26.1591C55.2547 26.1591 55.5767 26.1932 55.9403 26.2614C56.3078 26.3258 56.6619 26.4602 57.0028 26.6648C57.3475 26.8693 57.6335 27.178 57.8608 27.5909C58.0881 28.0038 58.2017 28.5568 58.2017 29.25V35H56.8608V33.8182H56.7926C56.7017 34.0076 56.5502 34.2102 56.3381 34.4261C56.1259 34.642 55.8438 34.8258 55.4915 34.9773C55.1392 35.1288 54.7093 35.2045 54.2017 35.2045ZM54.4062 34C54.9366 34 55.3835 33.8958 55.7472 33.6875C56.1146 33.4792 56.3911 33.2102 56.5767 32.8807C56.7661 32.5511 56.8608 32.2045 56.8608 31.8409V30.6136C56.804 30.6818 56.679 30.7443 56.4858 30.8011C56.2964 30.8542 56.0767 30.9015 55.8267 30.9432C55.5805 30.9811 55.34 31.0152 55.1051 31.0455C54.8741 31.072 54.6866 31.0947 54.5426 31.1136C54.1941 31.1591 53.8684 31.233 53.5653 31.3352C53.2661 31.4337 53.0237 31.5833 52.8381 31.7841C52.6563 31.9811 52.5653 32.25 52.5653 32.5909C52.5653 33.0568 52.7377 33.4091 53.0824 33.6477C53.4309 33.8826 53.8722 34 54.4062 34ZM64.1946 35.1818C63.3764 35.1818 62.6719 34.9886 62.081 34.6023C61.4901 34.2159 61.0355 33.6837 60.7173 33.0057C60.3991 32.3277 60.2401 31.553 60.2401 30.6818C60.2401 29.7955 60.4029 29.0133 60.7287 28.3352C61.0582 27.6534 61.5166 27.1212 62.1037 26.7386C62.6946 26.3523 63.384 26.1591 64.1719 26.1591C64.7855 26.1591 65.3385 26.2727 65.831 26.5C66.3234 26.7273 66.7268 27.0455 67.0412 27.4545C67.3556 27.8636 67.5507 28.3409 67.6264 28.8864H66.2855C66.1832 28.4886 65.956 28.1364 65.6037 27.8295C65.2552 27.5189 64.7855 27.3636 64.1946 27.3636C63.6719 27.3636 63.2135 27.5 62.8196 27.7727C62.4295 28.0417 62.1245 28.4223 61.9048 28.9148C61.6889 29.4034 61.581 29.9773 61.581 30.6364C61.581 31.3106 61.687 31.8977 61.8991 32.3977C62.1151 32.8977 62.4181 33.286 62.8082 33.5625C63.2022 33.839 63.6643 33.9773 64.1946 33.9773C64.5431 33.9773 64.8594 33.9167 65.1435 33.7955C65.4276 33.6742 65.6681 33.5 65.8651 33.2727C66.062 33.0455 66.2022 32.7727 66.2855 32.4545H67.6264C67.5507 32.9697 67.3632 33.4337 67.0639 33.8466C66.7685 34.2557 66.3764 34.5814 65.8878 34.8239C65.4029 35.0625 64.8385 35.1818 64.1946 35.1818ZM70.8366 31.8182L70.8139 30.1591H71.0866L74.9048 26.2727H76.5639L72.4957 30.3864H72.3821L70.8366 31.8182ZM69.5866 35V23.3636H70.9276V35H69.5866ZM75.1321 35L71.723 30.6818L72.6776 29.75L76.8366 35H75.1321Z" fill="white"/>
</svg>
'''),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold), // Thiết lập màu cho chữ
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Thiết lập màu cho biểu tượng back
      ),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: MediaQuery.of(context).size.width / 2 - 100,
            child: SizedBox(
              height: 80,
              child: SvgPicture.asset('assets/svg/Graduation-cap.svg'),
            ),
          ),
          const Positioned(
              top: 120,
              left: 24,
              child: Text(
                'Name',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                    fontFamily: 'Poppins'),
              )),
          Positioned(
            top: 143,
            left: 24,
            right: 24,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Bo góc khung
                color: const Color(0xFFF1F5F9),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none, // Loại bỏ viền của TextField
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  hintText: 'Your name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
              ),
            ),
          ),
          const Positioned(
              top: 205,
              left: 24,
              child: Text(
                'Password',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                    fontFamily: 'Poppins'),
              )),
          Positioned(
            top: 228,
            left: 24,
            right: 24,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Bo góc khung
                color: const Color(0xFFF1F5F9),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none, // Loại bỏ viền của TextField
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  hintText: 'Your password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
            ),
          ),
          Positioned(
            top: 290,
            left: MediaQuery.of(context).size.width / 3 - 120,
            child: TextButton(
              onPressed: () {
                // do something
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupScreen()),
                );
              },
              child: Row(
                children: [
                  const SizedBox(width: 100),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 13, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Don’t have an account? ',
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 24,
            right: 24,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // Bo góc khung
                color: const Color(0xFFF1F5F9),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: FancyButton(
                label: 'Sign In',
                onPressed: () => loginUser(),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
