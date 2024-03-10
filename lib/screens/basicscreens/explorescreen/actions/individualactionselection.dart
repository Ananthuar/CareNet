import 'package:carenet/screens/basicscreens/explorescreen/actions/view_story/story_viewer.dart';
import 'package:carenet/screens/basicscreens/explorescreen/transactions/transaction_page.dart';
import 'package:flutter/material.dart';

void individualactionSelection(context, stryurl, toTranf, problem) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Confirmation...'),
      content: const Text('Select One..!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => ViewStory(
                      storyUrl: stryurl,
                    ))));
          },
          child: const Text('See their story'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => PaymentPage(
                      tranfname: toTranf,
                      prob: problem,
                    ))));
          },
          child: const Text('Lend a hand'),
        ),
      ],
    ),
  );
}
