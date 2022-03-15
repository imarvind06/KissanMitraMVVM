import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kissanmitra/models/weather_sevenday_data_model/sevenday_data_model.dart';
import 'package:kissanmitra/utils/size_config.dart';

class SevenDaysView extends StatelessWidget {
  final List<WeatherSevenDayDataModel> sevenDay;
  SevenDaysView(this.sevenDay, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        showData(sevenDay[0]),
        showData(sevenDay[1]),
        showData(sevenDay[2]),
        showData(sevenDay[3]),
        showData(sevenDay[4]),
        showData(sevenDay[5]),
        showData(sevenDay[6]),
      ],
    );
  }

  Widget showData(data) {
    return Container(
      margin: EdgeInsets.only(
          bottom: getProportionateScreenWidth(10),
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10)),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2, color: Colors.white),
          borderRadius:
              BorderRadius.circular(getProportionateScreenHeight(35))),
      padding: EdgeInsets.all(getProportionateScreenHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(data.day,
              style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: getProportionateScreenHeight(20))),
          Container(
            width: getProportionateScreenWidth(125),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(data.image),
                  width: getProportionateScreenWidth(40),
                ),
                SizedBox(width: getProportionateScreenWidth(15)),
                Text(
                  data.name,
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.none,
                      fontSize: getProportionateScreenHeight(20)),
                )
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "+" + data.max.toString() + "\u00B0",
                style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    fontSize: getProportionateScreenHeight(20)),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              Text(
                "+" + data.min.toString() + "\u00B0",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: getProportionateScreenHeight(20),
                    color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
