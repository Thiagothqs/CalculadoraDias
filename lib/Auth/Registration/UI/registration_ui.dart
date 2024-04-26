import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:CalculadoraDias/Components/custom_button.dart';
import 'package:CalculadoraDias/Components/entry_field.dart';
import 'package:CalculadoraDias/Locale/strings_enum.dart';
import 'package:CalculadoraDias/Locale/locale.dart';
import 'registration_interactor.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String? phoneNumber;

  RegistrationUI(this.registrationInteractor, this.phoneNumber);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  TextEditingController _nameController =
      TextEditingController(text: 'Sam Smith');
  TextEditingController _emailController =
      TextEditingController(text: 'samsmith@mail.com');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height + 200,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppBar(),
                        SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            getString(Strings.SIGN_UP_NOW)!,
                            style: theme.textTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 16),
                          child: Text(
                            getString(Strings.ENTER_REQ_INFO)!,
                            style: theme.textTheme.bodyText2!
                                .copyWith(color: theme.hintColor, fontSize: 12),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        Expanded(
                          child: Container(
                            height: 500,
                            color: theme.backgroundColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                EntryField(
                                  label: getString(Strings.ENTER_PHONE),
                                  initialValue: widget.phoneNumber,
                                  readOnly: true,
                                ),
                                EntryField(
                                  controller: _nameController,
                                  label: getString(Strings.FULL_NAME),
                                ),
                                EntryField(
                                  controller: _emailController,
                                  label: getString(Strings.EMAIL_ADD),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    PositionedDirectional(
                      top: 190,
                      start: 24,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: theme.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Icon(Icons.camera_alt,
                            color: theme.backgroundColor),
                      ),
                    )
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              start: 0,
              end: 0,
              child: CustomButton(
                text: getString(Strings.SIGN_UP),
                onTap: () => widget.registrationInteractor
                    .register(_nameController.text, _emailController.text),
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
