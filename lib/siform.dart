// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SIForm extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
    
  }
}

class _SIFormState extends State<SIForm>{

var _formKey = GlobalKey<FormState>();
 var _currencies =['Rupees','Dollars','Pounds'];
 final double _minimumPadding = 5.0;

 var _currentItemSelected ='';

 @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }
   
   TextEditingController principalController = TextEditingController();
   TextEditingController roiController = TextEditingController();
   TextEditingController termController =TextEditingController();

   var displayResult ='';

  @override
  Widget build(BuildContext context) {
  
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Simple Interest Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(_minimumPadding*2),
          child: ListView(
           children: [
           getImageAsset(),
        
           Padding(
             padding: EdgeInsets.only(top: _minimumPadding,
             bottom: _minimumPadding),
             child: TextFormField(
               keyboardType: TextInputType.number,
               style: textStyle,
               controller: principalController,
               validator: (value){
                 if (value!.isEmpty){
                   return'Please enter principal amount';
                 }
               },
               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
               decoration: InputDecoration(
                 labelText: 'Principal',
                 hintText: 'Enter Principal e.g. 12000',
                 labelStyle: textStyle,
                 errorStyle: TextStyle(
                   color: Colors.yellowAccent,
                   fontSize: 15.0
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                 )
               ),
             )
           ),
        
           Padding(
             padding: EdgeInsets.only(
               top: _minimumPadding,bottom: _minimumPadding
             ),
             child: TextFormField(
               keyboardType: TextInputType.number,
               style: textStyle,
               controller: roiController,
               validator: (value){
                 if(value!.isEmpty){
                   return 'Pleasr enter rate of interest';
                 }
               },
               inputFormatters: [FilteringTextInputFormatter.digitsOnly],
               decoration: InputDecoration(
                 labelText: 'Rate of Interest',
                 hintText: 'In Percent',
                 labelStyle: textStyle,
                 errorStyle: TextStyle(
                   color: Colors.yellowAccent,
                   fontSize: 15.0
                 ),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(5.0)
                 )
               ),
             )
           ),
        
           Padding(
             padding: EdgeInsets.only(top: _minimumPadding,
              bottom: _minimumPadding),
             child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                   keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: termController,
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter time ';
                    }
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                   decoration: InputDecoration(
                     labelText: 'Term',
                     hintText: 'Time in years',
                    labelStyle: textStyle,
                    errorStyle: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 15.0
                    ),
                     border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(5.0)
                     )
                   ),
                           )
                ),
        
                Container(width: _minimumPadding*5,),
               
               Expanded(
                   child: DropdownButton<String>(
                     items: _currencies.map((String value){
                       return DropdownMenuItem<String>(
                       value: value,
                         child: Text(value),
                         );
                     }).toList(),
                     value: _currentItemSelected,
                      onChanged: (newValueSelected){
                       _onDropDownItemSelected(newValueSelected!);
                      },
                      )
                 )
               
              ],
             )
           ),
            
            Padding(
              padding: EdgeInsets.only(top: _minimumPadding,
              bottom: _minimumPadding),
              child: Row(
               children: [
                 Expanded(
                   child: RaisedButton(
                     color: Theme.of(context).accentColor,
                     textColor: Theme.of(context).primaryColorDark,
                      child: Text("Calculate",textScaleFactor: 1.5,),
                     onPressed: (){
                      setState(() {
                        if(_formKey.currentState!.validate()){
                        displayResult = _calculateTotalReturns();
                        }
                      });   
                     },
                   ),
                 ),
            
                 Expanded(
                   child: RaisedButton(
                     color: Theme.of(context).primaryColorDark,
                     textColor: Theme.of(context).primaryColorLight,
                     child: Text("Reset",textScaleFactor: 1.5,),
                   onPressed:() {
                     setState(() {
                       _reset();
                     });
                   },
                   
                   ),
                 ),
                
                
               ],
            
            
              )
            ),
               
            Padding(
                   padding: EdgeInsets.all(_minimumPadding*2),
                   child: Text(this.displayResult,style: textStyle,),
                   )    
        
           ],
          ),
        ),
      ),
    );
    
  }
  Widget getImageAsset(){

    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(image: assetImage,
    width: 125.0,height: 125.0,);
    return Container(child: image,
    margin:EdgeInsets.all(_minimumPadding*10),
    
    );
  }
  void _onDropDownItemSelected (String newValueSlected){
    setState(() {
      this._currentItemSelected =newValueSlected;
    });
  }

  String _calculateTotalReturns(){
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal + (principal*roi*term)/100;

    String result = 'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }

void _reset(){
  principalController.text ='';
  roiController.text = '';
  termController.text ='';
  displayResult ='';
  _currentItemSelected = _currencies[0];
}

}