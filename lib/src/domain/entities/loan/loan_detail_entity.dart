import 'package:equatable/equatable.dart';

class LoanDetailEntity extends Equatable {
  final double? amount;
  final int? period;
  final double? totalRepayment;

  const LoanDetailEntity({this.amount, this.period, this.totalRepayment});

  @override
  List<Object?> get props {
    return [
      amount,
      period,
      totalRepayment
    ];
  }
}