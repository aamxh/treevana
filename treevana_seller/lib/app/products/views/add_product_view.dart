import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_seller/app/products/controllers/add_product_controller.dart';
import 'package:treevana_seller/core/constants.dart';

class AddProductView extends StatelessWidget {

  AddProductView({super.key});

  final controller = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Product",
          style: theme.textTheme.headlineSmall?.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(size.width * 0.1),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03,),
              _titleField(theme, size),
              SizedBox(height: size.height * 0.03,),
              _descriptionField(theme, size),
              SizedBox(height: size.height * 0.03,),
              _quantityField(theme, size),
              SizedBox(height: size.height * 0.03,),
              _priceField(theme, size),
              //SizedBox(height: size.height * 0.03),
              //_avatarField(theme, size),
              SizedBox(height: size.height * 0.06),
              _submitButton(theme, size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleField(ThemeData theme, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Title',
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: size.height * 0.01,),
        TextFormField(
          style: theme.textTheme.bodyLarge,
          controller: controller.title,
          validator: (val) => val!.isEmpty ? "Title field cannot be empty!" : null,
          decoration: InputDecoration(
            hintText: 'Ex: Oak sapling',
            hintStyle: theme.textTheme.bodyLarge!.copyWith(
              color: MyConstants.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyConstants.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _descriptionField(ThemeData theme, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description (optional)',
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: size.height * 0.01,),
        TextFormField(
          style: theme.textTheme.bodyLarge,
          controller: controller.description,
          decoration: InputDecoration(
            hintText: 'Some description can go here..',
            hintStyle: theme.textTheme.bodyLarge!.copyWith(
              color: MyConstants.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyConstants.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _quantityField(ThemeData theme, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quantity',
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: size.height * 0.01,),
        TextFormField(
          style: theme.textTheme.bodyLarge,
          controller: controller.quantity,
          keyboardType: TextInputType.number,
          validator: (val) => val!.isEmpty ? "Quantity field cannot be empty!" : null,
          decoration: InputDecoration(
            hintText: 'Ex: 2',
            hintStyle: theme.textTheme.bodyLarge!.copyWith(
              color: MyConstants.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyConstants.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _priceField(ThemeData theme, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price',
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: size.height * 0.01,),
        TextFormField(
          style: theme.textTheme.bodyLarge,
          controller: controller.price,
          keyboardType: TextInputType.number,
          validator: (val) => val!.isEmpty ? "Price field cannot be empty!" : null,
          decoration: InputDecoration(
            hintText: 'Ex: 20\$',
            hintStyle: theme.textTheme.bodyLarge!.copyWith(
              color: MyConstants.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: MyConstants.primaryColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _avatarField(ThemeData theme, Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Picture (optional)',
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: size.height * 0.01,),

      ],
    );
  }

  Widget _submitButton(ThemeData theme, Size size) {
    return SizedBox(
      width: size.width * 0.5,
      height: size.height * 0.064,
      child: ElevatedButton(
        onPressed: controller.addProduct,
        child: Text(
          "Add Product",
          style: theme.textTheme.titleMedium?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

}