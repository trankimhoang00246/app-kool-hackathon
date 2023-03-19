import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kool/dashboard_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import '../review/revision_notes_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen(
      {Key? key, required this.noteName, required this.noteContent})
      : super(key: key);
  final String noteName;
  final String noteContent;
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class WidgetModel {
  final String name;
  WidgetModel(
    this.name,
  );

  // Constructor with one parameter
  WidgetModel.fromName(this.name);
}

class _NotesScreenState extends State<NotesScreen> {
  late File _image;
  late File _file;

  Future<void> _pickImage({VoidCallback? onCancelled}) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile == null) {
      onCancelled?.call();
    } else {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickFile({VoidCallback? onCancelled}) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _file = File(result.files.single.path!);
      });
    } else {
      onCancelled?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    if (noteContent != '') {
      controller.text = noteContent;
    }
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 55),
            Row(
              children: [
                const SizedBox(width: 150),
                const Text(
                  'Archive',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.normal,
                  ),
                ),
                const SizedBox(width: 100),
                IconButton(
                  icon: SvgPicture.string(
                      '''<svg width="13" height="14" viewBox="0 0 13 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M11.6971 1.89062L1.80891 12.4943" stroke="black" stroke-width="2.05282" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M1.80891 1.89062L11.6971 12.4943" stroke="black" stroke-width="2.05282" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>'''), // Fixed the icon name
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashBoardScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.54),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.noteName,
                  style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            const SizedBox(height: 12.45),
            SvgPicture.string(
                '''<svg width="301" height="2" viewBox="0 0 301 2" fill="none" xmlns="http://www.w3.org/2000/svg">
<line x1="0.996552" y1="1.48645" x2="300.003" y2="1.48645" stroke="#848282"/>
</svg>
'''),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: 478,
                  width: 350,
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      hintText: 'Type your message',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    maxLines: null,
                    textInputAction: TextInputAction.newline,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), // Bo góc khung
                    color: const Color(0xFFFE7F5FB),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: 42,
                    child: Row(
                      children: [
                        const SizedBox(width: 44),
                        const Text(
                          'Font',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18.85,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(width: 11),
                        SvgPicture.string(
                            '''<svg width="14" height="8" viewBox="0 0 14 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M1 1L7 7L13 1" stroke="black" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                '''),
                        const SizedBox(width: 36),
                        SvgPicture.string(
                            '''<svg width="21" height="20" viewBox="0 0 21 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                <mask id="mask0_242_468" style="mask-type:luminance" maskUnits="userSpaceOnUse" x="0" y="0" width="21" height="20">
                <path d="M17.6875 1.375H3.3125C2.51859 1.375 1.875 2.01859 1.875 2.8125V17.1875C1.875 17.9814 2.51859 18.625 3.3125 18.625H17.6875C18.4814 18.625 19.125 17.9814 19.125 17.1875V2.8125C19.125 2.01859 18.4814 1.375 17.6875 1.375Z" fill="white" stroke="white" stroke-width="1.91667" stroke-linejoin="round"/>
                <path d="M13.375 10H7.62501M15.2917 5.6875H5.70834M15.2917 14.3125H5.70834" stroke="black" stroke-width="1.91667" stroke-linecap="round" stroke-linejoin="round"/>
                </mask>
                <g mask="url(#mask0_242_468)">
                <path d="M-1 -1.5H22V21.5H-1V-1.5Z" fill="black"/>
                </g>
                </svg>
                '''),
                        const SizedBox(width: 33.5),
                        SvgPicture.string(
                            '''<svg width="22" height="18" viewBox="0 0 22 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M0.5 4.625C0.5 3.46468 0.960936 2.35188 1.78141 1.53141C2.60188 0.710936 3.71468 0.25 4.875 0.25H17.125C18.2853 0.25 19.3981 0.710936 20.2186 1.53141C21.0391 2.35188 21.5 3.46468 21.5 4.625V13.375C21.5 14.5353 21.0391 15.6481 20.2186 16.4686C19.3981 17.2891 18.2853 17.75 17.125 17.75H4.875C3.71468 17.75 2.60188 17.2891 1.78141 16.4686C0.960936 15.6481 0.5 14.5353 0.5 13.375V4.625ZM8.375 5.185V12.815C8.375 13.2525 8.8545 13.5203 9.22725 13.2928L14.9305 9.80675C15.0688 9.72238 15.1831 9.60386 15.2624 9.46259C15.3417 9.32131 15.3834 9.16202 15.3834 9C15.3834 8.83798 15.3417 8.67869 15.2624 8.53741C15.1831 8.39614 15.0688 8.27762 14.9305 8.19325L9.2255 4.709C9.14065 4.65751 9.04364 4.6295 8.9444 4.62784C8.84517 4.62617 8.74727 4.65091 8.66074 4.69952C8.57421 4.74812 8.50215 4.81885 8.45194 4.90447C8.40173 4.99008 8.37518 5.08575 8.375 5.185Z" fill="black"/>
                </svg>
                '''),
                        const SizedBox(width: 33.5),
                        SvgPicture.string(
                            '''<svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                <mask id="mask0_242_477" style="mask-type:luminance" maskUnits="userSpaceOnUse" x="0" y="0" width="22" height="22">
                <path d="M11.0002 20.1667C16.0629 20.1667 20.1668 16.0628 20.1668 11C20.1668 5.93729 16.0629 1.83337 11.0002 1.83337C5.93741 1.83337 1.8335 5.93729 1.8335 11C1.8335 16.0628 5.93741 20.1667 11.0002 20.1667Z" fill="white" stroke="white" stroke-width="1.83333" stroke-linejoin="round"/>
                <path d="M11 5.5C7.96263 5.5 5.5 7.96263 5.5 11M11 16.5C14.0374 16.5 16.5 14.0374 16.5 11" stroke="black" stroke-width="1.83333" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M10.9998 12.8333C11.4861 12.8333 11.9524 12.6401 12.2962 12.2963C12.64 11.9525 12.8332 11.4862 12.8332 11C12.8332 10.5137 12.64 10.0474 12.2962 9.7036C11.9524 9.35978 11.4861 9.16663 10.9998 9.16663C10.5136 9.16663 10.0473 9.35978 9.70348 9.7036C9.35966 10.0474 9.1665 10.5137 9.1665 11C9.1665 11.4862 9.35966 11.9525 9.70348 12.2963C10.0473 12.6401 10.5136 12.8333 10.9998 12.8333Z" fill="black" stroke="black" stroke-width="1.83333" stroke-linejoin="round"/>
                </mask>
                <g mask="url(#mask0_242_477)">
                <path d="M0 0H22V22H0V0Z" fill="black"/>
                </g>
                </svg>
                '''),
                        const SizedBox(width: 33.83),
                        IconButton(
                          icon: SvgPicture.string(
                              '''<svg width="20" height="16" viewBox="0 0 20 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M20 10.536L15.584 6.096C15.2613 5.77454 14.8697 5.53077 14.4389 5.38316C14.008 5.23556 13.5492 5.188 13.0972 5.24409C12.6452 5.30018 12.2119 5.45844 11.8302 5.70689C11.4484 5.95533 11.1283 6.28743 10.894 6.678L5.072 16H3C2.20435 16 1.44129 15.6839 0.87868 15.1213C0.31607 14.5587 0 13.7956 0 13L0 3C0 2.20435 0.31607 1.44129 0.87868 0.87868C1.44129 0.31607 2.20435 0 3 0L17 0C17.7956 0 18.5587 0.31607 19.1213 0.87868C19.6839 1.44129 20 2.20435 20 3V10.536ZM19.989 13.26C19.9239 14.0079 19.5809 14.7042 19.0275 15.2114C18.4741 15.7187 17.7507 16.0001 17 16H7.64L12.609 7.707C12.687 7.5768 12.7937 7.46606 12.9208 7.38319C13.048 7.30032 13.1924 7.24748 13.343 7.22869C13.4936 7.2099 13.6465 7.22564 13.7902 7.27473C13.9338 7.32382 14.0644 7.40496 14.172 7.512L19.989 13.26ZM6 9C6.79565 9 7.55871 8.68393 8.12132 8.12132C8.68393 7.55871 9 6.79565 9 6C9 5.20435 8.68393 4.44129 8.12132 3.87868C7.55871 3.31607 6.79565 3 6 3C5.20435 3 4.44129 3.31607 3.87868 3.87868C3.31607 4.44129 3 5.20435 3 6C3 6.79565 3.31607 7.55871 3.87868 8.12132C4.44129 8.68393 5.20435 9 6 9Z" fill="black"/>
                                        </svg>
                                        '''),
                          onPressed: () => _pickImage(onCancelled: () => {}),
                        ),
                        const SizedBox(width: 13),
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
