import 'package:flutter/material.dart';

class LoadFailedItem extends StatelessWidget {
  final VoidCallback? onRetry;
  const LoadFailedItem({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Failed to load data. Please try again.',
            style: TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
