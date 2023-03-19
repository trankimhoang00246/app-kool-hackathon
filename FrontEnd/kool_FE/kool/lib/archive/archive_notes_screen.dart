import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kool/dashboard_screen.dart';

import '../note/notes_screen.dart';

class ArchiveNotesScreen extends StatefulWidget {
  const ArchiveNotesScreen(
      {Key? key, required this.folderName, required this.folderAvatar})
      : super(key: key);
  final String folderName;
  final String folderAvatar;
  @override
  _ArchiveNotesScreenState createState() => _ArchiveNotesScreenState();
}

class WidgetModel {
  final String name;
  final String avatar;
  WidgetModel(this.name, this.avatar);

  // Constructor with one parameter
  WidgetModel.fromName(this.name, this.avatar);
}

class _ArchiveNotesScreenState extends State<ArchiveNotesScreen> {
  final List<WidgetModel> _widgets = [];
  final TextEditingController _textFieldController = TextEditingController();

  void _showErrorDialog() {
    Navigator.of(context).pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('Widget name same a other widget.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(height: 36.54),
            Row(
              children: [
                const SizedBox(width: 38),
                SvgPicture.string(widget.folderAvatar),
                const SizedBox(width: 19),
                Text(
                    style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                    widget.folderName)
              ],
            ),
            const SizedBox(height: 12.45),
            SvgPicture.string(
                '''<svg width="301" height="2" viewBox="0 0 301 2" fill="none" xmlns="http://www.w3.org/2000/svg">
<line x1="0.996552" y1="1.48645" x2="300.003" y2="1.48645" stroke="#848282"/>
</svg>
'''),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: _widgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20),
                      Container(
                        height: 84.08,
                        margin: const EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(31.93),
                          color: const Color(0xFFECE8E8),
                        ),
                        child: Row(
                          children: [
                            TextButton(
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  SizedBox(
                                    child: SvgPicture.string(
                                        '''<svg width="30" height="31" viewBox="0 0 30 31" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M24.2374 14.3447L13.7499 24.8322V28.4197H7.49991C6.11241 28.4197 4.99991 27.3072 4.99991 25.9197V5.91968C4.99991 5.25664 5.2633 4.62075 5.73214 4.15191C6.20098 3.68307 6.83687 3.41968 7.49991 3.41968H8.74991V12.1697L11.8749 10.2947L14.9999 12.1697V3.41968H22.4999C23.1629 3.41968 23.7988 3.68307 24.2677 4.15191C24.7365 4.62075 24.9999 5.25664 24.9999 5.91968V13.7947C24.7249 13.9447 24.4624 14.1197 24.2374 14.3447ZM16.2499 25.8697V28.4197H18.7999L26.4624 20.7697L23.9124 18.2072L16.2499 25.8697ZM28.5624 17.7572L26.9124 16.1072C26.6624 15.8572 26.2499 15.8572 26.0124 16.1072L24.7874 17.3322L27.3374 19.8822L28.5624 18.6572C28.8124 18.4197 28.8124 18.0072 28.5624 17.7572Z" fill="black"/>
</svg>
'''),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff848282),
                                      ),
                                      _widgets[index].name),
                                  const SizedBox(
                                    width: 170,
                                  )
                                ],
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotesScreen(
                                            noteName: _widgets[index].name,
                                            noteContent: '',
                                          )),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          margin: const EdgeInsets.only(right: 16.73, bottom: 56.59),
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add Widget'),
                    content: TextFormField(
                      controller: _textFieldController,
                      decoration: const InputDecoration(
                        hintText: 'Enter widget name',
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () async {
                          String avatar =
                              '''<svg width="30" height="31" viewBox="0 0 30 31" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M24.2374 14.3447L13.7499 24.8322V28.4197H7.49991C6.11241 28.4197 4.99991 27.3072 4.99991 25.9197V5.91968C4.99991 5.25664 5.2633 4.62075 5.73214 4.15191C6.20098 3.68307 6.83687 3.41968 7.49991 3.41968H8.74991V12.1697L11.8749 10.2947L14.9999 12.1697V3.41968H22.4999C23.1629 3.41968 23.7988 3.68307 24.2677 4.15191C24.7365 4.62075 24.9999 5.25664 24.9999 5.91968V13.7947C24.7249 13.9447 24.4624 14.1197 24.2374 14.3447ZM16.2499 25.8697V28.4197H18.7999L26.4624 20.7697L23.9124 18.2072L16.2499 25.8697ZM28.5624 17.7572L26.9124 16.1072C26.6624 15.8572 26.2499 15.8572 26.0124 16.1072L24.7874 17.3322L27.3374 19.8822L28.5624 18.6572C28.8124 18.4197 28.8124 18.0072 28.5624 17.7572Z" fill="black"/>
</svg>
''';
                          String name = _textFieldController.text;
                          if (name == '') {
                            _showErrorDialog();
                            return;
                          }
                          if (_widgets.any((widget) => widget.name == name)) {
                            _showErrorDialog();
                            return;
                          }
                          // await _apiProvider.saveCategory(name);
                          setState(() {
                            _widgets.add(WidgetModel.fromName(name, avatar));
                          });
                          _textFieldController.clear();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Add'),
                      ),
                      TextButton(
                        onPressed: () {
                          _textFieldController.clear();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
