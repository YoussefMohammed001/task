part of 'invoice_list_cubit.dart';

@immutable
sealed class InvoiceListState {}

final class InvoiceListInitial extends InvoiceListState {}
final class InvoiceListLoading extends InvoiceListState {}
final class InvoiceListSuccess extends InvoiceListState {}
final class InvoiceListFailure extends InvoiceListState {}
