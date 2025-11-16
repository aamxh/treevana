import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_seller/app/products/controllers/add_product_controller.dart';

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
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _titleField(theme),
            _descriptionField(theme, size),
            _quantityField(theme),
            _priceField(theme),
            _pictureField(theme),
            _sellerField(theme),
            SizedBox(height: size.height * 0.03),
            _submitButton(theme, size),
          ],
        ),
      ),
    );
  }

  Widget _titleField(ThemeData theme) {
    return TextField(
      controller: controller.title,
      decoration: InputDecoration(
        labelText: "Title",
        labelStyle: theme.textTheme.bodyLarge,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _descriptionField(ThemeData theme, Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.02),
      child: TextField(
        controller: controller.description,
        maxLines: 4,
        decoration: InputDecoration(
          labelText: "Description",
          labelStyle: theme.textTheme.bodyLarge,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _quantityField(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: controller.quantity,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Quantity",
          labelStyle: theme.textTheme.bodyLarge,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _priceField(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: controller.price,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "Price (DA)",
          labelStyle: theme.textTheme.bodyLarge,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _pictureField(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: controller.picture,
        decoration: InputDecoration(
          labelText: "Picture URL",
          labelStyle: theme.textTheme.bodyLarge,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _sellerField(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: TextField(
        controller: controller.sellerId,
        decoration: InputDecoration(
          labelText: "Seller ID",
          labelStyle: theme.textTheme.bodyLarge,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _submitButton(ThemeData theme, Size size) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.06,
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