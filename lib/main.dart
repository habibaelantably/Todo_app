
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:todo/shared/CubitTodo/changeCubit.dart';
import 'package:todo/shared/CubitTodo/changeSates.dart';
import 'package:todo/shared/CubitTodo/cubit.dart';
import 'package:todo/shared/bloc_observer.dart';
import 'Network/Local/cachHelper.dart';
import 'layouts/Home/homeScreen.dart';
import 'models/local_notification.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(context) async
{
  Bloc.observer = MyBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await NotificationApi.initializeNotification(context);

  await CacheHelper.init();

  var language = CacheHelper.getData(key: 'appLanguage');

  runApp(MyApp( language != null ? language : language=='English' ));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  String? language;

  MyApp(this.language);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context)=>AppCubit()..createDatabase(),),
        BlocProvider( create: (BuildContext context)=>ChangeCubit()..changeAppLanguage(language!))
      ],
      child: BlocConsumer<ChangeCubit,ChangeStates>(
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.indigo
            ),

            localizationsDelegates: [
              AppLocalizations.delegate, // Add this line
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', ''), // English, no country code
              Locale('ar', ''), // Spanish, no country code
            ],
            locale: ChangeCubit.get(context).
            currentLanguage=='العربية'?Locale('ar')
                :Locale('en'),

            home: homeScreen(),
          );
        },
        listener: (context,state){}
        ),

    );
  }
}





