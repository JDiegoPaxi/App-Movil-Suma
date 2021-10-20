import 'package:http/http.dart' as http;
import 'dart:convert';

class SumaService{
 String url='http://192.168.1.5:3000';
 
 Future<String> getsuma(String num1,String num2)async{
    final urlc=url+'/sumar/'+num1+'/'+num2;
    final resp=await http.get(Uri.parse(urlc));
    final decodeData=json.decode(resp.body);
    print(decodeData);
    
   return decodeData['result'].toString();
 }


}