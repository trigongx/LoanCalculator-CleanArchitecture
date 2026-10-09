import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loan_calculator/src/domain/use_cases/export_use_cases.dart';
import 'package:loan_calculator/src/presentation/cubit/loan/get_saved_loan_detail/get_saved_loan_detail_state.dart';

class GetSavedLoanDetailCubit extends Cubit<GetSavedLoanDetailState> {
  GetSavedLoanDetailCubit(this._loanUseCases)
    : super(const GetSavedLoanDetailState());

  final LoanUseCases _loanUseCases;

  void getSavedLoanDetail() {
    final loanDetail = _loanUseCases.getLastSavedLoanDetail();

    if (loanDetail == null) {
      emit(state.copyWith(isLoading: false));
      return;
    }

    emit(
      state.copyWith(
        loanAmount: loanDetail.amount ?? 5000,
        loanTerm: loanDetail.period ?? 7,
        isLoading: false,
      ),
    );
  }

  void changeLoanAmount(double value) => emit(state.copyWith(loanAmount: value));

  void changeLoanTerm(int value) => emit(state.copyWith(loanTerm: value));
}
