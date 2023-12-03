import 'package:app_ui/app_ui.dart';
import 'package:flutter/services.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColors.m3KeyColorsPrimary,
      ),
      primaryColor: AppColors.m3KeyColorsPrimary,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      buttonTheme: _buttonTheme,
      splashColor: AppColors.transparent,
      snackBarTheme: _snackBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      colorScheme: _colorScheme,
      bottomSheetTheme: _bottomSheetTheme,
      listTileTheme: _listTileTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomAppBarTheme,
      chipTheme: _chipTheme,
      outlinedButtonTheme: _outlinedButtonnTheme,
      filledButtonTheme: _filledButtonTheme,
      checkboxTheme: _checkboxTheme,
      radioTheme: _radioTheme,
    );
  }

  CheckboxThemeData get _checkboxTheme {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(
        AppColors.m3KeyColorsPrimary,
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        AppColors.transparent,
      ),
    );
  }

  RadioThemeData get _radioTheme {
    return RadioThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (Set<MaterialState> states) {
          // Set the color for the selected state
          return states.contains(MaterialState.selected)
              ? AppColors.m3KeyColorsPrimary
              : Colors.black; // Set the color for the unselected state
        },
      ),
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme.light(
      primary: AppColors.m3KeyColorsPrimary,
      secondary: AppColors.secondary,
      background: _backgroundColor,
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.lightBlue.shade300,
      backgroundColor: AppColors.black,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  Color get _backgroundColor => AppColors.white;

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      titleTextStyle: _textTheme.titleLarge,
      elevation: 0,
      toolbarHeight: 56,
      backgroundColor: AppColors.m3SysLightPrimary,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.onBackground,
    );
  }

  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.outlineLight,
      space: AppSpacing.lg,
      thickness: AppSpacing.xxxs,
      indent: AppSpacing.lg,
      endIndent: AppSpacing.lg,
    );
  }

  TextTheme get _textTheme => uiTextTheme;

  /// The Content text theme based on [ContentTextStyle].
  static final contentTextTheme = TextTheme(
    displayLarge: ContentTextStyle.headline1,
    displayMedium: ContentTextStyle.headline2,
    displaySmall: ContentTextStyle.headline3,
    headlineMedium: ContentTextStyle.headline4,
    headlineSmall: ContentTextStyle.headline5,
    titleLarge: ContentTextStyle.headline6,
    titleMedium: ContentTextStyle.subtitle1,
    titleSmall: ContentTextStyle.subtitle2,
    bodyLarge: ContentTextStyle.bodyText1,
    bodyMedium: ContentTextStyle.bodyText2,
    labelLarge: ContentTextStyle.button,
    bodySmall: ContentTextStyle.caption,
    labelSmall: ContentTextStyle.overline,
  ).apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );

  /// The UI text theme based on [UITextStyle].
  static final uiTextTheme = TextTheme(
    displayLarge: UITextStyle.headline1,
    displayMedium: UITextStyle.headline2,
    displaySmall: UITextStyle.headline3,
    headlineMedium: UITextStyle.headline4,
    headlineSmall: UITextStyle.headline5,
    titleLarge: UITextStyle.headline6,
    titleMedium: UITextStyle.subtitle1,
    titleSmall: UITextStyle.subtitle2,
    bodyLarge: UITextStyle.bodyText1,
    bodyMedium: UITextStyle.bodyText2,
    labelLarge: UITextStyle.button,
    bodySmall: UITextStyle.caption,
    labelSmall: UITextStyle.overline,
  ).apply(
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      border: OutlineInputBorder(),
      suffixIconColor: AppColors.m3SysLightOnSurfaceVariant,
      // prefixIconColor: AppColors.mediumEmphasisSurface,
      // hoverColor: AppColors.inputHover,
      // focusColor: AppColors.inputFocused,
      // fillColor: AppColors.inputEnabled,
      // enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,

      disabledBorder: _textFieldBorder,
      hintStyle: ContentTextStyle.m3BodyLarge
          .copyWith(color: AppColors.m3SysLightOnSurfaceVariant),
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      // border: const UnderlineInputBorder(),
      // border: OutlineInputBorder(),
      filled: true,
      isDense: true,
      // errorStyle: UITextStyle.caption,
      labelStyle: ContentTextStyle.m3BodyLarge.copyWith(
        color: AppColors.m3KeyColorsPrimary,
      ),
    );
  }

  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg - 6),
        textStyle: _textTheme.labelLarge,
        backgroundColor: AppColors.m3KeyColorsPrimary,
      ),
    );
  }

  OutlinedButtonThemeData get _outlinedButtonnTheme {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 1.w,
          color: AppColors.m3SysDarkOutline,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
        // textStyle: _textTheme.labelLarge,
        textStyle: ContentTextStyle.m3LabelLarge.copyWith(
          color: AppColors.m3SysDarkPrimary,
        ),
        backgroundColor: AppColors.m3KeyColorsPrimary,
      ),
    );
  }

  FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      // style: ButtonStyle.styleFrom(
      //   shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(100)),
      //   ),
      //   padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      //   textStyle: ContentTextStyle.m3LabelLarge.copyWith(
      //     color: AppColors.m3SysDarkPrimary,
      //   ),
      //   backgroundColor: AppColors.m3SysDarkPrimary,
      // ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          AppColors.m3SysDarkPrimary,
        ),
        elevation: MaterialStateProperty.all(4.r),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: AppSpacing.lg - 6)),
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
        foregroundColor: AppColors.black,
      ),
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.modalBackground,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.lg),
          topRight: Radius.circular(AppSpacing.lg),
        ),
      ),
    );
  }

  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: AppColors.onBackground,
      contentPadding: EdgeInsets.all(AppSpacing.lg),
    );
  }

  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.darkAqua;
        }
        return AppColors.eerieBlack;
      }),
      trackColor:
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primaryContainer;
        }
        return AppColors.paleSky;
      }),
    );
  }

  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColors.darkAqua,
      circularTrackColor: AppColors.borderOutline,
    );
  }

  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: UITextStyle.button,
      labelColor: AppColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md + AppSpacing.xxs,
      ),
      unselectedLabelStyle: UITextStyle.button,
      unselectedLabelColor: AppColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          // color: AppColors.darkAqua,
          color: AppColors.primaryColor,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }
}

