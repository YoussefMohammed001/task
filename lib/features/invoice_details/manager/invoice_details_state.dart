part of 'invoice_details_cubit.dart';

@immutable
sealed class InvoiceDetailsState {}

final class InvoiceDetailsInitial extends InvoiceDetailsState {}
final class AddInvoiceDetailsLoading extends InvoiceDetailsState {}
final class AddInvoiceDetailsSuccess extends InvoiceDetailsState {}
final class AddInvoiceDetailsFailure extends InvoiceDetailsState {

  final String error;

  AddInvoiceDetailsFailure(this.error);
}



final class UpdateInvoiceDetailsLoading extends InvoiceDetailsState {}
final class UpdateInvoiceDetailsSuccess extends InvoiceDetailsState {}
final class UpdateInvoiceDetailsFailure extends InvoiceDetailsState {

  final String error;

  UpdateInvoiceDetailsFailure(this.error);
}

final class DeleteInvoiceDetailsLoading extends InvoiceDetailsState {}
final class DeleteInvoiceDetailsSuccess extends InvoiceDetailsState {}
final class DeleteInvoiceDetailsFailure extends InvoiceDetailsState {
  final String error;

  DeleteInvoiceDetailsFailure(this.error);
}
