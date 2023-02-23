
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppColorDialog extends StatefulWidget {
  const AppColorDialog({Key? key}) : super(key: key);

  @override
  State<AppColorDialog> createState() => _AppColorDialogState();
}

enum LANG{ en_US, ar_EG}

class _AppColorDialogState extends State<AppColorDialog> {

  LANG? _lang;
  @override
  Widget build(BuildContext context) {

    Locale myLocale = Localizations.localeOf(context);


    if(myLocale.toString() == 'en_US'){
      _lang = LANG.en_US;
    }else{
      _lang = LANG.ar_EG;

    }
    
    return  AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: Text('select app color'),
        content: Container(
          height: 200,
          child: Column(
            children: [
           
              ListTile(
                title: const Text('English'),
                leading: Radio<LANG>(
                 // fillColor: MaterialStateColor.resolveWith((states) => kTextOrange),
                  value: LANG.en_US,
                  groupValue: _lang,
                  onChanged: (LANG? value) {
                   setState(() {
                     _lang = value;
                   //   BlocProvider.of<AppSettingsBloc>(context).add(langChanged(local: Locale('en', 'US')));
                    });
                  },
                ),
              ),

              ListTile(
                title: const Text('العربية'),
                leading: Radio<LANG>(
                 // fillColor: MaterialStateColor.resolveWith((states) => kTextOrange),
                  toggleable: true,
                  value: LANG.ar_EG,
                  groupValue: _lang,
                  onChanged: (LANG? value) {
                    setState(() {
                     
                     _lang = value;
                    //  BlocProvider.of<AppSettingsBloc>(context).add(langChanged(local: Locale('ar', 'EG')));
                    });
                  },
                ),
              ),
  
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: Text('cancel', style: TextStyle(
             
            )),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child:  Text( 'ok', style: TextStyle(
            
            )),
          ),
        ],
      );
    
  }
}