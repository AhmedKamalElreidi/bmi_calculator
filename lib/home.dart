import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   double weight=0;
   double height=0;
   double bmi=0.0;
   String type="";
 String?  calculate(){
    bmi=weight/(pow((height/100),2));
    if (bmi<16) {
     return type="Severe Thinness";
    }else if(bmi>=16 && bmi<17){
     return type="Moderate Thinness";
    }else if(bmi>=17 && bmi<18.5){
     return type="Mild Thinness";
    }else if(bmi>=18.5 && bmi<25){
      return type="Normal";
    }else if(bmi>=25 && bmi<30){
      return type="Overweight";
    }else if(bmi>=30 && bmi<35){
     return type="Obese Class I";
    }else if(bmi>=35 && bmi<40){
     return type="Obese Class II";
    }else if(bmi>=40){
     return type="Obese Class III";
    }
    return null;
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor:const Color(0xff0A0C21),

      appBar: AppBar(
        backgroundColor:const Color(0xff0A0C21),
        elevation: 0.0,
        title:const Text("BMI Calculator App",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      
                      height: 280,
                      decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20)
                      ),
                      child:  Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Weight",style: TextStyle(color:Colors.grey[600],fontSize: 25,fontWeight: FontWeight.bold),),
                           const SizedBox(height: 15,),
                            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${weight.toInt()} ",style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                                const Text("KG ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          const  SizedBox(height: 25,),
                            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              FloatingActionButton(
                                mini: true,
                                backgroundColor: const Color(0xff4C4F5E),
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child:const Icon(Icons.remove),
                                ),
                               const SizedBox(width:10),
                                FloatingActionButton(
                                mini: true,
                                  backgroundColor: const Color(0xff4C4F5E),
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                 child:const Icon(Icons.add) ,
                          
                                ),
                              ],
                            ),
                          
                          ]
                          ),
                      ),
                  ),
                ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                     
                      height: 280,
                      decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20)
                      ),
                      child:  Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Height",style: TextStyle(color:Colors.grey[600],fontSize: 25,fontWeight: FontWeight.bold),),
                           const SizedBox(height: 15,),
                            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${height.toInt()} ",style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                                const Text("CM ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          const  SizedBox(height: 25,),
                            Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              FloatingActionButton(
                              mini: true,
                                backgroundColor: const Color(0xff4C4F5E),
                                onPressed: (){
                                  setState(() {
                                  height--;
                                });
                                },
                                child:const Icon(Icons.remove),
                                ),
                               const SizedBox(width:10),
                                FloatingActionButton(
                              mini: true,
                                  backgroundColor: const Color(0xff4C4F5E),
                                onPressed: (){
                                  setState(() {
                                  height++;
                                });
                                },
                                 child:const Icon(Icons.add) ,
                            
                                ),
                              ],
                            ),
                            
                          ]
                          ),
                      ),
                                ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
            onPressed: (){
              setState(() {
                calculate();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:const Color(0xffEB1555),
              fixedSize:const Size(370, 50),
            //   shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(30), // <-- Radius
            // ),
            ),
            child: const Text("Calculate",style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
            Expanded(
              child:Column(
              children: [
                  const SizedBox(height: 100,),
           Text("Result : ${bmi.toStringAsFixed(2)} ",style: const TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          const SizedBox(height: 30,),
           Text(type,style: const TextStyle(color: Colors.green,fontSize: 30,),),
              ],
            )
             ),
          
        ],
      ) ,
    );
  }
}