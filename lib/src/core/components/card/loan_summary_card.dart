import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_calculator/src/core/components/card/summary_row.dart';
import 'package:intl/intl.dart';

class LoanSummaryCard extends StatelessWidget {
  const LoanSummaryCard({
    super.key,
    required this.totalRepayment,
    required this._rate,
    required this.term,
  });

  final double totalRepayment;
  final int _rate;
  final int term;

  double _calculateTotalRepayment(double amount) =>
      amount + (amount * (_rate / 100));

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleSmall;
    DateTime now = DateTime.now();
    DateTime returnDate = now.add(Duration(days: term));
    DateFormat formatter = DateFormat("dd.MM.yyyy");
    String formattedReturnDate = formatter.format(returnDate);
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsGeometry.all(8),
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onSurface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          SummaryRow(
            title: "Total repayment",
            value: "${totalRepayment.toStringAsFixed(0)} \$",
            valueStyle: textStyle,
          ),
          12.verticalSpace,
          SummaryRow(
            title: "Rate",
            value: "${_rate.toStringAsFixed(0)} %",
            valueStyle: textStyle,
          ),
          12.verticalSpace,
          SummaryRow(
            title: "Return date",
            value: formattedReturnDate,
            valueStyle: textStyle,
          ),
        ],
      ),
    );
  }
}
