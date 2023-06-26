
import 'package:fallora/flutter_flow/form_field_controller.dart';
import 'package:fallora/res/color.res.dart';
import 'package:flutter/material.dart';


class FalloraDropDownWidget<T> extends StatefulWidget {
  const FalloraDropDownWidget({
    required this.controller,
    this.hintText,
    required this.options,
    this.optionLabels,
    required this.onChanged,
    this.icon,
    this.width,
    this.height = 60,
    required this.textStyle,
    this.elevation = 2.0,
    this.borderWidth = 0.0,
    required this.margin,
  });

  final FormFieldController<T> controller;
  final String? hintText;
  final List<T> options;
  final List<String>? optionLabels;
  final Function(T?) onChanged;
  final Widget? icon;
  final double? width;
  final double? height;
  final TextStyle textStyle;
  final double elevation;
  final double borderWidth;
  final EdgeInsetsGeometry margin;

  @override
  State<FalloraDropDownWidget<T>> createState() => _FalloraDropDownWidgetState<T>();
}

class _FalloraDropDownWidgetState<T> extends State<FalloraDropDownWidget<T>> {
  Color get fillColor => AppColors.white;
  void Function() get listener =>
      () => widget.onChanged(widget.controller.value);

  @override
  void initState() {
    widget.controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(listener);
    super.dispose();
  }

  OutlineInputBorder get focusedBorder => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Color(0xFF004ECB), width: 1));

  OutlineInputBorder get normalBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      );

  @override
  Widget build(BuildContext context) {
    final value = widget.options.contains(widget.controller.value)
        ? widget.controller.value
        : null;
    final items = widget.options
        .asMap()
        .entries
        .map(
          (option) => DropdownMenuItem<T>(
            value: option.value,
            child: Text(
              widget.optionLabels == null ||
                      widget.optionLabels!.length < option.key + 1
                  ? option.value.toString()
                  : widget.optionLabels![option.key],
              style: widget.textStyle,
            ),
          ),
        )
        .toList();
    final hintText = Text(widget.hintText ?? "", style: widget.textStyle);
    void Function(T?)? onChanged = (value) => widget.controller.value = value; 
    final dropdownWidget = buildNonSearchableDropdown(value, items, onChanged, hintText);
    
    
    final childWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: fillColor,
      ),
      child: Padding(
        padding: widget.margin,
        child: DropdownButtonHideUnderline(child: dropdownWidget)
      ),
    );
    if (widget.height != null || widget.width != null) {
      return Container(
        width: widget.width,
        height: widget.height,
        child: childWidget,
      );
    }
    return childWidget;
  }

  Widget buildNonSearchableDropdown(
    T? value,
    List<DropdownMenuItem<T>>? items,
    void Function(T?)? onChanged,
    Text? hintText,
  ) {
    return DropdownButton<T>(
      value: value,
      hint: hintText,
      items: items,
      elevation: widget.elevation.toInt(),
      onChanged: onChanged,
      icon: widget.icon,
      isExpanded: true,
      dropdownColor: fillColor,
      focusColor: Colors.transparent,
    );
  }
}
