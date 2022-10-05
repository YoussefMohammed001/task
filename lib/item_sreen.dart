




import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task/checkBox_state.dart';



class ItemScreen extends StatefulWidget {
ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  static const sizes = <String> ["عادي","كبير","كبير اوي"];
  static const comboSizes = <String> ["عادي","كبير","كبير اوي"];
  String selectedValue = sizes.first;
  String selectedCombo = comboSizes.first;
  bool chooseSize = false;
  bool combo = false;
  bool additions = false;
  bool? isChecked = false;
  int radioValue = 1;

  final choosenAdditions = [
    CheckboxState("لحمه", "30", false),
    CheckboxState("جبنه", "20", false)

  ];


  @override
  Widget build(BuildContext context) {



    return SafeArea(
      child: Scaffold(
        body: ListView(

          children: [
            imageWidget(),
            shareItemWidget(),
            Container(
              margin: EdgeInsets.all(15.sp),
              child: Align(

                  alignment: AlignmentDirectional.topEnd,
                  child: Text('شاورما فراخ سوري',style: TextStyle(fontSize: 22.sp,fontWeight: FontWeight.bold),)),
            ),
          chooseSizeWidget(),
          comboWidget(),
          additionsWidget(),
            buildaddOrderAndOrderCount(),







          ],
        ),

      ),
    );
  }

Widget chooseSizeWidget(){



    return Column(

      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey[200],
              border: Border.all(color: Colors.grey.shade300)
          ),
          padding: EdgeInsets.all(10.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: () {
                chooseSize = !chooseSize;

                setState(() {
                });
                print(chooseSize);
              }, icon: Icon( chooseSize ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp,size: 22.sp,color:  Colors.grey[600],)),
              Text("اختر الحجم[${selectedValue}]",style: TextStyle(fontSize: 17.sp),),
            ],
          ),
        ),



        Visibility(
          visible:  chooseSize,
          child:  Column(
              children: sizes.map(
                      (value){


                    return Container(
                      margin: EdgeInsets.only(left: 25.sp,right: 25.sp),
                      child: Transform.scale(
                        scale: 4.5.sp,
                        child: Column(

                          children: [

                            RadioListTile(
                             activeColor: Colors.green,

                              value: value,
                              groupValue:selectedValue,
                              title: Text(value),
                              onChanged: (value) => setState(() => this.selectedValue = value!),


                            ),
                          ],
                        ),
                      ),
                    );

                  }

              ).toList()

          ),
        ),




      ],
    );
}
Widget comboWidget(){



    return Column(

      children: [
        Container(
          decoration: BoxDecoration(color: Colors.grey[200],
              border: Border.all(color: Colors.grey.shade300)
          ),
          padding: EdgeInsets.all(10.sp),
          child: Row(
            children: [
              IconButton(onPressed: () {
                combo = !combo;

                setState(() {
                });
                print(combo);
              }, icon: Icon(combo ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp,size: 22.sp,color:  Colors.grey[600],)),
              Text("الحد الاقصى : ١",style: TextStyle(fontSize: 17.sp),),
              Spacer(),

              Text(" [${selectedCombo}]كومبو",style: TextStyle(fontSize: 17.sp),),
            ],
          ),
        ),




        Visibility(
          visible:  combo,
          child: Column(
              children: comboSizes.map(
                      (value){


                    return Container(
                      margin: EdgeInsets.only(left: 25.sp,right: 25.sp),
                      child: Transform.scale(
                        scale: 4.5.sp,
                        child: RadioListTile(


                          activeColor: Colors.green,

                          value: value,
                          groupValue:selectedCombo,
                          title: Text(value),
                          onChanged: (value) => setState(() => this.selectedCombo = value!),


                        ),
                      ),
                    );

                  }

              ).toList()

          ),

        ),




      ],
    );
}

Widget additionsWidget(){
  return Column(

    children: [
      Container(
        decoration: BoxDecoration(color: Colors.grey[200],
            border: Border.all(color: Colors.grey.shade300)
        ),
        padding: EdgeInsets.all(10.sp),
        child: Row(
          children: [
            IconButton(onPressed: () {
              additions = !additions;

              setState(() {
              });
              print(additions);
            }, icon: Icon(additions ? Icons.keyboard_arrow_up_sharp : Icons.keyboard_arrow_down_sharp,size: 22.sp,color:  Colors.grey[600],)),
            Text("الحد الاقصى : ٢  ",style: TextStyle(fontSize: 17.sp),),
            Spacer(),

            Text("الاضافات",style: TextStyle(fontSize: 17.sp),),
          ],
        ),
      ),




      Visibility(
        visible:  additions,
        child: Column(children: [
          ...choosenAdditions.map(buildCheckbox).toList()
        ],)

      ),




    ],
  );
}
Widget buildCheckbox(CheckboxState checkboxState){
    return CheckboxListTile(
        value: checkboxState.value,
        activeColor: Colors.green,
        title: Row(
          children: [
            Text(checkboxState.title),
            Spacer(),
            Text("جنيه"),
            Text(checkboxState.price),


          ],
        ),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (value) => setState(() => checkboxState.value= value!));
}
Widget imageWidget(){
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        Image.network("https://s3-eu-west-1.amazonaws.com/elmenusv5-stg/Thumbnail/bfe54623-dfff-492a-ad74-4f5d6e0e6720.jpg",fit: BoxFit.fill,height: 170,width: double.infinity,),
        IconButton(onPressed: () {

        }, icon: const Icon(Icons.remove,color: Colors.white))
      ],


    );

}

Widget shareItemWidget(){
    return Align(
      alignment: AlignmentDirectional.topStart,
      child: Container(
        margin: EdgeInsets.all(15.sp),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30,
            ),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.share,color: Colors.red,size: 22.sp,)),


          ],
        ),
      ),
    );
  }

  Widget buildaddOrderAndOrderCount(){
    return Align(

      child: Container(
        decoration: BoxDecoration(
color: Colors.grey.shade200,
            border: Border.all(
              color: Colors.grey.shade200,
            ),

        ),

        padding: EdgeInsets.all(20.sp),

        child: Row(


          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.sp),

                decoration: BoxDecoration(
                  color: Colors.red,
                    border: Border.all(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15.sp))
                ),
                child:    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("اضف للاوردر ", style: TextStyle(color: Colors.white,fontSize: 22),),
                    Icon(Icons.shopping_bag_outlined, color: Colors.white,)
                  ],
                ),

              ),
            ),

            Expanded(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {

                    }, icon: Icon(Icons.add,size: 22.sp,color: Colors.red,),),
                    SizedBox(width: 2.w,),
                    Text("0",style: TextStyle(fontSize:22.sp ),),
                    SizedBox(width: 2.w,),
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.remove,size: 22.sp,color: Colors.red,)),
                  ],
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}

