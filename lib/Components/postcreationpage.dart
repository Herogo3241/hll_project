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
              margin: EdgeInsets.all(8),
              child:
                  ElevatedButton(onPressed: () {}, child: const Text('Post')))
        ],
      ),
    );
  }
}
