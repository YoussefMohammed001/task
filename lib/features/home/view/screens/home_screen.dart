import 'package:flutter/material.dart';
import 'package:task/core/model/invoice_details_model.dart';
import 'package:task/features/invoice_details/view/screens/invoice_details_screen.dart';
import 'package:task/features/invoice_list/view/screens/invoice_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                border:  Border.all(
                  color: Colors.black,
                )
              ),
             child: const Text("Home Screen",
             style: TextStyle(
               color: Colors.white,
             ),
             ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceDetailsScreen(invoiceDetailsModel:
              InvoiceDetailsModel(id: "", name: "", unitNo: "", price: "", quantity: "", total: "", expireDate: ""),),));
            }, child:const Text("Invoice details")),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceListScreen(),));
            }, child:const Text("Invoice list"))

          ],
        ),
      ),
    );
  }
}
