import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String token = dotenv.get('TOKEN', fallback: "");
  void _getListAPI() async {
    http.get(Uri.https('api.themoviedb.org', '/4/list/1'), headers: {
      'Authorization': 'Bearer ' + token,
      'accept': 'application/json',
    }).then((Response value) => print(value.body));
  }

  @override
  void initState() {
    super.initState();
    _getListAPI();
  }

//eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YzE1MmFlYzE5OTIwYTJmYTYxNmRkNmE5ZGNiODlkYSIsInN1YiI6IjY2MWU5M2M2MWNmZTNhMDE2NDlhZWZkNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.g8sMMJQ4yFm4XBf8VH2YON-YKS77MoplESzBHMvgP50
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Center(
          child: Text('Olá mundo!'),
        ),
      ),
    );
  }
}
