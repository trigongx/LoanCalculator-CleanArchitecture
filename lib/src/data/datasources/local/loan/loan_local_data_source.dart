import 'package:loan_calculator/src/data/models/export_models.dart';

abstract interface class LoanLocalDataSource {
  Future<void> saveLastLoanDetail(LoanDetailModel loanDetailModel);

  LoanDetailModel? getLastLoanDetail();
}