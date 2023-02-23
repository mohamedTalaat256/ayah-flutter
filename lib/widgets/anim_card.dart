import 'package:ayah/logic/quote/quote_cubit.dart';
import 'package:ayah/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AnimCard extends StatefulWidget {
  final Color color;
  final String num;
  final String numEng;
  final String content;
  final String quote;
  final String auther;
  String title;


  AnimCard(this.quote, this.auther,this.color, this.num, this.numEng, this.content, this.title);

  @override
  _AnimCardState createState() => _AnimCardState();
}

class _AnimCardState extends State<AnimCard> {
  var padding = 150.0;
  var bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPadding(
            padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: Container(
              child: CardItem(
                widget.quote,
                widget.auther,
                widget.color,
                widget.num,
                widget.numEng,
                widget.content,
                () {
                  setState(() {
                    padding = padding == 0 ? 150.0 : 0.0;


                    if(bottomPadding == 0){
                       widget.title = '﷽';
                      BlocProvider.of<QuoteCubit>(context).getQuote();
                     
                    }

                    bottomPadding = bottomPadding == 0 ? 150 : 0.0;
                  
                    
                    //

                  });
                },
                '﷽'
              /*   widget.title */

              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 20, left: 20, top: 200),
              height: 220,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2), blurRadius: 30)
                ],
                color: Colors.grey.shade200.withOpacity(1.0),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Center(
                  child: Icon(Icons.favorite,
                      color: Theme.of(context).primaryColor.withOpacity(1.0), size: 70)),
            ),
          ),
        ],
      ),
    );
  }
}
