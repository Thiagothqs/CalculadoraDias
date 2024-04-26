import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:CalculadoraDias/Assets/assets.dart';
import 'package:CalculadoraDias/Components/custom_button.dart';
import 'package:CalculadoraDias/DrawerPages/app_drawer.dart';
import 'package:CalculadoraDias/Locale/locale.dart';
import 'package:CalculadoraDias/Locale/strings_enum.dart';
import 'package:CalculadoraDias/Routes/page_routes.dart';

class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: AppDrawer(false),
      body: FadedSlideAnimation(
        ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Text(
                context.getString(Strings.AVAILABLE_AMOUNT)!,
                style: theme.textTheme.bodyText2!
                    .copyWith(color: theme.hintColor, fontSize: 13),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '\$ 159.85',
                style: theme.textTheme.headline4,
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: context.getString(Strings.SEND_TO_BANK),
                    color: theme.cardColor,
                    textColor: theme.primaryColor,
                    onTap: () =>
                        Navigator.pushNamed(context, PageRoutes.sendToBankPage),
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: context.getString(Strings.ADD_MONEY),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Text(
                context.getString(Strings.RECENT_TRANS)!,
                style: theme.textTheme.bodyText2!
                    .copyWith(color: theme.hintColor, fontSize: 13),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(bottom: 4.0),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                  tileColor: theme.backgroundColor,
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(Assets.Driver, height: 60, width: 60),
                  ),
                  title: Text(
                    'George Smith',
                    style: theme.textTheme.headline6!.copyWith(
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    'Maruti Suzuki WagonR',
                    style: theme.textTheme.caption!.copyWith(fontSize: 12),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '- \$ 85.00',
                        style: theme.textTheme.headline6!
                            .copyWith(color: Colors.red, fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        context.getString(Strings.RIDE_INFO)! + '  >',
                        style: theme.textTheme.caption!
                            .copyWith(color: theme.primaryColor, fontSize: 12),
                      ),
                    ],
                  ),
                  onTap: () =>
                      Navigator.pushNamed(context, PageRoutes.rideInfoPage),
                ),
              ),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
