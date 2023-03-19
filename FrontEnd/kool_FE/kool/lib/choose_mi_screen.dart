import 'package:flutter/material.dart';
import 'package:kool/dashboard_screen.dart';

import 'adder/fancy_button.dart';

class ChooseMIScreen extends StatefulWidget {
  const ChooseMIScreen({Key? key}) : super(key: key);
  @override
  _ChooseMIScreen createState() => _ChooseMIScreen();
}

class _ChooseMIScreen extends State<ChooseMIScreen> {
  bool _valueSecond = false;
  bool _valueOne = false;
  bool _valueThrid = false;
  bool _valueFourth = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Thiết lập màu cho biểu tượng back
      ),
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Choose your topic interest',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0, // giá trị kích thước phông chữ là 32px
                  fontFamily: 'Poppins'),
            ),
          ),
          const Positioned(
            top: 52.0,
            left: 68,
            right: 52,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit enim, ac amet ultrices.',
              style: TextStyle(
                  color: Color.fromARGB(255, 117, 115, 115),
                  fontWeight: FontWeight.normal,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),

          //Mathematical
          Positioned(
            top: 118.0,
            left: 68.0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.numbers,
                color: Color.fromARGB(255, 97, 4, 81),
              ),
            ),
          ),
          const Positioned(
            top: 125.0,
            left: 130,
            right: 60,
            child: Text(
              'Mathematics',
              style: TextStyle(
                  color: Color.fromARGB(255, 7, 7, 7),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),
          const Positioned(
            top: 140.0,
            left: 130,
            right: 60,
            child: Text(
              'Geometry, Algorithm',
              style: TextStyle(
                  color: Color.fromARGB(255, 119, 117, 117),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),
          Positioned(
            top: 129.0,
            right: 50.0,
            child: Checkbox(
              shape: const CircleBorder(),
              value: _valueOne,
              onChanged: (bool? value) {
                setState(() {
                  _valueOne = value ?? false;
                });
              },
            ),
          ),
          //Economic
          Positioned(
            top: 218.0,
            left: 68.0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.business,
                color: Color.fromARGB(255, 240, 120, 8),
              ),
            ),
          ),
          const Positioned(
            top: 225.0,
            left: 130,
            right: 60,
            child: Text(
              'Economy',
              style: TextStyle(
                  color: Color.fromARGB(255, 7, 7, 7),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),
          const Positioned(
            top: 240.0,
            left: 130,
            right: 60,
            child: Text(
              'Stock, Property, News',
              style: TextStyle(
                  color: Color.fromARGB(255, 119, 117, 117),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),
          Positioned(
            top: 229.0,
            right: 50.0,
            child: Checkbox(
              shape: const CircleBorder(),
              value: _valueSecond,
              onChanged: (bool? value) {
                setState(() {
                  _valueSecond = value ?? false;
                });
              },
            ),
          ),
          //English
          Positioned(
            top: 318.0,
            left: 68.0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.language,
                color: Color.fromARGB(255, 5, 82, 224),
              ),
            ),
          ),
          const Positioned(
            top: 325.0,
            left: 130,
            right: 60,
            child: Text(
              'English',
              style: TextStyle(
                  color: Color.fromARGB(255, 7, 7, 7),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),
          const Positioned(
            top: 340.0,
            left: 130,
            right: 60,
            child: Text(
              'Stock, Property, News',
              style: TextStyle(
                  color: Color.fromARGB(255, 119, 117, 117),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),
          Positioned(
            top: 329.0,
            right: 50.0,
            child: Checkbox(
              shape: const CircleBorder(),
              value: _valueThrid,
              onChanged: (bool? value) {
                setState(() {
                  _valueThrid = value ?? false;
                });
              },
            ),
          ),
          // Music
          Positioned(
            top: 418.0,
            left: 68.0,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.2),
              ),
              child: const Icon(
                Icons.music_note,
                color: Color.fromARGB(255, 240, 8, 209),
              ),
            ),
          ),
          const Positioned(
            top: 425.0,
            left: 130,
            right: 60,
            child: Text(
              'Music',
              style: TextStyle(
                  color: Color.fromARGB(255, 7, 7, 7),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),
          const Positioned(
            top: 440.0,
            left: 130,
            right: 60,
            child: Text(
              'Stock, Property, News',
              style: TextStyle(
                  color: Color.fromARGB(255, 119, 117, 117),
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0, // giá trị kích thước phông chữ là 15px
                  fontFamily: 'Poppins'),
            ),
          ),
          Positioned(
            top: 429.0,
            right: 50.0,
            child: Checkbox(
              shape: const CircleBorder(),
              value: _valueFourth,
              onChanged: (bool? value) {
                setState(() {
                  _valueFourth = value ?? false;
                });
              },
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
                label: 'Continue',
                onPressed: () {
                  // do something
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashBoardScreen()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
