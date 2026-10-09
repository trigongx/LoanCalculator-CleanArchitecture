// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loan_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoanDetailModel _$LoanDetailModelFromJson(Map<String, dynamic> json) =>
    LoanDetailModel(
      amount: (json['amount'] as num?)?.toDouble(),
      period: (json['period'] as num?)?.toInt(),
      totalRepayment: (json['total_repayment'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LoanDetailModelToJson(LoanDetailModel instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'period': instance.period,
      'total_repayment': instance.totalRepayment,
    };
