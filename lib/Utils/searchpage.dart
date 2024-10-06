import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchFieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchFieldText.addListener(() {
      setState(() {}); 
    });
  }


  void clearSearchText() {
    setState(() {
      searchFieldText.clear();
    });
  }
  @override
  void dispose() {
    searchFieldText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Builder(builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: 40,
          child: TextFormField(
            controller: searchFieldText,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(8.0),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  fontSize: 16,
                ),
                border: const UnderlineInputBorder(),
                suffixIcon: searchFieldText.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          clearSearchText();
                        },
                        icon: const Icon(Icons.clear))
                    : null),
          ),
        );
      }),
    ));
  }
}
