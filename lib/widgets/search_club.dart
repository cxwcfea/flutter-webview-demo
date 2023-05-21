import 'package:flutter/material.dart';
import 'package:first/widgets/web_view_page.dart';

class SearchClub extends StatelessWidget {
  const SearchClub({super.key});

  void handleURLButtonPress(BuildContext context, String url, String title) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WebViewPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
          child: Column(
        children: [
          MaterialButton(
            color: Colors.blue,
            child: const Text(
              "Open page",
              style:
                  TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              handleURLButtonPress(
                  context, "https://search.club", "search club");
            },
          )
        ],
      )),
    );
  }
}
