class GetSavedLoanDetailState {
  const GetSavedLoanDetailState({
    this.loanAmount = 5000,
    this.loanTerm = 7,
    this.isLoading = true,
  });

  final double loanAmount;
  final int loanTerm;
  final bool isLoading;

  GetSavedLoanDetailState copyWith({
    double? loanAmount,
    int? loanTerm,
    bool? isLoading,
  }) {
    return GetSavedLoanDetailState(
      loanAmount: loanAmount ?? this.loanAmount,
      loanTerm: loanTerm ?? this.loanTerm,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
