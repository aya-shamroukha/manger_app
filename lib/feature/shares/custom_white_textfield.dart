import 'package:flutter/material.dart';
import 'package:manger_app/core/resources/app_color.dart';

class WhiteTextField extends StatelessWidget {
  const WhiteTextField({
    super.key, this.maxlens, this.controller,
  });
final int ? maxlens;
 final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxlens,
                        decoration:  InputDecoration(
                          fillColor: AppColor.white,
                          filled: true,
                         focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: AppColor.white),borderRadius: BorderRadius.circular(10)),
                         enabledBorder:  OutlineInputBorder(borderSide: const BorderSide(color: AppColor.white),borderRadius: BorderRadius.circular(10))
                                    
                        ),
                      );
  }
}