import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onPressed;

  const CustomCard({
    Key? key,
    required this.label,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 16),
            Text(label),
            Spacer(),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
