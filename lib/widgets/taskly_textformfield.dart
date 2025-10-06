import 'package:flutter/material.dart';
import 'package:taskly/utils/constants/constants.dart';

class TasklyTextformfield extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;

  const TasklyTextformfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: SizeConstants.s24, vertical: SizeConstants.s12),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.primary)),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(SizeConstants.s12),
          ),
          hintText: hintText,
          errorStyle: const TextStyle(color: ColorConstants.red),
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
