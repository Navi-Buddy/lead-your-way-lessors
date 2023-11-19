import 'package:flutter/material.dart';
import 'package:lyw_lessors/profile/domain/model/user_model.dart';
import 'package:lyw_lessors/shared/services/notifier.dart';
import 'package:lyw_lessors/shared/utils/validations.dart';
import 'package:lyw_lessors/shared/widgets/lyw_rounded_input_field.dart';

class ProfileForm extends StatefulWidget {
  final void Function(User) onSubmit;
  final User? user;
  const ProfileForm({super.key, required this.onSubmit, required this.user});

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController imageDataController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    imageDataController.dispose();
    super.dispose();
  }

  final Validations validations = Validations();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      LywRoundedInputField(
          label: const Text('First name'),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          hintText: widget.user!.userFirstName,
          icon: const Icon(Icons.arrow_right),
          controller: firstNameController),
      LywRoundedInputField(
          label: const Text('Last name'),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          hintText: widget.user!.userLastName,
          icon: const Icon(Icons.arrow_right),
          controller: lastNameController),
      LywRoundedInputField(
          label: const Text('Phone'),
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          hintText: "123456789",
          icon: const Icon(Icons.arrow_right),
          controller: phoneController),
      LywRoundedInputField(
          label: const Text('Profile picture'),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          hintText: "https://www.image.com/image.jpg",
          icon: const Icon(Icons.arrow_right),
          controller: imageDataController),
      const SizedBox(height: 16),
      FilledButton(
          onPressed: () {
            String userFirstName = firstNameController.text;
            String userLastName = lastNameController.text;
            String? userPhone = phoneController.text;
            String? imageData = imageDataController.text;

            if (!validations.isValidName(userFirstName)) {
              sendNotifyMessage(
                  context, "Please enter a first name under 25 characters");
              return;
            }

            if (!validations.isValidName(userLastName)) {
              sendNotifyMessage(
                  context, "Please enter a last name under 25 characters");
              return;
            }

            if(userPhone.isNotEmpty && !validations.isValidNumber(userPhone)) {
              sendNotifyMessage(context, "Please enter a valid phone number");
              return;
            }

            if (userFirstName.isEmpty) {
              userFirstName = widget.user!.userFirstName;
            }

            if (userLastName.isEmpty) {
              userLastName = widget.user!.userLastName;
            }

            if(userPhone.isEmpty){
              userPhone = widget.user!.userPhone;
            }

            if(imageData.isEmpty){
              imageData = widget.user!.imageData;
            }

            widget.onSubmit(User(
                id: widget.user!.id,
                userFirstName: userFirstName,
                userLastName: userLastName,
                userEmail: widget.user!.userEmail,
                userPhone: userPhone,
                imageData: imageData));
          },
          style: FilledButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 252, 150, 82),
              foregroundColor: Colors.white,
              fixedSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              )),
          child: const Text("Save changes"))
    ]);
  }
}
