import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:loan_calculator/src/data/datasources/local/loan/loan_local_data_source.dart';

import '../../../core/exceptions/network/network_exception.dart';
import '../../../domain/entities/export_entities.dart';
import '../../../domain/repositories/export_repositories.dart';
import '../../datasources/export_datasources.dart';
import '../../models/export_models.dart';

class LoanRepositoryImpl implements LoanRepository {
  final LoanRemoteDataSource _loanRemoteDataSource;
  final LoanLocalDataSource _loanLocalDataSource;

  LoanRepositoryImpl(this._loanRemoteDataSource, this._loanLocalDataSource);

  //* REMOTE
  @override
  Future<Either<NetworkException, void>> sendLoanDetail({
    required LoanDetailEntity loanDetailEntity,
  }) async {
    try {
      final loanDetailModel = LoanDetailModel().fromEntity(loanDetailEntity);
      await _loanRemoteDataSource.sendLoanDetail(
          loanDetailModel: loanDetailModel
      );
      return const Right(null);
    } on DioException catch (e) {
      return Left(NetworkException.fromDioError(e));
    }
  }

  //* LOCAL
  @override
  LoanDetailEntity? getLastLoanDetail() =>
      _loanLocalDataSource.getLastLoanDetail()?.toEntity();

  @override
  Future<void> saveLastLoanDetail(LoanDetailEntity loanDetailEntity) async {
    final model = LoanDetailModel(
      amount: loanDetailEntity.amount,
      period: loanDetailEntity.period,
      totalRepayment: loanDetailEntity.totalRepayment
    );

    await _loanLocalDataSource.saveLastLoanDetail(model);
  }
}