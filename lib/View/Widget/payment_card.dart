import 'package:e_shop/data/models/payment_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PaymentCard extends StatelessWidget {
  final Payment payment;
  final bool isActive;
  final Function onTap;
  const PaymentCard(
      {super.key,
      required this.payment,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Ink(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Image.asset(
                payment.asset,
                width: 40,
                height: 50,
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: isActive
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      )
                    : const SizedBox()),
          ],
        ),
      ),
    );
  }
}
