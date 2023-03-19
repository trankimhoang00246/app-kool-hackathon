import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kool/Profile/profile_screen.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class WidgetModel {
  final String name;
  final String avatar;
  WidgetModel(this.name, this.avatar);

  // Constructor with one parameter
  WidgetModel.fromName(this.name, this.avatar);
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.string(
                        '''<svg width="346" height="28" viewBox="0 0 346 28" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M19.2585 16.2514L34.2878 16.2514" stroke="black" stroke-width="2.00391" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M25.3201 22.2876L19.2583 16.2518L25.3201 10.215" stroke="black" stroke-width="2.00391" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M166.438 11.48C166.438 12.2933 166.251 13.04 165.878 13.72C165.505 14.3867 164.931 14.9267 164.158 15.34C163.385 15.7533 162.425 15.96 161.278 15.96H159.158V21H155.738V6.96H161.278C162.398 6.96 163.345 7.15333 164.118 7.54C164.891 7.92667 165.471 8.46 165.858 9.14C166.245 9.82 166.438 10.6 166.438 11.48ZM161.018 13.24C161.671 13.24 162.158 13.0867 162.478 12.78C162.798 12.4733 162.958 12.04 162.958 11.48C162.958 10.92 162.798 10.4867 162.478 10.18C162.158 9.87333 161.671 9.72 161.018 9.72H159.158V13.24H161.018ZM171.639 11.7C172.039 11.0867 172.539 10.6067 173.139 10.26C173.739 9.9 174.405 9.72 175.139 9.72V13.34H174.199C173.345 13.34 172.705 13.5267 172.279 13.9C171.852 14.26 171.639 14.9 171.639 15.82V21H168.219V9.84H171.639V11.7ZM181.853 21.16C180.76 21.16 179.773 20.9267 178.893 20.46C178.027 19.9933 177.34 19.3267 176.833 18.46C176.34 17.5933 176.093 16.58 176.093 15.42C176.093 14.2733 176.347 13.2667 176.853 12.4C177.36 11.52 178.053 10.8467 178.933 10.38C179.813 9.91333 180.8 9.68 181.893 9.68C182.987 9.68 183.973 9.91333 184.853 10.38C185.733 10.8467 186.427 11.52 186.933 12.4C187.44 13.2667 187.693 14.2733 187.693 15.42C187.693 16.5667 187.433 17.58 186.913 18.46C186.407 19.3267 185.707 19.9933 184.813 20.46C183.933 20.9267 182.947 21.16 181.853 21.16ZM181.853 18.2C182.507 18.2 183.06 17.96 183.513 17.48C183.98 17 184.213 16.3133 184.213 15.42C184.213 14.5267 183.987 13.84 183.533 13.36C183.093 12.88 182.547 12.64 181.893 12.64C181.227 12.64 180.673 12.88 180.233 13.36C179.793 13.8267 179.573 14.5133 179.573 15.42C179.573 16.3133 179.787 17 180.213 17.48C180.653 17.96 181.2 18.2 181.853 18.2ZM195.108 12.68H193.268V21H189.848V12.68H188.608V9.84H189.848V9.52C189.848 8.14667 190.241 7.10667 191.028 6.4C191.814 5.68 192.968 5.32 194.488 5.32C194.741 5.32 194.928 5.32667 195.048 5.34V8.24C194.394 8.2 193.934 8.29333 193.668 8.52C193.401 8.74667 193.268 9.15333 193.268 9.74V9.84H195.108V12.68ZM198.435 8.68C197.835 8.68 197.341 8.50667 196.955 8.16C196.581 7.8 196.395 7.36 196.395 6.84C196.395 6.30667 196.581 5.86667 196.955 5.52C197.341 5.16 197.835 4.98 198.435 4.98C199.021 4.98 199.501 5.16 199.875 5.52C200.261 5.86667 200.455 6.30667 200.455 6.84C200.455 7.36 200.261 7.8 199.875 8.16C199.501 8.50667 199.021 8.68 198.435 8.68ZM200.135 9.84V21H196.715V9.84H200.135ZM206.033 6.2V21H202.613V6.2H206.033ZM219.032 15.24C219.032 15.56 219.012 15.8933 218.972 16.24H211.232C211.285 16.9333 211.505 17.4667 211.892 17.84C212.292 18.2 212.778 18.38 213.352 18.38C214.205 18.38 214.798 18.02 215.132 17.3H218.772C218.585 18.0333 218.245 18.6933 217.752 19.28C217.272 19.8667 216.665 20.3267 215.932 20.66C215.198 20.9933 214.378 21.16 213.472 21.16C212.378 21.16 211.405 20.9267 210.552 20.46C209.698 19.9933 209.032 19.3267 208.552 18.46C208.072 17.5933 207.832 16.58 207.832 15.42C207.832 14.26 208.065 13.2467 208.532 12.38C209.012 11.5133 209.678 10.8467 210.532 10.38C211.385 9.91333 212.365 9.68 213.472 9.68C214.552 9.68 215.512 9.90667 216.352 10.36C217.192 10.8133 217.845 11.46 218.312 12.3C218.792 13.14 219.032 14.12 219.032 15.24ZM215.532 14.34C215.532 13.7533 215.332 13.2867 214.932 12.94C214.532 12.5933 214.032 12.42 213.432 12.42C212.858 12.42 212.372 12.5867 211.972 12.92C211.585 13.2533 211.345 13.7267 211.252 14.34H215.532Z" fill="black"/>
                    </svg>
                    '''),
                  ),
                ]),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Bo góc khung
                    color: const Color(0xFFFD9D9D9),
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
                      hintText: 'Name user',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        var username = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Bo góc khung
                    color: const Color(0xFFFD9D9D9),
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
                      hintText: '30/02/2004',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        var username = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Bo góc khung
                    color: const Color(0xFFFD9D9D9),
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
                      hintText: 'example@gmail.com',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        var username = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Bo góc khung
                    color: const Color(0xFFFD9D9D9),
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
                      hintText: '09xxxxxxxxxx',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        var username = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Bo góc khung
                    color: const Color(0xFFFD9D9D9),
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
                      hintText: 'Male',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        var username = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()),
                        );
                      },
                      child: SvgPicture.string(
                          '''<svg width="309" height="55" viewBox="0 0 309 55" fill="none" xmlns="http://www.w3.org/2000/svg">
            <rect width="309" height="55" rx="25" fill="#48E94F"/>
            <path d="M127.571 21.768V28.488C127.571 29.16 127.736 29.6773 128.067 30.04C128.397 30.4027 128.883 30.584 129.523 30.584C130.163 30.584 130.653 30.4027 130.995 30.04C131.336 29.6773 131.507 29.16 131.507 28.488V21.768H134.243V28.472C134.243 29.4747 134.029 30.3227 133.603 31.016C133.176 31.7093 132.6 32.232 131.875 32.584C131.16 32.936 130.36 33.112 129.475 33.112C128.589 33.112 127.795 32.9413 127.091 32.6C126.397 32.248 125.848 31.7253 125.443 31.032C125.037 30.328 124.835 29.4747 124.835 28.472V21.768H127.571ZM138.9 25.336C139.167 24.92 139.535 24.584 140.004 24.328C140.473 24.072 141.023 23.944 141.652 23.944C142.388 23.944 143.055 24.1307 143.652 24.504C144.249 24.8773 144.719 25.4107 145.06 26.104C145.412 26.7973 145.588 27.6027 145.588 28.52C145.588 29.4373 145.412 30.248 145.06 30.952C144.719 31.6453 144.249 32.184 143.652 32.568C143.055 32.9413 142.388 33.128 141.652 33.128C141.033 33.128 140.484 33 140.004 32.744C139.535 32.488 139.167 32.1573 138.9 31.752V37.256H136.164V24.072H138.9V25.336ZM142.804 28.52C142.804 27.8373 142.612 27.304 142.228 26.92C141.855 26.5253 141.391 26.328 140.836 26.328C140.292 26.328 139.828 26.5253 139.444 26.92C139.071 27.3147 138.884 27.8533 138.884 28.536C138.884 29.2187 139.071 29.7573 139.444 30.152C139.828 30.5467 140.292 30.744 140.836 30.744C141.38 30.744 141.844 30.5467 142.228 30.152C142.612 29.7467 142.804 29.2027 142.804 28.52ZM146.479 28.52C146.479 27.6027 146.65 26.7973 146.991 26.104C147.343 25.4107 147.818 24.8773 148.415 24.504C149.013 24.1307 149.679 23.944 150.415 23.944C151.002 23.944 151.535 24.0667 152.015 24.312C152.506 24.5573 152.89 24.888 153.167 25.304V21.16H155.903V33H153.167V31.72C152.911 32.1467 152.543 32.488 152.063 32.744C151.594 33 151.045 33.128 150.415 33.128C149.679 33.128 149.013 32.9413 148.415 32.568C147.818 32.184 147.343 31.6453 146.991 30.952C146.65 30.248 146.479 29.4373 146.479 28.52ZM153.167 28.536C153.167 27.8533 152.975 27.3147 152.591 26.92C152.218 26.5253 151.759 26.328 151.215 26.328C150.671 26.328 150.207 26.5253 149.823 26.92C149.45 27.304 149.263 27.8373 149.263 28.52C149.263 29.2027 149.45 29.7467 149.823 30.152C150.207 30.5467 150.671 30.744 151.215 30.744C151.759 30.744 152.218 30.5467 152.591 30.152C152.975 29.7573 153.167 29.2187 153.167 28.536ZM157.339 28.52C157.339 27.6027 157.509 26.7973 157.851 26.104C158.203 25.4107 158.677 24.8773 159.275 24.504C159.872 24.1307 160.539 23.944 161.275 23.944C161.904 23.944 162.453 24.072 162.923 24.328C163.403 24.584 163.771 24.92 164.027 25.336V24.072H166.763V33H164.027V31.736C163.76 32.152 163.387 32.488 162.907 32.744C162.437 33 161.888 33.128 161.259 33.128C160.533 33.128 159.872 32.9413 159.275 32.568C158.677 32.184 158.203 31.6453 157.851 30.952C157.509 30.248 157.339 29.4373 157.339 28.52ZM164.027 28.536C164.027 27.8533 163.835 27.3147 163.451 26.92C163.077 26.5253 162.619 26.328 162.075 26.328C161.531 26.328 161.067 26.5253 160.683 26.92C160.309 27.304 160.123 27.8373 160.123 28.52C160.123 29.2027 160.309 29.7467 160.683 30.152C161.067 30.5467 161.531 30.744 162.075 30.744C162.619 30.744 163.077 30.5467 163.451 30.152C163.835 29.7573 164.027 29.2187 164.027 28.536ZM173.718 30.68V33H172.326C171.334 33 170.561 32.76 170.006 32.28C169.451 31.7893 169.174 30.9947 169.174 29.896V26.344H168.086V24.072H169.174V21.896H171.91V24.072H173.702V26.344H171.91V29.928C171.91 30.1947 171.974 30.3867 172.102 30.504C172.23 30.6213 172.443 30.68 172.742 30.68H173.718ZM183.658 28.392C183.658 28.648 183.642 28.9147 183.61 29.192H177.418C177.461 29.7467 177.637 30.1733 177.946 30.472C178.266 30.76 178.655 30.904 179.114 30.904C179.797 30.904 180.271 30.616 180.538 30.04H183.45C183.301 30.6267 183.029 31.1547 182.634 31.624C182.25 32.0933 181.765 32.4613 181.178 32.728C180.591 32.9947 179.935 33.128 179.21 33.128C178.335 33.128 177.557 32.9413 176.874 32.568C176.191 32.1947 175.658 31.6613 175.274 30.968C174.89 30.2747 174.698 29.464 174.698 28.536C174.698 27.608 174.885 26.7973 175.258 26.104C175.642 25.4107 176.175 24.8773 176.858 24.504C177.541 24.1307 178.325 23.944 179.21 23.944C180.074 23.944 180.842 24.1253 181.514 24.488C182.186 24.8507 182.709 25.368 183.082 26.04C183.466 26.712 183.658 27.496 183.658 28.392ZM180.858 27.672C180.858 27.2027 180.698 26.8293 180.378 26.552C180.058 26.2747 179.658 26.136 179.178 26.136C178.719 26.136 178.33 26.2693 178.01 26.536C177.701 26.8027 177.509 27.1813 177.434 27.672H180.858Z" fill="black"/>
            </svg>
            '''),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
