import 'package:TS_AppsMovil/Model/Company.dart';
import 'package:TS_AppsMovil/Model/Payment.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:TS_AppsMovil/Services/http-service.dart';

class PaymentList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PaymentList();
}

class _PaymentList extends State<PaymentList> {
  final HttpService httpService = HttpService();
  List<Payment> payments;

  Future<List<Payment>> getPayments() async {
    this.payments = await httpService.getPayments();
    return this.payments;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
            child: FutureBuilder(
                future: getPayments(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: [
                            DataColumn(
                                label: Text('Detalles'),
                                tooltip: ''),
                            DataColumn(
                                label: Text('Cantidad'),
                                tooltip: ''),
                            DataColumn(
                                label: Text('Fecha'),
                                tooltip: ''),
                          ],
                          rows: this
                              .payments
                              .map((data) => DataRow(cells: [
                                    DataCell(Text(data.paymentDetail)),
                                    DataCell(Text(data.totalAmmount.toString())),
                                    DataCell(Text(data.date.toString())),
                                  ]))
                              .toList(),
                        ),
                      ),
                    );
                  }
                })));
  }
}
