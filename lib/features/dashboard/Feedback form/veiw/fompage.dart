import 'package:flutter/material.dart';

class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController feedbackController = TextEditingController();
  String? selectedFeedbackType;
  String? selectedRating;
  final List<String> feedbackTypes = [
    'Select feedback type',
    'Product Quality',
    'Delivery Service',
    'Customer Support',
    'Other',
  ];
  final List<String> serviceRate = [
    'Rate the service',
    '1',
    '2',
    '3',
    '4',
    '5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feedback Form',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFBD8F97),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Expanded(
          child: ListView(scrollDirection: Axis.vertical, children: [
            Column(
              children: [
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: selectedFeedbackType,
                  decoration: InputDecoration(
                    labelText: 'Feedback Type',
                    labelStyle: TextStyle(color: Color(0xFFBD8F97)),

                    //fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFFBD8F97)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFFBD8F97)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Color(0xFFB1B1B1), width: 3.0),
                    ),
                  ),
                  items: feedbackTypes.map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedFeedbackType = value;
                    });
                  },
                  // validator: (value) {

                  //   if (value == null || value == feedbackTypes[0]) {
                  //     return 'Pleaseeeee select a feedback type';
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: selectedRating,
                  decoration: InputDecoration(
                    labelText: 'Rate',
                    labelStyle: TextStyle(color: Color(0xFFBD8F97)),
                    //filled: true,
                    //fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFFBD8F97)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFFBD8F97)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Color(0xFFB1B1B1), width: 3.0),
                    ),
                  ),
                  items: serviceRate.map((String rate) {
                    return DropdownMenuItem<String>(
                      value: rate,
                      child: Text(rate),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRating = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value == serviceRate[0]) {
                      return 'Pleaseeeeeee Rate the service';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextField(
                  controller: feedbackController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Your Feedback',
                    labelStyle: TextStyle(color: Color(0xFFBD8F97)),
                    //filled: true,
                    //fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFFBD8F97)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Color(0xFFBD8F97)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Color(0xFFB1B1B1), width: 3.0),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFBD8F97)),
                  onPressed: () {
                    if (selectedFeedbackType == null ||
                        selectedFeedbackType == feedbackTypes[0]) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Please select a feedback type')),
                      );
                    } else if (selectedRating == null ||
                        selectedRating == serviceRate[0]) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please Rate the service')),
                      );
                    } else {
                      String feedback = feedbackController.text;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Feedback submitted!')),
                      );

                      feedbackController.clear();
                      setState(() {
                        selectedFeedbackType = null;
                        selectedRating = null;
                      });
                    }
                  },
                  child: Text('Submit Feedback',
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
