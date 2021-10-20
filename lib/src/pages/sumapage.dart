



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuevo/src/services/sumaservice.dart';


class SumaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SumaPageState();
  }
}

class _SumaPageState extends State<SumaPage> {
  int num1=0;
  int num2=0;
  String result='0';
  
  TextEditingController tnum1=TextEditingController(text: '0');
  TextEditingController tnum2=TextEditingController(text: '0');
  SumaService ssum=SumaService();

InputDecoration dec1=InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0,vertical: 15.0),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white,width: 2.0),borderRadius: BorderRadius.circular(20.0)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.limeAccent,width: 3.0),borderRadius: BorderRadius.circular(20.0)),
                      hoverColor: Colors.yellow, 
                      errorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2.0),borderRadius: BorderRadius.circular(20.0)), 
                      
                      
                      
                      
                      focusedErrorBorder:  OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2.0),borderRadius: BorderRadius.circular(20.0)),                                
                    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SUMA'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Container(
             padding: EdgeInsets.symmetric(horizontal: 25),
             child: TextField(
               
               controller: tnum1,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 40,color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: dec1,
                inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp ( r"[0-9]" ))
                    ],
                onChanged: (valor){
                  print(valor);
                  _validarValores(valor,tnum1);
                  
                  
                },
              ),
           ),
          
          SizedBox(
            height: 50.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              controller: tnum2,
              textAlign: TextAlign.end,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 40,color: Colors.white),
              decoration: dec1,
              inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp ( r"[0-9]" ))
                    ],
              onChanged: (valor){
                    print(valor);
                    _validarValores(valor,tnum2);
                    
                  },
            ),
          ),
          
          SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
                child: Text('Sumar',style: TextStyle(fontSize: 20),),
                style: ElevatedButton.styleFrom(
                      
                        side: BorderSide(color: Colors.white),
                        padding: EdgeInsets.symmetric(horizontal: 100,vertical: 10),
                        primary: Colors.green[400],
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                      ),
                onPressed: (){
                    ssum.getsuma(tnum1.text, tnum2.text).then((value)  {
                        setState(() {
                            result=value;

                        });
                    });
                    
                }
              ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            alignment: Alignment.centerRight,
            child: Text(result,
            style: TextStyle(
              fontSize: 40,
              color: Colors.white
            ),
            ),
          )
        ],
      )

          //
          ),
      backgroundColor: Colors.green[800],
    );
  }
  
  _validarValores(String valor,TextEditingController t){
    int n=valor.length;
                  switch (n) {
                    case 0: {
                      
                    setState(() {
                      t.text='0';
                      t.selection=TextSelection.collapsed(offset: t.text.length);             
                    });
                    }                     
                      break;
                    case 2:{
                      if(valor[0]=='0'){
                        t.text=valor.substring(1);
                        t.selection=TextSelection.collapsed(offset: t.text.length);
                      }
                    } break;
                    default:
                  }
  }
}
