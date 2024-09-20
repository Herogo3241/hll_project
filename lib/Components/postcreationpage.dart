import 'package:flutter/material.dart';

class PostCreation extends StatefulWidget {
  const PostCreation({super.key});

  @override
  State<PostCreation> createState() => _PostCreationState();
}

class _PostCreationState extends State<PostCreation> {
  Future<void> _exitPostCreation() async {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: _exitPostCreation, icon: const Icon(Icons.clear)),
        actions: [
          Container(
              margin: const EdgeInsets.all(8),
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Post')))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 20,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Image',
        child: const Icon(Icons.image),
      ),
    );
  }
}
