import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/entities/export_entities.dart';
import '../../../../domain/use_cases/export_use_cases.dart';

part 'send_loan_detail_state.dart';

class SendLoanDetailCubit extends Cubit<SendLoanDetailState> {
  SendLoanDetailCubit(this._loanUseCases) : super(SendLoanDetailInitial());

  final LoanUseCases _loanUseCases;

  Future<void> sendLoanDetail({
    required LoanDetailEntity loanDetailEntity,
  }) async {
    try {
      emit(const SendLoanDetailLoading());

      final result = await _loanUseCases.sendLoanDetails(
        loanDetailEntity: loanDetailEntity,
      );

      result.fold(
        (error) => emit(SendLoanDetailError(message: error.message)),
        (success) async {
          await _loanUseCases.saveLastLoanDetail(loanDetailEntity);

          emit(
            SendLoanDetailSuccess(
              successMessage: "Loan details sent successfully",
            ),
          );

        },
      );
    } catch (_) {
      rethrow;
    }
  }
}
