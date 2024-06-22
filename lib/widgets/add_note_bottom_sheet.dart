import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32),
              CustomTextField(hint: 'Title'),
              SizedBox(height: 16),
              CustomTextField(hint: 'Content', maxLines: 5),
              SizedBox(height: 16),
              CustomButton(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
