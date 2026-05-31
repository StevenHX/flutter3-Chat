import 'package:flutter/material.dart';
import 'center_selector.dart';

class ValueSlider extends StatefulWidget {
  final double initialValue;
  final double minValue;
  final double maxValue;
  final ValueChanged<double> onChanged;

  const ValueSlider({
    super.key,
    required this.initialValue,
    required this.minValue,
    required this.maxValue,
    required this.onChanged,
  });

  @override
  State<ValueSlider> createState() => _ValueSliderState();
}

class _ValueSliderState extends State<ValueSlider> {
  late final ScrollController _scrollController;
  late double _currentValue;
  static const double _itemWidth = 10;
  bool _hasInitialized = false;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!mounted) return;
    final screenCenter = MediaQuery.of(context).size.width / 2;
    final scrollOffset = _scrollController.offset + screenCenter;
    final index = (scrollOffset / _itemWidth).round();
    final newValue = (widget.minValue + index).clamp(widget.minValue, widget.maxValue).toDouble();
    if (newValue != _currentValue) {
      setState(() => _currentValue = newValue);
      widget.onChanged(newValue);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasInitialized) {
      _hasInitialized = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          final screenCenter = MediaQuery.of(context).size.width / 2;
          final index = widget.initialValue - widget.minValue;
          _scrollController.jumpTo(
            (index * _itemWidth) - screenCenter,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      child: Stack(
        alignment: Alignment.center,
        children: [
          _ScaleList(
            controller: _scrollController,
            minValue: widget.minValue,
            maxValue: widget.maxValue,
          ),
          const CenterSelector(),
          Positioned(
            bottom: 0,
            left: 32,
            right: 32,
            child: _ValueLabels(currentValue: _currentValue),
          ),
        ],
      ),
    );
  }
}

class _ScaleList extends StatelessWidget {
  final ScrollController controller;
  final double minValue;
  final double maxValue;

  const _ScaleList({
    required this.controller,
    required this.minValue,
    required this.maxValue,
  });

  static const double _itemWidth = 10;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 2,
      ),
      itemCount: (maxValue - minValue).toInt() + 1,
      itemBuilder: (context, index) {
        final isMajorMark = index % 5 == 0;
        return SizedBox(
          width: _itemWidth,
          child: Center(
            child: Container(
              width: isMajorMark ? 4 : 2,
              height: isMajorMark ? 56 : 24,
              decoration: BoxDecoration(
                color: isMajorMark
                    ? const Color(0xFFBABBBE)
                    : const Color(0xFFD7D8D9),
                borderRadius: BorderRadius.circular(isMajorMark ? 1.5 : 0.75),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ValueLabels extends StatelessWidget {
  final double currentValue;

  const _ValueLabels({required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${(currentValue - 1).round()}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF676C75),
          ),
        ),
        Text(
          '${(currentValue + 1).round()}',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF676C75),
          ),
        ),
      ],
    );
  }
}
