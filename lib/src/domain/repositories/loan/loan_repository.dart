import 'package:fpdart/fpdart.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../entities/export_entities.dart';

abstract class LoanRepository {
  //* Remote Data Source
  Future<Either<NetworkException, void>> sendLoanDetail({required LoanDetailEntity loanDetailEntity});

  //* Local Data Source
  Future<void> saveLastLoanDetail(LoanDetailEntity loanDetailEntity);
  LoanDetailEntity? getLastLoanDetail();

}