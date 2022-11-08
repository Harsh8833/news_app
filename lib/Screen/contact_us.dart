import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:news_app/Utils/inpute_validation.dart';

import '../Controller/setting_controller.dart';
import '../Elements/buttons.dart';
import '../Elements/input_field.dart';
import '../Utils/common.dart';
import '../Utils/header_page.dart';
import '../Utils/style.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({Key? key}) : super(key: key);

  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends StateMVC<ContactUS> {
  late SettingController model;

  _ContactUSState() : super(SettingController()) {
    model = controller as SettingController;
  }

  @override
  void initState() {
    super.initState();
    model.getSettings(context);
  }

  @override
  Widget build(BuildContext context) {
    return HeaderPage(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: model.formKey,
          child: Column(
            children: [
              heightSizedBox(20.0),
              // const ReportHeading(heading: "SERVICES"),
              // heightSizedBox(20.0),
              container(Icons.add_reaction, "Address",
                  model.contactDetails.address ?? ''),
              heightSizedBox(15.0),
              container(Icons.call, "Mobile number",
                  model.contactDetails.phone ?? ''),
              heightSizedBox(15.0),
              container(Icons.email_outlined, "Email Address",
                  model.contactDetails.email ?? ''),
              heightSizedBox(20.0),
              Container(
                decoration: boxDecoration.copyWith(
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    EditTextField(
                      validator: validateName,
                      onChanged: (v) => model.contactUs.name = v,
                      hint: 'Your Name',
                    ),
                    heightSizedBox(15.0),
                    EditTextField(
                      validator: validateEmail,
                      onChanged: (v) => model.contactUs.email = v,
                      hint: 'Your Email',
                    ),
                    heightSizedBox(15.0),
                    EditTextField(
                      validator: validateSubject,
                      onChanged: (v) => model.contactUs.subject = v,
                      hint: 'Subject',
                    ),
                    heightSizedBox(15.0),
                    EditTextField(
                      validator: validateMsg,
                      onChanged: (v) => model.contactUs.message = v,
                      maxLines: 5,
                      hint: 'Your Message',
                    ),
                    heightSizedBox(20.0),
                    BigButton(
                      title: 'SUBMIT',
                      onTap: () => model.createContactUs(context),
                    ),
                  ],
                ),
              ),
              heightSizedBox(20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget container(IconData icon, String label, String text) {
    return Container(
      width: double.infinity,
      decoration:
          boxDecoration.copyWith(borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Icon(icon, color: blueColor, size: 60),
          heightSizedBox(10),
          Text(
            label,
            style: TextStyle(fontSize: 20, color: darkGreyColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: darkGreyColor),
            ),
          ),
          heightSizedBox(10.0),
        ],
      ),
    );
  }
}
