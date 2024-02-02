import 'package:flutter/material.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class SignatureData {
  final String signatureText;

  SignatureData({
    required this.signatureText,
  });
}

class FontPickerScreen extends StatefulWidget {
  const FontPickerScreen({Key? key}) : super(key: key);

  @override
  State<FontPickerScreen> createState() => _FontPickerScreenState();
}

class _FontPickerScreenState extends State<FontPickerScreen> {
  Locale _selectedLocale = Locale('en', 'US');
  String _selectedCountry = 'India'; // Default country

  List<DropdownMenuItem<Locale>> _buildLanguageDropdown() {
    final languages = [
      {'label': 'English (US)', 'locale': Locale('en', 'US')},
      {'label': 'Español', 'locale': Locale('es', 'ES')},
      {'label': 'Français', 'locale': Locale('fr', 'FR')},
      {'label': 'Deutsch', 'locale': Locale('de', 'DE')},
      {'label': 'Português', 'locale': Locale('pt', 'PT')},
      {'label': 'Русский', 'locale': Locale('ru', 'RU')},
    ];

    return languages
        .map((language) => DropdownMenuItem(
              child: Text(
                language['label'] as String,
              ),
              value: language['locale'] as Locale,
            ))
        .toList();
  }

  List<DropdownMenuItem<String>> _buildCountryDropdown() {
    final countries = [
      'India',
      'United States',
      'Spain',
      'France',
      'Germany',
      'Portugal',
      'Russia',
    ];

    return countries
        .map((country) => DropdownMenuItem(
              child: Text(
                country,
              ),
              value: country,
            ))
        .toList();
  }

  bool isChecked = false;
  List<SignatureData> signatures = [];

  TextEditingController _textFieldController = TextEditingController();
  TextEditingController _editTextFieldController = TextEditingController();
  int _editingIndex = -1;

