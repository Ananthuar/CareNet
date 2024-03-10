import 'package:carenet/screens/basicscreens/explorescreen/transactions/transaction_uploads.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upi_india/upi_india.dart';

class PaymentPage extends StatelessWidget {
  String tranfname;

  String prob;

  PaymentPage({super.key, required this.tranfname, required this.prob});
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Proceed Your Payment',
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 60),
              TextField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Enter amount',
                  prefixIcon: Icon(Icons.currency_rupee),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () async {
                      UpiIndia upi = UpiIndia();
                      double? paymAmount = double.parse(_amountController.text);
                      UpiResponse response = await upi.startTransaction(
                          app: UpiApp.phonePe,
                          receiverUpiId: 'sajithack1982@oksbi',
                          receiverName: 'Sajitha C K',
                          transactionRefId: '3122175571223',
                          amount: paymAmount);
                      if (response.status == UpiPaymentStatus.SUCCESS) {
                        Fluttertoast.showToast(
                            msg: "Transaction Successful",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor:
                                const Color.fromARGB(255, 254, 181, 248),
                            textColor: Colors.white,
                            fontSize: 16.0);
                        _amountController.clear();
                        collectTransactionDetails(
                            context, tranfname, prob, _amountController.text);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Transaction Failed",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor:
                                const Color.fromARGB(255, 254, 181, 248),
                            textColor: Colors.white,
                            fontSize: 16.0);
                        _amountController.clear();
                        String amount = paymAmount.toString();
                        collectTransactionDetails(
                            context, tranfname, prob, amount);
                      }
                    },
                    child: const Text('Pay'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
