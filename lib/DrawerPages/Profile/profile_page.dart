import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:CalculadoraDias/Assets/assets.dart';
import 'package:CalculadoraDias/Components/custom_button.dart';
import 'package:CalculadoraDias/Components/entry_field.dart';
import 'package:CalculadoraDias/Locale/locale.dart';
import 'package:CalculadoraDias/Locale/strings_enum.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
                height: MediaQuery.of(context).size.height+210,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AppBar(),
                        SizedBox(height: 12,),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            getString(Strings.MY_PROFILE)!,
                            style: theme.textTheme.headline4,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                          child: Text(
                            getString(Strings.YOUR_ACCOUNT_DETAILS)!,
                            style: theme.textTheme.bodyText2!
                                .copyWith(color: theme.hintColor, fontSize: 12),
                          ),
                        ),
                        SizedBox(height: 60,),
                        Expanded(
                          child: Container(
                            height: 500,
                            color: theme.backgroundColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Spacer(),
                                EntryField(
                                  label: getString(Strings.ENTER_PHONE),
                                  initialValue: '+91 9876543210',
                                  readOnly: true,
                                  showUnderline: false,
                                ),
                                EntryField(
                                  controller: _nameController,
                                  label: getString(Strings.FULL_NAME),
                                  showUnderline: false,
                                ),
                                EntryField(
                                  controller: _emailController,
                                  label: getString(Strings.EMAIL_ADD),
                                  showUnderline: false,
                                ),
                                Spacer(flex: 3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    PositionedDirectional(
                      top: 200,
                      start: 24,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: theme.hintColor,
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Image.asset(Assets.User),
                      ),
                    ),
                    PositionedDirectional(
                      top: 200,
                      start: 136,
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt,
                            color: theme.primaryColor,
                          ),
                          label: Text(
                            getString(Strings.CHANGE_PIC)!,
                            style: theme.textTheme.caption,
                          )),
                    )
                  ],
                ),
              ),
            ),
            PositionedDirectional(
              start: 0,
              end: 0,
              child: CustomButton(
                text: getString(Strings.UPDATE),
                onTap: () {},
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
