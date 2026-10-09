import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_calculator/src/core/components/button/send_button.dart';
import 'package:loan_calculator/src/core/components/card/loan_summary_card.dart';
import 'package:loan_calculator/src/core/components/card/slider_card.dart';
import 'package:loan_calculator/src/domain/entities/loan/loan_detail_entity.dart';
import 'package:loan_calculator/src/presentation/cubit/loan/get_saved_loan_detail/get_saved_loan_detail_cubit.dart';
import 'package:loan_calculator/src/presentation/cubit/loan/get_saved_loan_detail/get_saved_loan_detail_state.dart';
import 'package:loan_calculator/src/presentation/cubit/loan/send_loan_detail/send_loan_detail_cubit.dart';

import '../../core/theme/cubit/theme_cubit.dart';
import '../../core/components/card//model/slider_type.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  static const int _rate = 15;

  double _calculateTotalRepayment(double amount) =>
      amount + (amount * (_rate / 100));

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendLoanDetailCubit, SendLoanDetailState>(
      listener: (context, state) {
        if (state is SendLoanDetailSuccess) {
          _showAccessDialog(context, state.successMessage);
        }

        if (state is SendLoanDetailError) {
          _showErrorDialog(context, state.message);
        }
      },
      child: BlocBuilder<GetSavedLoanDetailCubit, GetSavedLoanDetailState>(
        builder: (context, getSavedLoanDetailState) {
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            appBar: AppBar(
              title: const Text("Loan Calculator"),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme(
                      brightness: Theme.of(context).brightness,
                    );
                  },
                  icon: Icon(
                    Theme.of(context).brightness == Brightness.dark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                  ),
                ),
              ],
            ),
            body: _buildBody(context, getSavedLoanDetailState),
          );
        },
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    GetSavedLoanDetailState getSavedLoanDetailState,
  ) {
    return BlocBuilder<SendLoanDetailCubit, SendLoanDetailState>(
      builder: (context, sendState) {
        return Stack(
          children: [
            _buildContent(context, getSavedLoanDetailState),

            if (sendState is SendLoanDetailLoading)
              Positioned.fill(
                child: ColoredBox(
                  color: Theme.of(context).colorScheme.scrim
                      .withValues(alpha: 0.3),
                  child: const Center(child: CircularProgressIndicator()),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildContent(
    BuildContext context,
    GetSavedLoanDetailState getSavedLoanDetailState,
  ) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's calculate your comfortable loan conditions",
                  style: Theme.of(context).textTheme.titleLarge,
                ),

                4.verticalSpace,

                Text(
                  "This is a preliminary calculation and does not take "
                  "the refinancing amount into account. if there are loans "
                  "for refinancing, the proposed terms may change.",
                  style: Theme.of(context).textTheme.titleSmall,
                ),

                4.verticalSpace,

                SliderCard(
                  sliderType: SliderType.dynamic,
                  initialValue: getSavedLoanDetailState.loanAmount,
                  onChanged: (value) {
                    context.read<GetSavedLoanDetailCubit>().changeLoanAmount(
                      value,
                    );
                  },
                ),

                8.verticalSpace,

                SliderCard(
                  sliderType: SliderType.static,
                  initialValue: getSavedLoanDetailState.loanTerm.toDouble(),
                  onChanged: (value) {
                    context.read<GetSavedLoanDetailCubit>().changeLoanTerm(
                      value.round(),
                    );
                  },
                ),

                8.verticalSpace,

                LoanSummaryCard(
                  totalRepayment: _calculateTotalRepayment(
                    getSavedLoanDetailState.loanAmount,
                  ),
                  rate: _rate,
                  term: getSavedLoanDetailState.loanTerm,
                ),

                8.verticalSpace,

                SendButton(
                  sendAction: () {
                    final totalRepayment = _calculateTotalRepayment(
                      getSavedLoanDetailState.loanAmount,
                    );

                    final loanDetail = LoanDetailEntity(
                      amount: getSavedLoanDetailState.loanAmount,
                      period: getSavedLoanDetailState.loanTerm,
                      totalRepayment: totalRepayment,
                    );

                    context.read<SendLoanDetailCubit>().sendLoanDetail(
                      loanDetailEntity: loanDetail,
                    );
                  },
                  text: "Submit request",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

void _showAccessDialog(BuildContext context, String successMessage) {
  showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        icon: const Icon(Icons.check_circle_rounded, size: 48),
        title: Text(
          "Request sent success",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          successMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}

void _showErrorDialog(BuildContext context, String errorMessage) {
  showDialog<void>(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        icon: const Icon(Icons.error_rounded, size: 48),
        title: Text(
          "Request not sent",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
            },
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}
