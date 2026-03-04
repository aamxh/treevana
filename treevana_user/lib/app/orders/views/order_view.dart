import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treevana_user/app/orders/controllers/order_controller.dart';
import 'package:treevana_user/app/orders/controllers/orders_controller.dart';
import 'package:treevana_user/core/constants.dart';
import 'package:treevana_user/core/helpers.dart';

class OrderView extends StatefulWidget {

  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();

}

class _OrderViewState extends State<OrderView> {

  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _wilayaCtrl = TextEditingController();
  final _quantityCtrl = TextEditingController();
  final _orderCtrl = Get.find<OrderController>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ${_orderCtrl.order.value.product.title}',
            style: theme.textTheme.headlineSmall!.copyWith(
              color: Colors.white,
            ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: size.height * 0.05),
              Center(
                child: Text(
                  'Fill your order details',
                    style: theme.textTheme.titleLarge,
                ),
              ),
              SizedBox(height: size.height * 0.1),
              Text(
                'Your full name',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                style: theme.textTheme.bodyLarge,
                controller: _nameCtrl,
                validator: (val) => val!.isEmpty ? "Enter your full name!" : null,
                decoration: InputDecoration(
                  hintText: 'Ex: Mohammed Alsayed Ahmed',
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
              SizedBox(height: size.height * 0.01),
              Text(
                'Your phone',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                style: theme.textTheme.bodyLarge,
                controller: _phoneCtrl,
                keyboardType: TextInputType.phone,
                validator: (val) => MyHelpers.validatePhone(val!),
                decoration: InputDecoration(
                  hintText: 'Ex: 0655163532',
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
              SizedBox(height: size.height * 0.01),
              Text(
                'Your Wilaya',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                style: theme.textTheme.bodyLarge,
                controller: _wilayaCtrl,
                validator: (val) => val!.isEmpty ? "Enter your wilaya!" : null,
                decoration: InputDecoration(
                  hintText: 'Ex: Algiers',
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
              SizedBox(height: size.height * 0.01),
              Text(
                'Quantity',
                style: theme.textTheme.bodyLarge,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                style: theme.textTheme.bodyLarge,
                keyboardType: TextInputType.number,
                controller: _quantityCtrl,
                validator: (val) => val!.isEmpty || int.parse(val) < 1
                    ? "Quantity must be a positive number"
                    : null,
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
              SizedBox(height: size.height * 0.1),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _orderCtrl.order.value = _orderCtrl.copyWith(
                        phone: _phoneCtrl.text.trim(),
                        wilaya: _wilayaCtrl.text.trim(),
                        quantity: int.parse(_quantityCtrl.text.trim()),
                      );
                      Get.find<OrdersController>().addOrder(_orderCtrl.order.value);
                      MyHelpers.showSuccess("Your order was placed successfully!");
                    }
                  },
                  child: Text('Submit Order',
                      style: theme.textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}