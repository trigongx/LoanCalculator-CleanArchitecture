import 'package:loan_calculator/src/core/network/dio_client.dart';
import 'package:loan_calculator/src/data/datasources/export_datasources.dart';
import 'package:loan_calculator/src/data/datasources/local/loan/loan_local_data_source.dart';
import 'package:loan_calculator/src/domain/repositories/export_repositories.dart';
import 'package:loan_calculator/src/domain/use_cases/export_use_cases.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  DioClient,
  LoanRemoteDataSource,
  LoanLocalDataSource,
  LoanRepository,
  LoanUseCases,
])
void main() {}