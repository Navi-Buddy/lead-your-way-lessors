import 'package:flutter/material.dart';
import 'package:lyw_lessors/bicycles/domain/model/bicycle_model.dart';
import 'package:lyw_lessors/shared/services/notifier.dart';
import 'package:lyw_lessors/shared/utils/validations.dart';
import 'package:lyw_lessors/shared/widgets/lyw_rounded_input_field.dart';

class BicycleForm extends StatefulWidget {
  final void Function(Bicycle) onSubmit;

  const BicycleForm({super.key, required this.onSubmit});

  @override
  State<BicycleForm> createState() => _BicycleFormState();
}

class _BicycleFormState extends State<BicycleForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController imageDataController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    sizeController.dispose();
    modelController.dispose();
    imageDataController.dispose();
    super.dispose();
  }

  final Validations validations = Validations();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LywRoundedInputField(
            label: const Text('Bike name'),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: "Awesome bike",
            icon: const Icon(Icons.arrow_right),
            controller: nameController),
        LywRoundedInputField(
            label: const Text('Description'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            hintText: "This bike is...",
            icon: const Icon(Icons.arrow_right),
            controller: descriptionController),
        LywRoundedInputField(
            label: const Text('Price'),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            hintText: "",
            icon: const Icon(Icons.arrow_right),
            controller: priceController),
        LywRoundedInputField(
            label: const Text('Size'),
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            hintText: "cm.",
            icon: const Icon(Icons.arrow_right),
            controller: sizeController),
        LywRoundedInputField(
            label: const Text('Model'),
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            hintText: "",
            icon: const Icon(Icons.arrow_right),
            controller: modelController),
        LywRoundedInputField(
            label: const Text('Image'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            hintText: "",
            icon: const Icon(Icons.arrow_right),
            controller: imageDataController),
        const SizedBox(height: 16),
        FilledButton(
            onPressed: () {
              final name = nameController.text;
              final description = descriptionController.text;
              final price = priceController.text;
              final size = sizeController.text;
              final model = modelController.text;
              final image = imageDataController.text;

              if (name.isEmpty ||
                  description.isEmpty ||
                  price.isEmpty ||
                  size.isEmpty ||
                  model.isEmpty ||
                  image.isEmpty) {
                sendNotifyMessage(context, "Please fill all the fields.");
                return;
              }
              if (!validations.isValidName(name)) {
                sendNotifyMessage(
                    context, "Please enter a name under 25 characters.");
                return;
              }
              if (!validations.isValidImage(image)) {
                sendNotifyMessage(context, "Please enter a valid image link.");
                return;
              }

              widget.onSubmit(Bicycle(
                  id: 1,
                  bicycleName: name,
                  bicycleDescription: description,
                  bicyclePrice: double.parse(price),
                  bicycleSize: size,
                  bicycleModel: model,
                  imageData: image,
                  latitude: 0,
                  longitude: 0));
            },
            style: FilledButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 252, 150, 82),
              foregroundColor: Colors.white,
              fixedSize: const Size(200, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: const Text("Add bike"))
      ],
    );
  }
}
