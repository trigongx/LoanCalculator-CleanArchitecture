import 'package:flutter_test/flutter_test.dart';
import 'package:loan_calculator/src/core/network/dio_client.dart';
import 'package:loan_calculator/src/data/datasources/export_datasources.dart';

import '../../../_utils/json_reader.dart';
import '../../../_utils/mocks/mocks.mocks.dart';

void main() {
  late DioClient mockDioClient;
  late final LoanRemoteDataSourceImpl loanRemoteDataSource;
  
  late final dynamic loanDetailJson;

  setUpAll(() {
    mockDioClient = MockDioClient();
    loanRemoteDataSource = LoanRemoteDataSourceImpl(mockDioClient);

    loanDetailJson = jsonReader("loan_detail_dummy_data.json");
  });
}