  List<Widget> inUseStars = [];
  List<Widget> notInUseStars = [
    Icon(Icons.star, color: Colors.orangeAccent, size: 15),
    SizedBox(
      width: 5,
    ),
    Icon(Icons.star, color: Colors.pinkAccent, size: 15),
    SizedBox(
      width: 5,
    ),
    Icon(Icons.star, color: Colors.purpleAccent, size: 15),
    SizedBox(
      width: 5,
    ),
    Icon(Icons.star, color: Colors.blueAccent, size: 15),
    SizedBox(
      width: 5,
    ),
    Icon(Icons.star, color: Colors.greenAccent, size: 15),
    SizedBox(
      width: 5,
    ),
    Container(
      height: 15,
      width: 15,
      color: Colors.pink,
      child: Text(
        '!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900),
      ),
    ),
    SizedBox(
      width: 10,
    ),
    Container(
      height: 15,
      width: 15,
      color: Colors.orange,
      child: const Text(
        '>>',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900),
      ),
    ),
    SizedBox(
      width: 10,
    ),
    Container(
      height: 15,
      width: 15,
      color: Colors.yellow,
      child: const Text(
        '!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900),
      ),
    ),
    SizedBox(
      width: 10,
    ),
    Container(
      height: 15,
      width: 15,
      color: Colors.green,
      child: Icon(Icons.check, size: 8),
    ),
    SizedBox(
      width: 10,
    ),
    Container(
      height: 15,
      width: 15,
      color: Colors.blue,
      child: const Text(
        'i',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 8, fontWeight: FontWeight.w900),
      ),
    ),
    SizedBox(
      width: 10,
    ),
    Container(
      height: 15,
      width: 15,
      color: Colors.purpleAccent,
      child: Icon(Icons.question_mark, size: 8),
    )
  ];

  String selectedSize = 'Medium'; // Default size
  Color selectedColor = Colors.black;
  String selectedFont = 'Roboto';

  // Method to handle font changes
  void _onFontChanged(String? value) {
    if (value != null) {
      setState(() {
        selectedFont = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isWeb = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Assignment')),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 50, right: 20, bottom: 20, top: 20),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Language:',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    SizedBox(
                      width: 400,
                    ),
                    Text(
                      'Gmail display language:',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 25,
                      width: 250,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          splashColor: Colors.white,
                          highlightColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Locale>(
                            value: _selectedLocale,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20,
                            ),
                            items: _buildLanguageDropdown(),
                            onChanged: (value) {
                              setState(() {
                                _selectedLocale = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        print(
                            'Change language settings for other Google products clicked');
                      },
                      child: Text(
                        'Change language settings for other Google products',
                        style:
                            TextStyle(color: Colors.blueAccent, fontSize: 12),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Phone numbers:',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    SizedBox(width: 370),
                    Text(
                      'Default country code:',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 25,
                      width: 250,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          splashColor: Colors.white,
                          highlightColor: Colors.white,
                          hoverColor: Colors.white,
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _selectedCountry,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20,
                            ),
                            items: _buildCountryDropdown(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCountry = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Default text style:'),
                        RichText(
                            text: TextSpan(
                                text:
                                    '(Use the "Remove formatting" \nbutton on the toolbar to reset\nthe default text style)'))
                      ],
                    ),
                    SizedBox(
                      width: 280,
                    ),
                    Container(
                      height: 130,
                      width: 400,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              DropdownButton<String>(
                                value: selectedFont,
                                items: [
                                  'Roboto',
                                  'Open Sans',
                                  'Lato',
                                  'Poppins'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged:
                                    _onFontChanged, // Use the callback method
                                underline: Container(),
                              ),
                              PopupMenuButton(
                                initialValue: selectedSize,
                                itemBuilder: (BuildContext context) {
                                  return ['Small', 'Medium', 'Large', 'Huge']
                                      .map((String value) {
                                    return PopupMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList();
                                },
                                onSelected: (String value) {
                                  setState(() {
                                    selectedSize = value;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.text_format),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                child: VerticalDivider(
                                  thickness: 0.2,
                                  color: Colors.grey,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showColorPicker(
                                      context); // Open color palette
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.text_format),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              ),
                              Container(
                                height: 20,
                                child: VerticalDivider(
                                  thickness: 0.2,
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(Icons.format_strikethrough_outlined),
                            ],
                          ),
                          Text("This is what your body text look like.",
                              style: GoogleFonts.getFont(selectedFont,
                                  fontSize: _calculateFontSize(selectedSize),
                                  color: selectedColor))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Stars:'),
                    SizedBox(
                      width: 420,
                    ),
                    Text(
                      'Drag the stars between the lists. The stars will rotate in the ordershown below when\nyou click successively. To learn the name of a star for search, hover your mouse over the image.',
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 460),
                  child: Row(
                    children: [
                      Text('Presets:'),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            inUseStars = [
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                            ];
                            notInUseStars = [
                              Icon(Icons.star,
                                  color: Colors.orangeAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.pinkAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.purpleAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.blueAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.greenAccent, size: 15),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.pink,
                                child: Text(
                                  '!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.orange,
                                child: const Text(
                                  '>>',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.yellow,
                                child: const Text(
                                  '!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.green,
                                child: Icon(Icons.check, size: 8),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.blue,
                                child: const Text(
                                  'i',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.purpleAccent,
                                child: Icon(Icons.question_mark, size: 8),
                              )
                            ];
                          });
                        },
                        child: Text('1 star',
                            style: TextStyle(color: Colors.blue)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            inUseStars = [
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.blueAccent, size: 15),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.green,
                                child: Icon(Icons.check, size: 8),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.pink,
                                child: Text(
                                  '!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ];
                            notInUseStars = [
                              Icon(Icons.star,
                                  color: Colors.orangeAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.pinkAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.purpleAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.greenAccent, size: 15),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.orange,
                                child: const Text(
                                  '>>',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.yellow,
                                child: const Text(
                                  '!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.blue,
                                child: const Text(
                                  'i',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 8, fontWeight: FontWeight.w900),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.purpleAccent,
                                child: Icon(Icons.question_mark, size: 8),
                              )
                            ];
                          });
                        },
                        child: Text(
                          '4 stars',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            inUseStars = [
                              Icon(Icons.star, color: Colors.yellow, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.pinkAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.purpleAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.blueAccent, size: 15),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.star,
                                  color: Colors.greenAccent, size: 15),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.green,
                                child: Icon(Icons.check, size: 8),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.pink,
                                child: Text(
                                  '!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.orange,
                                child: const Text(
                                  '>>',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.yellow,
                                child: const Text(
                                  '!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.blue,
                                child: const Text(
                                  'i',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                color: Colors.purpleAccent,
                                child: Icon(Icons.question_mark, size: 8),
                              )
                            ];
                            notInUseStars = [];
                          });
                        },
                        child: Text('all stars',
                            style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 460),
                  child: Row(
                    children: [
                      Text('In use:'),
                      SizedBox(
                        width: 35,
                      ),
                      ...inUseStars,
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 460),
                  child: Row(
                    children: [
                      Text('Not in use:'),
                      SizedBox(
                        width: 10,
                      ),
                      ...notInUseStars,
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Signature:'),
                    SizedBox(
                      width: isWeb ? 400 : 10,
                    ),
                    signatures.isEmpty
                        ? Text('No signatures')
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...signatures.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final signature = entry.value;
                                  return Row(
                                    children: [
                                      Container(
                                        height: 100,
                                        width: isWeb ? 150 : 80,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 5),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(signature.signatureText),
                                            Spacer(),
                                            IconButton(
                                                icon:
                                                    Icon(Icons.edit, size: 20),
                                                onPressed: () {
                                                  _showEditDialog(index);
                                                }),
                                            SizedBox(
                                              width: isWeb ? 5 : 2,
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.delete_outline,
                                                    size: 20),
                                                onPressed: () {
                                                  _deleteSignature(index);
                                                }),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 100,
                                        width: 600,
                                        decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: Column(
                                          children: [
                                            Text('THANKS'),
                                            Divider(),
                                            Row(
                                              children: [
                                                DropdownButton<String>(
                                                  value: selectedFont,
                                                  items: [
                                                    'Roboto',
                                                    'Open Sans',
                                                    'Lato',
                                                    'Poppins'
                                                  ].map((String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      value: value,
                                                      child: Text(value),
                                                    );
                                                  }).toList(),
                                                  onChanged:
                                                      _onFontChanged, // Use the callback method
                                                  underline: Container(),
                                                ),
                                                PopupMenuButton(
                                                  initialValue: selectedSize,
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return [
                                                      'Small',
                                                      'Medium',
                                                      'Large',
                                                      'Huge'
                                                    ].map((String value) {
                                                      return PopupMenuItem<
                                                          String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList();
                                                  },
                                                  onSelected: (String value) {
                                                    setState(() {
                                                      selectedSize = value;
                                                    });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.text_format,
                                                        size: 10,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 10,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 20,
                                                  child: VerticalDivider(
                                                    thickness: 0.2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _showColorPicker(
                                                        context); // Open color palette
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.text_format,
                                                        size: 10,
                                                      ),
                                                      Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 10,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 20,
                                                  child: VerticalDivider(
                                                    thickness: 0.2,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Icon(
                                                  Icons
                                                      .format_strikethrough_outlined,
                                                  size: 15,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.format_bold,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    // Handle bold button press
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.format_italic,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    // Handle italic button press
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.format_underlined,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    // Handle underline button press
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.attachment,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    // Handle attachment button press
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.photo,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    // Handle gallery button press
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.format_align_left,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    // Handle left align button press
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.format_align_center,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    // Handle center align button press
                                                  },
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.format_align_right,
                                                    size: 15,
                                                  ),
                                                  onPressed: () {
                                                    // Handle right align button press
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 465),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      color: Colors.grey,
                      height: isWeb ? 30 : 20,
                      width: isWeb ? 150 : 80,
                      child: MaterialButton(
                        onPressed: () {
                          _showCreateNewDialog(context);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            Text('Create new'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: isWeb ? 15 : 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 455),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Signature defaults'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'FOR NEW EMAILS USE',
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('ON REPLY/FORWARD USE')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Row tapped');
                        },
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white),
                              height: 30,
                              width: isWeb ? 150 : 120,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  splashColor: Colors.white,
                                  highlightColor: Colors.white,
                                  hoverColor: Colors.white,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    items: [
                                      ...signatures.map((signature) {
                                        return DropdownMenuItem<String>(
                                          value: signature.signatureText,
                                          child: Text(signature.signatureText),
                                        );
                                      }).toList(),
                                    ],
                                    onChanged: (String? value) {
                                      print('Selected: $value');
                                    },
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text('No signature'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white),
                              height: 30,
                              width: isWeb ? 150 : 120,
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  splashColor: Colors.white,
                                  highlightColor: Colors.white,
                                  hoverColor: Colors.white,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    items: [
                                      ...signatures.map((signature) {
                                        return DropdownMenuItem<String>(
                                          value: signature.signatureText,
                                          child: Text(signature.signatureText),
                                        );
                                      }).toList(),
                                    ],
                                    onChanged: (String? value) {
                                      print('Selected: $value');
                                    },
                                    hint: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text('No signature'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: isWeb ? 15 : 10),
                      Row(
                        children: [
                          Checkbox(
                            activeColor: Colors.grey,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value ?? false;
                              });
                            },
                          ),
                          Text(
                              'Insert signature before quoted text in replies and remove the "--" line that precedes it.'),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showCreateNewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Name new signature'),
          content: Container(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _textFieldController,
                  maxLength: 320,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Signature Name',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: '${_textFieldController.text.length}/320',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: _textFieldController.text.length > 0 &&
                      _textFieldController.text.length <= 320
                  ? () {
                      setState(() {
                        signatures.add(SignatureData(
                          signatureText: _textFieldController.text,
                        ));
                      });
                      Navigator.of(context).pop();
                    }
                  : null,
              child: Text(
                'Create',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEditDialog(int index) {
    _editTextFieldController.text = signatures[index].signatureText;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit signature'),
          content: Container(
            width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _editTextFieldController,
                  maxLength: 320,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Edit Signature',
                    hintStyle: TextStyle(fontSize: 14),
                    counterText: '${_editTextFieldController.text.length}/320',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: _textFieldController.text.length > 0 &&
                      _textFieldController.text.length <= 320
                  ? () {
                      setState(() {
                        signatures.add(SignatureData(
                          signatureText: _textFieldController.text,
                        ));
                      });
                      Navigator.of(context).pop();
                    }
                  : null,
              child: Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  void _deleteSignature(int index) {
    setState(() {
      signatures.removeAt(index);
    });
  }

  Future<void> _showColorPicker(BuildContext context) async {
    Color pickedColor = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickersEnabled: const <ColorPickerType, bool>{
                ColorPickerType.both: false,
                ColorPickerType.primary: true,
                ColorPickerType.accent: true,
                ColorPickerType.custom: true,
              },
              color: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
              heading: Text('Select color'),
              subheading: Text('Select color shade'),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(selectedColor);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );

    if (pickedColor != null) {
      // Handle the picked color
      print("Picked color: $pickedColor");
      print(selectedFont);
    }
  }

  double _calculateFontSize(String size) {
    switch (size) {
      case 'Small':
        return 10;
      case 'Medium':
        return 16;
      case 'Large':
        return 20;
      case 'Huge':
        return 25;
      default:
        return 16; // Default size
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: FontPickerScreen(),
  ));
}
