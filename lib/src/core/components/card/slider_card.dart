import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_calculator/src/core/components/card//model/slider_type.dart';

class SliderCard extends StatefulWidget {
  const SliderCard({
    super.key,
    required this.sliderType,
    required this.initialValue,
    this.onChanged,
  });

  final SliderType sliderType;
  final double initialValue;
  final ValueChanged<double>? onChanged;

  @override
  State<StatefulWidget> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  late double _currentSliderValue;

  double get _minSliderValue {
    return switch (widget.sliderType) {
      SliderType.dynamic => 5000.00,
      SliderType.static => 7,
    };
  }

  double get _maxSliderValue {
    return switch (widget.sliderType) {
      SliderType.dynamic => 50000.00,
      SliderType.static => 28,
    };
  }

  int? get _sliderDivisions {
    return switch (widget.sliderType) {
      SliderType.dynamic => null,
      SliderType.static => 3,
    };
  }

  String get _title {
    return switch (widget.sliderType) {
      SliderType.dynamic => 'Loan amount',
      SliderType.static => 'Loan term',
    };
  }

  String get _valueText {
    return switch (widget.sliderType) {
      SliderType.dynamic => '${_currentSliderValue.round()} \$',
      SliderType.static => '${_currentSliderValue.round()} Days',
    };
  }

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue;
  }

  //SliderType.dynamic => 5000.00,
  //       SliderType.static => 7,

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsetsGeometry.all(8),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: colors.onSurface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_title, style: Theme.of(context).textTheme.titleSmall),
          6.verticalSpace,
          Text(_valueText, style: Theme.of(context).textTheme.bodySmall),
          6.verticalSpace,
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 8.h,
              activeTrackColor: colors.primary,
              inactiveTrackColor: colors.surfaceContainerHighest,

              thumbColor: colors.surface,
              overlayColor: colors.primary.withValues(alpha: 0.12),

              trackShape: const RoundedRectSliderTrackShape(),
            ),
            child: Slider(
              value: _currentSliderValue,
              min: _minSliderValue,
              max: _maxSliderValue,
              divisions: _sliderDivisions,
              onChanged: (value) {
                setState(() {
                  _currentSliderValue = value;
                });

                widget.onChanged?.call(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
