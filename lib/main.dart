import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SurveyScreen(),
    );
  }
}


class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);

  @override
  _SurveyScreenState createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  // List of questions
  final List<String> _questions = [
    'How satisfied are you with our service?',
    'How easy was it to use our app?',
    'How helpful was our customer support?',
    'How likely are you to recommend us to a friend?',
    'How would you rate the quality of our products?',
    'How often do you use our service?',
    'How would you rate the overall experience?',
    'How responsive was our team to your needs?',
  ];

  // List of selected ratings, initialized to -1
  final List<int> _ratings = List.generate(8, (_) => -1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(8, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${index + 1}. ${_questions[index]}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(5, (ratingIndex) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _ratings[index] = ratingIndex + 1;
                            });
                          },
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: _ratings[index] == ratingIndex + 1
                                  ? Colors.blue
                                  : Colors.grey[300],
                            ),
                            child: Center(
                              child: Text(
                                '${ratingIndex + 1}',
                                style: TextStyle(
                                  color: _ratings[index] == ratingIndex + 1
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
