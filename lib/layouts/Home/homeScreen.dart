
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:intl/intl.dart';
import 'package:todo/shared/CubitTodo/cubit.dart';
import 'package:todo/shared/CubitTodo/states.dart';
import 'package:todo/shared/reusableComponents/reusableComponents.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


/*class homeScreen extends StatefulWidget
{
  @override
  _homeScreenState createState() => _homeScreenState();
}*/

class homeScreen extends StatelessWidget
{

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var textController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var descriptionController = TextEditingController();

  /*void initState() {
    super.initState();

    createDatabase();
  }*/

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(

      listener: (BuildContext context, AppStates state)
      {
        if(state is AppInsertDatabaseState)
        {
          Navigator.pop(context);
        }

      },
      builder: (BuildContext context, Object? state)
      {

        AppCubit cubit=AppCubit.get(context);

          return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              cubit.currentIndex == 0 ? AppLocalizations.of(context)!.tasks
                  : cubit.currentIndex == 1 ? AppLocalizations.of(context)!.doneTasks
                  : cubit.currentIndex == 2 ? AppLocalizations.of(context)!.archivedTasks
                  : AppLocalizations.of(context)!.settingsScreen
            ),
          ),
          body:  Conditional.single(
              context: context,
              conditionBuilder: (context)=>/*tasks.length>0*/ true,
              widgetBuilder: (context)=>AppCubit.get(context).Screens[AppCubit.get(context).currentIndex],
              fallbackBuilder:(context)=>Center(child: CircularProgressIndicator()) ),

        /*condition: tasks.length>0,
        builder: (context)=>Screens[currentIndex],
        fallback: (context)=>Center(child: CircularProgressIndicator()),*/


        floatingActionButton: FloatingActionButton(
          onPressed: () {

            /* getName().then((value){
                  print(value);
                  print('habiba');
                  throw('there is an error here');


                }).catchError((error){
                  print('error ${error.toString()}');
                  returnCompleter<Never>().future;
                });*/

            if (cubit.isbottomsheet) {
              if (formKey.currentState!.validate()) {
                cubit.InsertToDatabase(
                    title: textController.text,
                    date: dateController.text,
                    time: timeController.text,
                    description: descriptionController.text
                );
               /* InsertToDatabase(title: TextController.text,
                    time: TimeController.text,
                    date: DateController.text).then((value) {
                  Navigator.pop(context);
                  isbottomsheet = false;
                  /* setState(() {
                    fabIcon = Icons.edit;
                  });*/
                });*/
              }
            } else {
              scaffoldKey.currentState!.showBottomSheet((context) =>
                  Form(
                    key: formKey,
                    child: Container(
                      padding: EdgeInsets.all(15.0,),
                      color: Colors.grey[200],
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          deafultFormField(
                            controller: textController,
                            type: TextInputType.text,
                            validator: (String ? value) {
                              if (value!.isEmpty) {
                                return 'value must not be empty';
                              }
                              return null;
                            },
                            label: AppLocalizations.of(context)!.label1,
                            prefix: Icons.title,
                          ),
                          SizedBox(height: 15,),
                          deafultFormField(
                            controller: timeController,
                            type: TextInputType.datetime,
                            OnTap: () {
                              showTimePicker
                                (context: context,
                                  initialTime: TimeOfDay.now())
                                  .then((value) {
                                timeController.text =
                                    value!.format(context).toString();
                              });
                            },
                            validator: (String ? value) {
                              if (value!.isEmpty) {
                                return 'value must not be empty';
                              }
                              return null;
                            },
                            label: AppLocalizations.of(context)!.label2,
                            prefix: Icons.title,
                          ),
                          SizedBox(height: 15,),
                          deafultFormField(
                            controller: dateController,
                            type: TextInputType.datetime,
                            OnTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-09-04'),
                              ).then((value) {
                                dateController.text =
                                    value.toString().split(' ').first;
                                //2022-05-24 000:000:000
                              }
                              );
                            },
                            validator: (String ? value) {
                              if (value!.isEmpty) {
                                return 'value must not be empty';
                              }
                              return null;
                            },
                            label: AppLocalizations.of(context)!.label3,
                            prefix: Icons.title,
                          ),
                          SizedBox(height: 15,),
                          deafultFormField(
                            controller: descriptionController,
                            type: TextInputType.text,
                            validator: (String ? value) {
                              if (value!.isEmpty) {
                                return 'value must not be empty';
                              }
                              return null;
                            },
                            label: AppLocalizations.of(context)!.label4,
                            prefix: Icons.description_outlined,
                          )
                        ],
                      ),
                    ),
                  )
              ).closed.then((value) {
                cubit.changeBottomsheet(isshow: false, icons: Icons.edit);
              });
              cubit.changeBottomsheet(isshow: true, icons: Icons.add);
              //isbottomsheet = true;
              /* setState(() {
                fabIcon = Icons.add;
              });*/
            }
          },
          child: Icon(
             cubit.fabIcon
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            AppCubit.get(context).changeIndex(index);

            /* setState(() {
              currentIndex = index;
            });*/
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.menu),
              label: AppLocalizations.of(context)!.tasks,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.check_circle_outline),
              label:  AppLocalizations.of(context)!.doneTasks,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.archive_outlined),
              label:  AppLocalizations.of(context)!.archivedTasks,
            ),
            BottomNavigationBarItem(icon: Icon(Icons.settings),
              label:  AppLocalizations.of(context)!.settingsScreen,
            ),
          ],
        ),
      );},
    );
  }

   Future getName() async
  {
    return await('habiba Gamal')  ;
  }





}




