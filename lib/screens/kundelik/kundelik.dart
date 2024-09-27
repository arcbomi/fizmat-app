import 'package:flutter/material.dart';
import 'package:fizmat_app/providers/kundelik/kundelik_auth.dart';

class GetInfoScreen extends StatefulWidget {
  final String token;

  const GetInfoScreen({required this.token});

  @override
  _GetInfoScreenState createState() => _GetInfoScreenState();
}

class _GetInfoScreenState extends State<GetInfoScreen> {
  String _shortName = 'Fetching short name...';
  String _birthday = 'Fetching birthday...';

  @override
  void initState() {
    super.initState();
    _fetchInfo();
  }

  Future<void> _fetchInfo() async {
    try {
      final kunAPI = KunAPI(token: widget.token);
      final response = await kunAPI.getInfo();

      // Parse the response and extract required fields
      final shortName = response['shortName'] ?? 'Not available';
      final birthday = response['birthday'] ?? 'Not available';

      // Format birthday to 'YYYY-MM-DD' format
      String formattedBirthday;
      try {
        final birthdayDate = DateTime.parse(birthday);
        formattedBirthday = '${birthdayDate.year}-${birthdayDate.month.toString().padLeft(2, '0')}-${birthdayDate.day.toString().padLeft(2, '0')}';
      } catch (e) {
        formattedBirthday = 'Invalid date format';
      }

      setState(() {
        _shortName = shortName;
        _birthday = formattedBirthday;
      });
    } catch (e) {
      setState(() {
        _shortName = 'Error fetching short name: ${e.toString()}';
        _birthday = 'Error fetching birthday: ${e.toString()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kundelik user Info'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Short Name:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _shortName,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Birthday:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                _birthday,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
