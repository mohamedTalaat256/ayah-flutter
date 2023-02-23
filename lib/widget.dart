import 'package:ayah/data/quote.dart';
import 'package:ayah/logic/quote/quote_cubit.dart';
import 'package:ayah/logic/settings/app_settings_bloc.dart';
import 'package:ayah/widgets/anim_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {




  ColorSwatch? _tempMainColor;
  Color? _tempShadeColor;
  Color? _mainColor ;
  Color? _shadeColor = Colors.blue[800];

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title, style: TextStyle(color: Theme.of(context).primaryColor,)),
          content: content,
          actions: [
            TextButton(
              child: Text('CANCEL', style: TextStyle(color: Theme.of(context).primaryColor,),),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: Text('SUBMIT',  style: TextStyle(color: Theme.of(context).primaryColor,)),
              onPressed: () {
                Navigator.of(context).pop();
               
                setState(() => _mainColor = _tempMainColor);
                setState(() => _shadeColor = _tempShadeColor);
                setState(() {
                   BlocProvider.of<AppSettingsBloc>(context).add(colorChanged(color: _mainColor!.value));
                });
               
              },
            ),
          ],
        );
      },
    );
  }

   void _openFullMaterialColorPicker() async {
    _openDialog(
      "Select color theme",
      MaterialColorPicker(
        colors: fullMaterialColors,
        selectedColor: _mainColor,
        onMainColorChange: (color) => setState(() => _tempMainColor = color),
      ),
    );
  }



  late Quote quote;

  @override
  void initState() {
    super.initState();
    
    BlocProvider.of<QuoteCubit>(context).getQuote();
  }


  @override
  Widget build(BuildContext context) {

    return BlocBuilder<QuoteCubit, QuoteState>(
      builder: (cxt, state) {
      if (state is QuoteLoaded) {
        quote = (state).quote;
        return Scaffold(
         
          body: AnimCard(
           quote.text!.split(" ").join("  "),
           quote.surah!,
           
           //Color(_mainColor!.value),
           Theme.of(context).primaryColor,
            '',
            '',
            '',
            'فتح'
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor:Theme.of(context).primaryColor,
            child: Icon(Icons.brush_rounded, 
          
          ), onPressed: (){
                    _openFullMaterialColorPicker();

              },),
        );
        } else{
          return Scaffold(
           
          body: AnimCard(
           '',
           '',
            Theme.of(context).primaryColor,
            '',
            '',
            '',
            'فتح'
          ),
           floatingActionButton: FloatingActionButton(
            backgroundColor:Theme.of(context).primaryColor,
            child: Icon(Icons.brush_rounded, 
          
          ), onPressed: (){
                    _openFullMaterialColorPicker();

              },),
        );
        }}
    );
  }


}

