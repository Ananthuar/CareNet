
import 'package:flutter/material.dart';

void actionSelection(context,urlIndex){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirmation...'),
        content: const Text('Select One..!'),
        actions: [
          TextButton(
            onPressed: () {
              // Perform action
              
            },
            child: const Text('Go to website'),
          ),
          TextButton(
            onPressed: () {
              // Perform action 
              
            },
            child: const Text('Lend a hand'),
          ),
        ],
      ),
    );
  }
  

