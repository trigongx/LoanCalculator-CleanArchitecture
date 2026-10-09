 part of 'send_loan_detail_cubit.dart';

sealed class SendLoanDetailState extends Equatable {
  const SendLoanDetailState();

  @override
  List<Object?> get props => [];
}

final class SendLoanDetailInitial extends SendLoanDetailState {}

final class SendLoanDetailLoading extends SendLoanDetailState {
  const SendLoanDetailLoading();
}

final class SendLoanDetailSuccess extends SendLoanDetailState {
  const SendLoanDetailSuccess({required this.successMessage});

  final String successMessage;

  @override
  List<Object?> get props => [successMessage];
}

final class SendLoanDetailError extends SendLoanDetailState {
  const SendLoanDetailError({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}