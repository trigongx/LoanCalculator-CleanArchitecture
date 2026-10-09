import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../entities/export_entities.dart';
import '../../repositories/loan/loan_repository.dart';

class LoanUseCases {
  final LoanRepository _loanRepository;
  const LoanUseCases(this._loanRepository);

  //* REMOTE
  /// This method send loan details to remote data source.
  Future<Either<NetworkException, void>> sendLoanDetails({required LoanDetailEntity loanDetailEntity}) async {
    return _loanRepository.sendLoanDetail(loanDetailEntity: loanDetailEntity);
  }

  //* LOCAL
  /// This method save loan details to local data source.
  Future<void> saveLastLoanDetail(LoanDetailEntity loanDetailEntity) async {
    return _loanRepository.saveLastLoanDetail(loanDetailEntity);
  }

  /// This method get last saved loan details from local data source.
  LoanDetailEntity? getLastSavedLoanDetail() => _loanRepository.getLastLoanDetail();
}