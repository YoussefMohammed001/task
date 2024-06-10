
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/model/invoice_details_model.dart';
import 'package:task/features/invoice_details/manager/invoice_details_cubit.dart';

class InvoiceDetailsScreen extends StatefulWidget {
  InvoiceDetailsScreen({super.key, required this.invoiceDetailsModel});
final InvoiceDetailsModel invoiceDetailsModel;

  @override
  State<InvoiceDetailsScreen> createState() => _InvoiceDetailsScreenState();
}

class _InvoiceDetailsScreenState extends State<InvoiceDetailsScreen> {
  final cubit = InvoiceDetailsCubit();
  @override
  void initState() {
    cubit.unitNoController = TextEditingController(text: widget.invoiceDetailsModel.unitNo);
    cubit.priceController = TextEditingController(text: widget.invoiceDetailsModel.price);
    cubit.nameController = TextEditingController(text: widget.invoiceDetailsModel.name);
    cubit.quantityController = TextEditingController(text: widget.invoiceDetailsModel.quantity);
    cubit.totalController = TextEditingController(text: widget.invoiceDetailsModel.total);
    cubit.expireDateController = TextEditingController(text: widget.invoiceDetailsModel.expireDate);


    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocListener<InvoiceDetailsCubit, InvoiceDetailsState>(
        listener: (context, state) {
          if (state is AddInvoiceDetailsLoading ||state is UpdateInvoiceDetailsLoading || state is DeleteInvoiceDetailsLoading) {
            showDialog(
              context: context,
              builder: (context) =>  const AlertDialog(
                contentPadding: EdgeInsets.all(20),
                alignment:  AlignmentDirectional.center,
                actions: [CircularProgressIndicator()],
              ),

            );
          }
          if (state is AddInvoiceDetailsSuccess || state is UpdateInvoiceDetailsSuccess || state is DeleteInvoiceDetailsSuccess) {
            Navigator.pop(context);
            Navigator.pop(context);
          }

          if (state is AddInvoiceDetailsFailure ) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }        if (state is DeleteInvoiceDetailsFailure ) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
          if (state is UpdateInvoiceDetailsFailure ) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(),
          body: Form(
            key: cubit.formKey,
            child: ListView(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black,
                    )),
                    child: Column(
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(
                                color: Colors.black,
                              )),
                          child: const Text(
                            "Invoice Details page",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text("Product Name"),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return "required";
                                        }
                                        return null;
                                      },
                                      controller: cubit.nameController,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          border: OutlineInputBorder()),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  const Text("Unti No."),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
    if(value!.isEmpty){
    return "required";
    }
    return null;

                                      },
                                      controller: cubit.unitNoController,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          border: OutlineInputBorder()),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  const Text("Price"),
                                  const SizedBox(width: 10,),

                                  Expanded(

                                    child: TextFormField(
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return "required";
                                        }
                                        return null;

                                      },
                                    controller: cubit.priceController,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          border: OutlineInputBorder()),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  const Text("Quantity"),
                                  const SizedBox(width: 10,),

                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return "required";
                                        }
                                        return null;

                                      },
                                      controller: cubit.quantityController,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                          border: OutlineInputBorder()),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10,),

                              Row(
                                children: [
                                  const Text("Total"),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if(value!.isEmpty){
                                          return "required";
                                        }
                                        return null;

                                      },
                                      controller: cubit.totalController,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          border: OutlineInputBorder()),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  const Text("Expiry Date"),
                                  const SizedBox(width: 10,),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030)).then((value) {
                                          cubit.expireDateController.text = "${value!.year} - ${value.month} - ${value.day}";
                                          if (kDebugMode) {
                                            print(value);
                                          }
                                        });
                                      },
                                      child: TextFormField(
                                        validator: (value) {
                                          if(value!.isEmpty){
                                            return "required";
                                          }
                                          return null;

                                        },
                                        enabled: false,
                                        controller: cubit.expireDateController,
                                        decoration: const InputDecoration(
                                            contentPadding:
                                                EdgeInsets.symmetric(vertical: 5),
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:  WidgetStateProperty.all(Colors.blue),

                                      ),
                                      onPressed: () {
                                        if(cubit.formKey.currentState!.validate()){
                                          cubit.addNew();

                                        }
                                      },
                                      child: const Text("New",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                  const SizedBox(width: 10,),
                                  ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:  WidgetStateProperty.all(Colors.blue),

                                      ),
                                      onPressed: () {
    if(cubit.formKey.currentState!.validate()) {
      if(widget.invoiceDetailsModel.id.isNotEmpty){
        cubit.updateNew(id: widget.invoiceDetailsModel.id);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("invalid"),
          ),
        );

      }
    }
                                      },
                                      child: const Text("Save",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                  const SizedBox(width: 10,),
                                  ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:  WidgetStateProperty.all(Colors.blue),

                                    ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Back",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )),
                                  const SizedBox(width: 10,),
                                  ElevatedButton(
                                    style:  ButtonStyle(
                                      backgroundColor:  WidgetStateProperty.all(Colors.red),
                                    ),
                                      onPressed: () {
    if(cubit.formKey.currentState!.validate()) {
      if(widget.invoiceDetailsModel.id.isNotEmpty){
        cubit.deleteNew(id: widget.invoiceDetailsModel.id);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("invalid"),
          ),
        );

      }

    }
                                      },
                                      child: const Text("Delete",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      )),

                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
