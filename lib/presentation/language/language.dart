import 'package:template_mvvm_flutter/app/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:template_mvvm_flutter/app/app_preferences.dart';
import 'package:template_mvvm_flutter/intl/generated/l10n.dart';
import 'package:template_mvvm_flutter/presentation/global_widgets/responsive.dart';
import 'package:template_mvvm_flutter/presentation/resources/assets_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/color_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/language_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/routes_manager.dart';
import 'package:template_mvvm_flutter/presentation/resources/values_manager.dart';

class LanguageView extends StatelessWidget {
  final bool back;

  LanguageView({required this.back, Key? key}) : super(key: key);

  final _s = instance<S>();

  final _appPreferences = instance<AppPreferences>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorManager.primary,
        body: _getContentWidget(context, size));
  }

  Widget _getContentWidget(BuildContext context, Size size) {
    return ResponsiveWid(
      largeScreen: _form(context, size.width * 0.5, size.height),
      smallScreen: _form(context, size.width, size.height),
    );
  }

  Widget _form(BuildContext context, double width, double height) {
    final appLanguage = _appPreferences.getAppLanguage();
    return Center(
      child: Stack(
        children: [
          Positioned(
            top: AppSize.s0,
            right: AppSize.s0,
            left: AppSize.s0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.welcome),
                      fit: BoxFit.fitHeight)),
              padding: const EdgeInsets.only(right: AppSize.s20),
              child: !back
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(_s.welcome.toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  ?.copyWith(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s30,
                                      fontWeight: FontWeight.bold)),
                          const SizedBox(height: AppSize.s5),
                          Text(_s.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  ?.copyWith(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s25))
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
          Positioned(
              bottom: AppSize.s0,
              right: AppSize.s0,
              left: AppSize.s0,
              child: Container(
                width: width,
                height: height * 0.5,
                padding: const EdgeInsets.symmetric(
                    vertical: AppSize.s30, horizontal: AppSize.s20),
                decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s30),
                        topRight: Radius.circular(AppSize.s30))),
                child: Column(
                  children: [
                    Text(
                      _s.chooseLanguage,
                      style: Theme.of(context).textTheme.headline1?.copyWith(
                          color: ColorManager.white,
                          fontSize: AppSize.s28,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: AppSize.s30),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, index) {
                          final language = LanguageType.values[index];
                          return GestureDetector(
                            onTap: () {
                              _appPreferences
                                  .setAppLanguage(language.getValue());
                              Phoenix.rebirth(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(AppSize.s5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10),
                                border: Border.all(
                                    color: appLanguage == language.getValue()
                                        ? ColorManager.darkPrimary
                                        : Colors.transparent),
                                color: ColorManager.primaryOpacity70,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                      backgroundImage: AssetImage(
                                          '$imagePath/${language.getValue()}.png')),
                                  const SizedBox(width: AppSize.s10),
                                  Text(language.getValue(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(color: ColorManager.white))
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, index) =>
                            Divider(color: ColorManager.white),
                        itemCount: LanguageType.values.length,
                      ),
                    ),
                    const SizedBox(height: AppSize.s20),
                    ElevatedButton(
                        onPressed: () => back
                            ? _goBack(context)
                            : context.go(Routes.loginRoute),
                        child: Text(_s.next)),
                  ],
                ),
              )),
          Positioned(
            top: AppSize.s35,
            left: AppSize.s10,
            child: back
                ? IconButton(
                    onPressed: () {
                      _goBack(context);
                    },
                    icon: Icon(Icons.arrow_back_ios, color: ColorManager.white),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  _goBack(BuildContext context) =>
      context.canPop() ? context.pop() : context.go(Routes.splashRoute);
}
