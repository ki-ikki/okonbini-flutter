import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:okonbini_flutter/provider/register_provider.dart';
import 'package:okonbini_flutter/constant/strings.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as dateTimePicker;

class DataOfBirthField extends ConsumerWidget {
  const DataOfBirthField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateOfBirth = ref.watch(registerDateOfBirthProvider);
    final error = ref.watch(registerDateOfBirthErrorProvider);

    return Form(
      autovalidateMode: AutovalidateMode.always,
      child: GestureDetector(
        onTap: () {
          dateTimePicker.DatePicker.showDatePicker(
            context,
            showTitleActions: true,
            minTime: DateTime(1920, 1, 1),
            maxTime: DateTime.now(),
            onConfirm: (date) {
              ref.read(registerDateOfBirthProvider.notifier).state = date;
              validateUserDateOfBirthInput(ref);
            },
            currentTime: DateTime.now(),
            locale: dateTimePicker.LocaleType.jp,
          );
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: Strings.register.dateOfBirthLabel,
            labelStyle: const TextStyle(
              color: Colors.blue,
            ),
            errorText: error,
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 10,
            ),
            contentPadding: const EdgeInsets.only(left: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 1.0),
              borderRadius: BorderRadius.circular(30),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            dateOfBirth == null
                ? Strings.register.dateOfBirthInputIsEmpty
                : '${dateOfBirth.year}年${dateOfBirth.month}月${dateOfBirth.day}日',
            style: TextStyle(
              color: dateOfBirth == null ? Colors.grey : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