InputBorder get _textFieldBorder => const OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: AppColors.m3KeyColorsPrimary,
      ),
    );

BottomNavigationBarThemeData get _bottomAppBarTheme {
  return BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkBackground,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.white.withOpacity(0.74),
  );
}

ChipThemeData get _chipTheme {
  return const ChipThemeData(
    backgroundColor: AppColors.transparent,
  );
}

/// {@template app_dark_theme}
/// Dark Mode App [ThemeData].
/// {@endtemplate}
class AppDarkTheme extends AppTheme {
  /// {@macro app_dark_theme}
  const AppDarkTheme();

  @override
  ColorScheme get _colorScheme {
    return const ColorScheme.dark().copyWith(
      primary: AppColors.white,
      secondary: AppColors.secondary,
      background: AppColors.grey.shade900,
    );
  }

  @override
  TextTheme get _textTheme {
    return AppTheme.contentTextTheme.apply(
      bodyColor: AppColors.white,
      displayColor: AppColors.white,
      decorationColor: AppColors.white,
    );
  }

  @override
  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.lightBlue.shade300,
      backgroundColor: AppColors.grey.shade300,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  @override
  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
        foregroundColor: AppColors.white,
      ),
    );
  }

  @override
  Color get _backgroundColor => AppColors.grey.shade900;

  @override
  IconThemeData get _iconTheme {
    return const IconThemeData(color: AppColors.white);
  }

  @override
  DividerThemeData get _dividerTheme {
    return const DividerThemeData(
      color: AppColors.onBackground,
      space: AppSpacing.lg,
      thickness: AppSpacing.xxxs,
      indent: AppSpacing.lg,
      endIndent: AppSpacing.lg,
    );
  }
}
