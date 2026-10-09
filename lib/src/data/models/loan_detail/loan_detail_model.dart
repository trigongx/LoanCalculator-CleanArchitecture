import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/entities/export_entities.dart';
import '../../datasources/_mappers/entity_convertable.dart';

part 'loan_detail_model.g.dart';

@JsonSerializable()
class LoanDetailModel extends Equatable
    with EntityConvertible<LoanDetailModel, LoanDetailEntity> {
  @JsonKey(name: "amount")
  final double? amount;
  @JsonKey(name: "period")
  final int? period;
  @JsonKey(name: "total_repayment")
  final double? totalRepayment;

  const LoanDetailModel({this.amount, this.period, this.totalRepayment});

  Map<String, dynamic> toJson() => _$LoanDetailModelToJson(this);

  factory LoanDetailModel.fromJson(Map<String, dynamic> json) =>
      _$LoanDetailModelFromJson(json);

  @override
  LoanDetailEntity toEntity() => LoanDetailEntity(
    amount: amount,
    period: period,
    totalRepayment: totalRepayment,
  );

  @override
  LoanDetailModel fromEntity(LoanDetailEntity model) => LoanDetailModel(
    amount: model.amount,
    period: model.period,
    totalRepayment: model.totalRepayment
  );

  @override
  List<Object?> get props => [amount, period, totalRepayment];


}
