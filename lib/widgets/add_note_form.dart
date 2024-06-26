import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/cubits/Add%20note%20cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/color_item_list_view.dart';
import 'package:notes_app/widgets/custom_button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CustomTextFormField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hint: 'Content',
            maxLines: 8,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(height: 16),
          const ColorsListView(),
          const SizedBox(height: 16),
          BlocBuilder<AddNoteCubit, AddNoteStates>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  onTapMethod(context);
                },
              );
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void onTapMethod(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      var currentDate = DateTime.now();
      var formatedCurrentDate = DateFormat.yMd().format(currentDate);

      NoteModel noteModel = NoteModel(
        title: title!,
        subTitle: subTitle!,
        date: formatedCurrentDate,
        color: kPrimaryColor.value,
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
