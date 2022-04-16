import 'package:flutter/material.dart';
import 'package:jaaba/models/suppliers_model.dart';

import '../../../utils/themes.dart';

Widget suppliersWidget(List<Supplier> suppliers) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(
        height: 20.0,
      ),
      suppliers.isNotEmpty
          ? const Padding(
              padding: EdgeInsets.only(
                left: 20.0,
              ),
              child: Text(
                "PickUp",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : const SizedBox.shrink(),
      const SizedBox(
        height: 10.0,
      ),
      ListView.builder(
        itemCount: suppliers.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Row(
            children: [
              const SizedBox(
                width: 20.0,
              ),
              SizedBox(
                width: ScreenSize.width * 0.5,
                child: Text(
                  suppliers[index].supplierName!,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Text(
                "\$${suppliers[index].amount! / 100}",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 25.0,
              ),
            ],
          );
        },
      ),
    ],
  );
}
