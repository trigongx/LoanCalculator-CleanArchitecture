import '../../../models/loan_detail/loan_detail_model.dart';

/// Abstract class that defines the methods for fetching popular and top rated movies from a remote data source.
abstract class LoanRemoteDataSource {
  /// Post a loan request from the remote data source.
  Future<void> sendLoanDetail({required LoanDetailModel loanDetailModel});
}