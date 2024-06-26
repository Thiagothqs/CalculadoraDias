import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:CalculadoraDias/Components/custom_button.dart';
import 'package:CalculadoraDias/Components/entry_field.dart';
import 'package:CalculadoraDias/DrawerPages/app_drawer.dart';
import 'package:CalculadoraDias/Locale/locale.dart';
import 'package:CalculadoraDias/Locale/strings_enum.dart';

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      drawer: AppDrawer(false),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height+200,
              child: FadedSlideAnimation(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AppBar(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        context.getString(Strings.CONTACT_US)!,
                        style: theme.textTheme.headline4,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      child: Text(
                        context.getString(Strings.LET_US_KNOW)!,
                        style: theme.textTheme.bodyText2!
                            .copyWith(color: theme.hintColor, fontSize: 12),
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            icon: Icons.call,
                            text: context.getString(Strings.CALL_US),
                            color: theme.cardColor,
                            textColor: theme.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: CustomButton(
                            icon: Icons.email,
                            text: context.getString(Strings.EMAIL_US),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        color: theme.backgroundColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(24, 48, 24, 0),
                              child: Text(
                                context.getString(Strings.WRITE_US)!,
                                style: theme.textTheme.headline4,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 12),
                              child: Text(
                                context.getString(Strings.DESC_YOUR_ISSUE)!,
                                style: theme.textTheme.bodyText2!
                                    .copyWith(color: theme.hintColor, fontSize: 12),
                              ),
                            ),
                            SizedBox(height: 20),
                            EntryField(
                              initialValue: 'samsmith@mail.com',
                              label: getString(Strings.YOUR_EMAIL),
                            ),
                            SizedBox(height: 20),
                            EntryField(
                              hint: 'Write your message',
                              controller: _controller,
                              label: getString(Strings.DESC_YOUR_ISSUE),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                beginOffset: Offset(0, 0.3),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              ),
            ),
          ),
          PositionedDirectional(
            start: 0,
            end: 0,
            child: CustomButton(
              text: context.getString(Strings.SUBMIT),
            ),
          ),
        ],
      ),
    );
  }
}
