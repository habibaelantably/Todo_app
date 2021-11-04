
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/modules/challengeModel.dart';

class challengeLayout extends StatelessWidget
{
  List<ChallengeModel>challenge=
  [
    ChallengeModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTILIS6d1owTqGZumoWcZa3EadvhTcPKYNrfA&usqp=CAU',
        'your Full Marathon Training plan ', 'may20,2021', '5'),
    ChallengeModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzZ-NawkvJugqL7SIDRoge6Xl-QlwQYVmbpQ&usqp=CAU',
        'Marathone Training Guid for (Total) beginners', 'may20,2021', '17'),
    ChallengeModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTegdpT_pJBfI65w_FjAGucMGWSKvp2uvkv8A&usqp=CAU',
        'Bicep Exercises for women', 'may20,2021', '20'),
    ChallengeModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTILIS6d1owTqGZumoWcZa3EadvhTcPKYNrfA&usqp=CAU',
        'your Full Marathon Training plan', 'may20,2021', '8'),
    ChallengeModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzZ-NawkvJugqL7SIDRoge6Xl-QlwQYVmbpQ&usqp=CAU',
        'Marathone Training Guid for (Total) beginners', 'may20,2021', '0'),
    ChallengeModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzZ-NawkvJugqL7SIDRoge6Xl-QlwQYVmbpQ&usqp=CAU',
        'Marathone Training Guid for (Total) beginners', 'may20,2021', '4'),
    ChallengeModel('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTegdpT_pJBfI65w_FjAGucMGWSKvp2uvkv8A&usqp=CAU',
        'your Full Marathon Training plan', 'may20,2021', '20'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text('Latest News',
          style: TextStyle(
              color: Colors.black,
          ),
          ),
        ),
        leading: Icon(Icons.arrow_back_ios,
        color: Colors.black,
        ),
        actions: [
          Icon(Icons.search,
          color:Colors.black
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50.0,
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.bar_chart,
                    color: Colors.blue[300],
                  ),
                  SizedBox(width: 5.0,),
                  Text('sort',
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                  ),
                  SizedBox(width: 8.0,),


                  Icon(Icons.arrow_upward,
                    color: Colors.blue[300],
                  ),
                  SizedBox(width: 5.0,),
                  Text('Refine',
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                  ),
                  Spacer(),
                  Icon(Icons.crop_square,),
                  SizedBox(width: 6.0,),
                  Icon(Icons.menu,
                    color: Colors.blue[300],
                  ),


                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: ListView.separated(
                  itemBuilder:(context,index)=>ChalengeItemBuilder(challenge[index]),
                  separatorBuilder: (context,index)=>Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[500],
                  ),
                  itemCount: challenge.length),
            ),
          )
        ],
      )
    );
  }

  Widget ChalengeItemBuilder(ChallengeModel model)=>Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(
                    '${model.image}'
                    ),
                height: 120,
                width: 120,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children:
                  [


                        SizedBox(
                          height: 30,
                          width:100,
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Running'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            color: Colors.green[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40.0))),

                          ),
                        ),
                        SizedBox(width: 7.0,),

                        SizedBox(
                          height: 30,
                          width:100,
                          child: MaterialButton(
                            onPressed: (){},
                            child: Text('Training'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            color: Colors.green[600],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40.0))),

                          ),
                        ),

                  ],
                ),
                SizedBox(height: 15.0,),
                Text('${model.title}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                ),
                SizedBox(height: 11.0,),
                Text('${model.date}'),
                SizedBox(height: 15.0,),
                Row(
                  children: [
                    Icon(Icons.spa_outlined),
                    Text('logan'),
                    SizedBox(width: 10.0,),
                    Icon((Icons.insert_comment_rounded)),
                    Text('${model.comment}')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );

}