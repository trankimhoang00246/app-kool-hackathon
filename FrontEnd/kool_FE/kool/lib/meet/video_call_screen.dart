import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:kool/dashboard_screen.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen(
      {Key? key, required String idRoom, required String idTopic})
      : super(key: key);

  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class WidgetModel {
  final String name;
  final String avatar;
  WidgetModel(this.name, this.avatar);

  // Constructor with one parameter
  WidgetModel.fromName(this.name, this.avatar);
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final List<WidgetModel> _widgets = [];

  final TextEditingController _textFieldController = TextEditingController();
  final List<String> _svgs = [
    '''<svg width="60" height="61" viewBox="0 0 60 61" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="30" cy="30.5403" r="30" fill="#B6CFEB"/>
<path d="M25.025 37.7903L30.25 40.6403V44.0403H21.5C20.1125 44.0403 19 42.9278 19 41.5403V21.5403C19 20.8772 19.2634 20.2414 19.7322 19.7725C20.2011 19.3037 20.837 19.0403 21.5 19.0403H22.75V27.7903L25.875 25.9153L29 27.7903V19.0403H36.5C37.163 19.0403 37.7989 19.3037 38.2678 19.7725C38.7366 20.2414 39 20.8772 39 21.5403V32.2153L37.125 31.1903L25.025 37.7903ZM44 37.7903L37.125 34.0403L30.25 37.7903L37.125 41.5403L44 37.7903ZM32.75 40.4028V42.9028L37.125 45.2903L41.5 42.9028V40.4028L37.125 42.7903L32.75 40.4028Z" fill="#1B82FA"/>
</svg>''',
    '''<svg width="60" height="61" viewBox="0 0 60 61" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="30" cy="30.6207" r="30" fill="#E0EBB6"/>
<path d="M25.025 37.8707L30.25 40.7207V44.1207H21.5C20.1125 44.1207 19 43.0082 19 41.6207V21.6207C19 20.9577 19.2634 20.3218 19.7322 19.853C20.2011 19.3841 20.837 19.1207 21.5 19.1207H22.75V27.8707L25.875 25.9957L29 27.8707V19.1207H36.5C37.163 19.1207 37.7989 19.3841 38.2678 19.853C38.7366 20.3218 39 20.9577 39 21.6207V32.2957L37.125 31.2707L25.025 37.8707ZM44 37.8707L37.125 34.1207L30.25 37.8707L37.125 41.6207L44 37.8707ZM32.75 40.4832V42.9832L37.125 45.3707L41.5 42.9832V40.4832L37.125 42.8707L32.75 40.4832Z" fill="#93C529"/>
</svg>
''',
    '''<svg width="60" height="61" viewBox="0 0 60 61" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="30" cy="30.701" r="30" fill="#730DA4" fill-opacity="0.2"/>
<path d="M25.025 37.951L30.25 40.8011V44.201H21.5C20.1125 44.201 19 43.0885 19 41.701V21.701C19 21.038 19.2634 20.4021 19.7322 19.9333C20.2011 19.4644 20.837 19.201 21.5 19.201H22.75V27.951L25.875 26.076L29 27.951V19.201H36.5C37.163 19.201 37.7989 19.4644 38.2678 19.9333C38.7366 20.4021 39 21.038 39 21.701V32.376L37.125 31.3511L25.025 37.951ZM44 37.951L37.125 34.201L30.25 37.951L37.125 41.701L44 37.951ZM32.75 40.5635V43.0635L37.125 45.451L41.5 43.0635V40.5635L37.125 42.951L32.75 40.5635Z" fill="#730DA4"/>
</svg>''',
    '''<svg width="60" height="61" viewBox="0 0 60 61" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="30" cy="30.7815" r="30" fill="#DA121E" fill-opacity="0.2"/>
<path d="M25.025 38.0315L30.25 40.8815V44.2815H21.5C20.1125 44.2815 19 43.169 19 41.7815V21.7815C19 21.1185 19.2634 20.4826 19.7322 20.0137C20.2011 19.5449 20.837 19.2815 21.5 19.2815H22.75V28.0315L25.875 26.1565L29 28.0315V19.2815H36.5C37.163 19.2815 37.7989 19.5449 38.2678 20.0137C38.7366 20.4826 39 21.1185 39 21.7815V32.4565L37.125 31.4315L25.025 38.0315ZM44 38.0315L37.125 34.2815L30.25 38.0315L37.125 41.7815L44 38.0315ZM32.75 40.644V43.144L37.125 45.5315L41.5 43.144V40.644L37.125 43.0315L32.75 40.644Z" fill="#DA121E"/>
</svg>
''',
    '''<svg width="60" height="61" viewBox="0 0 60 61" fill="none" xmlns="http://www.w3.org/2000/svg">
<circle cx="30" cy="30.8618" r="30" fill="#B6EBE8"/>
<path d="M25.025 38.1118L30.25 40.9618V44.3618H21.5C20.1125 44.3618 19 43.2493 19 41.8618V21.8618C19 21.1988 19.2634 20.5629 19.7322 20.094C20.2011 19.6252 20.837 19.3618 21.5 19.3618H22.75V28.1118L25.875 26.2368L29 28.1118V19.3618H36.5C37.163 19.3618 37.7989 19.6252 38.2678 20.094C38.7366 20.5629 39 21.1988 39 21.8618V32.5368L37.125 31.5118L25.025 38.1118ZM44 38.1118L37.125 34.3618L30.25 38.1118L37.125 41.8618L44 38.1118ZM32.75 40.7243V43.2243L37.125 45.6118L41.5 43.2243V40.7243L37.125 43.1118L32.75 40.7243Z" fill="#0DA476"/>
</svg>
''',
  ];

  String _currentSvg =
      '<svg viewBox="0 0 100 100"><text x="10" y="50">No SVG</text></svg>';
  final Random _random = Random();

  late SvgPicture avatar;

  String _randomizeSvg() {
    return _currentSvg = _svgs[_random.nextInt(_svgs.length)];
  }

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
                  'VideoCall',
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
            Expanded(
              child: ListView.builder(
                itemCount: _widgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 15),
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
                              onPressed: () {},
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  SizedBox(
                                    child: SvgPicture.string(
                                      _widgets[index].avatar,
                                    ),
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
                        onPressed: () {
                          String avatar = _randomizeSvg();
                          String name = _textFieldController.text;
                          if (name == '') {
                            _showErrorDialog();
                            return;
                          }
                          if (_widgets.any((widget) => widget.name == name)) {
                            _showErrorDialog();
                            return;
                          }
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
