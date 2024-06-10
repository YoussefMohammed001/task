import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:task/core/model/invoice_details_model.dart';

part 'invoice_details_state.dart';

class InvoiceDetailsCubit extends Cubit<InvoiceDetailsState> {
  InvoiceDetailsCubit() : super(InvoiceDetailsInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController unitNoController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  DateTime? dateTime;
  final formKey = GlobalKey<FormState>();

  addNew() {
    emit(AddInvoiceDetailsLoading());
    DateTime dateTime = DateTime.now();
    InvoiceDetailsModel invoiceDetailsModel = InvoiceDetailsModel(
        name: nameController.text,
        unitNo: unitNoController.text,
        price: priceController.text,
        quantity: quantityController.text,
        total: totalController.text,
        expireDate: expireDateController.text, id: dateTime.toString()

    );
    firestore.collection("invoices").doc(dateTime.toString()).set(invoiceDetailsModel.toJson()).then((
        onValue) {
      emit(AddInvoiceDetailsSuccess());
    }).catchError((onError){
      emit(AddInvoiceDetailsFailure(onError.toString()));
    });
  }


  updateNew({required String id}) {
    emit(UpdateInvoiceDetailsLoading());
    DateTime dateTime = DateTime.now();
    InvoiceDetailsModel invoiceDetailsModel = InvoiceDetailsModel(
        name: nameController.text,
        unitNo: unitNoController.text,
        price: priceController.text,
        quantity: quantityController.text,
        total: totalController.text,
        expireDate: expireDateController.text, id: id

    );
    firestore.collection("invoices").doc(id).update(invoiceDetailsModel.toJson()).then((
        onValue) {
      emit(UpdateInvoiceDetailsSuccess());
    }).catchError((onError){
      emit(UpdateInvoiceDetailsFailure(onError.toString()));
    });
  }


  deleteNew({required String id}) {
    emit(DeleteInvoiceDetailsLoading());
    firestore.collection("invoices").doc(id).delete().then((
        onValue) {
      emit(DeleteInvoiceDetailsSuccess());
    }).catchError((onError){
      emit(DeleteInvoiceDetailsFailure(onError.toString()));
    });
  }




}
