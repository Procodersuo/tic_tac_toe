import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
int x=0,x1=0,x2=0,click=0;
List<String> display=["","","","","","","","",""];
List<int> colorChange=[];
String winner="";


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
  home:SafeArea(
    child: Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

    const SizedBox(
      height: 20,
    ),
          const Expanded(
              flex: 1,
              child: Text("TIC_TAC_TOE",style: TextStyle(color: Colors.white,fontSize: 30,fontStyle: FontStyle.italic),)),

          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
                           gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context,index)
            {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()
                    {
                      printer(index);
                    },
                    child: Center(
                      child: Container(
                        decoration:  BoxDecoration(
                      color:colorChange.contains(index)?Colors.blueAccent:Colors.amberAccent,
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                                ),
                        child: Center(child: Text(display[index],style: const TextStyle(color: Colors.pinkAccent,fontSize: 40),)),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
      Expanded(
          flex: 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(x1==0?"":"Player $winner Wins the game",style: const TextStyle(color: Colors.white,fontSize: 20),),
              Text(x2>=9&&x1==0?"GAME DRAW":"",style: const TextStyle(color: Colors.white,fontSize: 20),),
            ],
          )
      ),




        ],

      ),
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.amberAccent,
      onPressed: ()
      {
        reset();
      },
    child: const Icon(Icons.restart_alt,color: Colors.pinkAccent,),),
    ),
  )
    );
  }

  void printer(int index)
  {
    //if display[index] not contain value
    // checking x1 value if a player win then do not print x and 0
    // check x value to print x and 0 if x value 0 print x and if x vale 1 print 0
     if(display[index]=="" &&x==0 &&x1==0)
  {
    display[index]="X";
    setState(() {
      x=1;
      click++;
    });
  }
else if(display[index]==""&&x==1&&x1==0)
  {
    display[index]="0";
    setState(() {
      x=0;
      click++;
    });
  }
// if click are greater then 2 then check there is winner
if(click>2)
  {
    winnerChecker();
  }
// if clicks are equal to 9 and no player win then checking game draw
if(click>=9)
  {
    gameDrawChecker();
  }


  }
  void winnerChecker()
  {//updating x1 value showing a player win this will help us to control x and  print after winner
    if(display[0]==display[1]&&display[1]==display[2]&&display[0]!="")
      {
        winner=display[0];
        x1=1;
        colorChange.addAll([0,1,2]);
        vibrator();
      }
    else if(display[3]==display[4]&&display[4]==display[5]&&display[5]!="")
    {
      winner=display[3];
      x1=1;
      colorChange.addAll([3,4,5]);
      vibrator();

    }
    else if(display[6]==display[7]&&display[7]==display[8]&&display[6]!="")
    { winner=display[6];
    x1=1;
    colorChange.addAll([6,7,8]);
    vibrator();

    }
    else if(display[0]==display[3]&&display[3]==display[6]&&display[0]!="")
    {
      winner=display[0];
      x1=1;
      colorChange.addAll([0,3,6]);
      vibrator();
    }
    else if(display[1]==display[4]&&display[4]==display[7]&&display[1]!="")
    {
      winner=display[1];
      x1=1;
      colorChange.addAll([1,4,7]);
      vibrator();
    }
    else if(display[2]==display[5]&&display[5]==display[8]&&display[2]!="")
    {
      winner=display[0];
      x1=1;
      colorChange.addAll([2,5,8]);
      vibrator();
    }
    else if(display[0]==display[4]&&display[4]==display[8]&&display[0]!="")
    {
      winner=display[0];
      x1=1;
      colorChange.addAll([0,4,8]);
      vibrator();
    }
    else if(display[2]==display[4]&&display[4]==display[6]&&display[2]!="")
    {
      winner=display[2];
      x1=1;
      colorChange.addAll([2,4,6]);
      vibrator();
    }


  }
  void reset()
  {
    for(int i=0;i<9;i++)
      {
        display[i]="";
      }
    setState(() {
winner="";
x1=0;
click=0;
x2=0;
colorChange.clear();
    });
    vibrator();
  }
  void gameDrawChecker()
  {
    for(int i=0;i<9;i++)
      {
        if(display[i]!="")
          {
            x2++;
          }
        setState(() {

        });
      }

  }
  void vibrator()
  {
    HapticFeedback.vibrate();

  }
}



