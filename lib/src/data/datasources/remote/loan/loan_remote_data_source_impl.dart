import 'package:loan_calculator/src/core/constants/url_constants.dart';
import 'package:loan_calculator/src/data/models/loan_detail/loan_detail_model.dart';

import '../../../../core/network/dio_client.dart';

import 'loan_remote_data_source.dart';

class LoanRemoteDataSourceImpl implements LoanRemoteDataSource {
  final DioClient _dioClient;

  const LoanRemoteDataSourceImpl(this._dioClient);

  @override
  Future<void> sendLoanDetail({
    required LoanDetailModel loanDetailModel,
  }) async {
    try {
      await _dioClient.post(
        UrlConstants.sendLoanDetail,
        data: loanDetailModel.toJson(),
      );
    } catch (_) {
      rethrow;
    }
  }
}
