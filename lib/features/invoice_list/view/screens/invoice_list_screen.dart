import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/invoice_details/view/screens/invoice_details_screen.dart';
import 'package:task/features/invoice_list/manager/invoice_list_cubit.dart';

class InvoiceListScreen extends StatefulWidget {
 const InvoiceListScreen({super.key});

  @override
  State<InvoiceListScreen> createState() => _InvoiceListScreenState();
}

class _InvoiceListScreenState extends State<InvoiceListScreen> {
  final cubit = InvoiceListCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit..getList(),
      child: BlocBuilder<InvoiceListCubit, InvoiceListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Container(
              margin: const EdgeInsets.all(17),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.blue
                    ),
                    child: const Text("Invoice List Form",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.blue
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text("Line No.",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),
                        Expanded(
                          child: Text("Unit No.",

                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),
                        Expanded(
                          child: Text("Name",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),
                        Expanded(
                          child: Text("Price",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),
                        Expanded(
                          child: Text("Quantity",
                          style: TextStyle(
                            color: Colors.white
                          ),
                          ),
                        ),
                        Expanded(
                          child: Text("Total",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text("Expire Date",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text("View",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: cubit.invoiceList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: (index+1) % 2 == 0 ? Colors.white : Colors.blue.shade200,
                          ),
                          child: Row(
                            mainAxisAlignment:  MainAxisAlignment.center,
                            children: [
                              Expanded(child: Text("${int.parse(index.toString()) + 1}")),
                              Expanded(child: Text(cubit.invoiceList[index].name)),
                              Expanded(child: Text(cubit.invoiceList[index].unitNo)),

                              Expanded(child: Text(cubit.invoiceList[index].price)),

                              Expanded(child: Text(cubit.invoiceList[index].quantity)),

                              Expanded(child: Text(cubit.invoiceList[index].total)),
                              Expanded(child: Text(cubit.invoiceList[index].expireDate,

                              )),


                              ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceDetailsScreen(invoiceDetailsModel: cubit.invoiceList[index],),));
                              }, child: const Text("Details"))
                            ],
                          ),
                        );
                      },),
                  )
                ],

              ),
            ),
          );
        },
      ),
    );
  }
}
