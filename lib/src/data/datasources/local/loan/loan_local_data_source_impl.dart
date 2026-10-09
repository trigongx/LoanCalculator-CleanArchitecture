import 'package:loan_calculator/src/core/storage/shared_preferences_service.dart';
import 'package:loan_calculator/src/data/datasources/local/loan/loan_local_data_source.dart';
import 'package:loan_calculator/src/data/models/loan_detail/loan_detail_model.dart';
import 'dart:convert';

class LoanLocalDataSourceImpl implements LoanLocalDataSource {
  const LoanLocalDataSourceImpl(this._storage);

  final SharedPreferencesService _storage;
  static const String _lastLoanKey = 'last_loan_detail';

  @override
  LoanDetailModel? getLastLoanDetail() {
    final jsonString = _storage.getString(_lastLoanKey);

    if (jsonString == null) {
      return null;
    }
    return LoanDetailModel.fromJson(
      jsonDecode(jsonString) as Map<String, dynamic>,
    );
  }

  @override
  Future<void> saveLastLoanDetail(LoanDetailModel loanDetailModel) async {
    await _storage.setString(_lastLoanKey, jsonEncode(loanDetailModel.toJson()));
  }

}