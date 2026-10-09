import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:loan_calculator/src/core/exceptions/network/network_exception.dart';
import 'package:loan_calculator/src/domain/entities/export_entities.dart';
import 'package:loan_calculator/src/domain/use_cases/export_use_cases.dart';
import 'package:loan_calculator/src/presentation/cubit/loan/send_loan_detail/send_loan_detail_cubit.dart';
import 'package:mockito/mockito.dart';

import '../../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late final LoanUseCases mockLoanUseCases;

  late final LoanDetailEntity loanDetail;

  setUpAll(() {
    mockLoanUseCases = MockLoanUseCases();

    loanDetail = const LoanDetailEntity(
      amount: 5000,
      period: 7,
      totalRepayment: 5750,
    );
  });

  blocTest<SendLoanDetailCubit, SendLoanDetailState>(
    'emits [Loading, Success] when loan details are sent successfully',
    build: () {
      provideDummy<Either<NetworkException, void>>(Right(null));

      when(mockLoanUseCases.sendLoanDetails(loanDetailEntity: loanDetail))
          .thenAnswer((_) async => const Right(null));

      return SendLoanDetailCubit(mockLoanUseCases);
    },
    act: (cubit) => cubit.sendLoanDetail(loanDetailEntity: loanDetail),
    expect: () => [
      const SendLoanDetailLoading(),
      const SendLoanDetailSuccess(
        successMessage: 'Loan details sent successfully',
      ),
    ],
    verify: (_) {
      verify(mockLoanUseCases.sendLoanDetails(loanDetailEntity: loanDetail))
          .called(1);
    },
  );

  blocTest<SendLoanDetailCubit, SendLoanDetailState>(
    'emits [Loading, Error] when sending loan details when network error',
    build: () {
      provideDummy<Either<NetworkException, void>>(Right(null));

      final exception = NetworkException.fromDioError(
        DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.connectionError,
        ),
      );

      when(mockLoanUseCases.sendLoanDetails(loanDetailEntity: loanDetail))
          .thenAnswer((_) async => Left(exception));

      return SendLoanDetailCubit(mockLoanUseCases);
    },
    act: (cubit) => cubit.sendLoanDetail(loanDetailEntity: loanDetail),
    expect: () => [
      const SendLoanDetailLoading(),
      const SendLoanDetailError(message: 'Unexpected error occurred'),
    ],
    verify: (_) {
      verify(mockLoanUseCases.sendLoanDetails(loanDetailEntity: loanDetail))
          .called(1);
    },
  );
}
