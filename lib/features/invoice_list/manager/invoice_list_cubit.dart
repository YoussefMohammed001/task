import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:task/core/model/invoice_details_model.dart';

part 'invoice_list_state.dart';

class InvoiceListCubit extends Cubit<InvoiceListState> {
  InvoiceListCubit() : super(InvoiceListInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<InvoiceDetailsModel> invoiceList = [];


  getList() {
    emit(InvoiceListLoading());
    firestore.collection("invoices").snapshots().listen((event) {
      invoiceList.clear();
      for (var element in event.docs) {
        invoiceList.add(InvoiceDetailsModel.fromJson(element.data()));
      }
      emit(InvoiceListSuccess());
    }).onError((onError) {
      emit(InvoiceListFailure());
    });
  }
}
