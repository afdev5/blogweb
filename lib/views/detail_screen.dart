import 'package:blogweb/models/post_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final PostModel data;
  const DetailScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Screen')),
      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8,),
            const Divider(thickness: 2),
            Text(data.body)
          ],
        ),
      ),
    );
  }
}
