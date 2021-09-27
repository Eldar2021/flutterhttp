import 'package:flutter/material.dart';
import 'package:sabak0901/weatherapp/models/weather.dart';
import 'package:sabak0901/weatherapp/services/weatherservices.dart';
import 'package:sabak0901/weatherapp/utils/weatherhelper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var formKey = GlobalKey<FormState>();
  // Form колдонуу учун глобал кей тузуп алабыз анын тиби <FormSate> болот
  final myController = TextEditingController();
  // TextFormField тин маанисин алуу чунун колнула турган контроллер
  String city = "Bishkek";
  // city нин маанисинин аба ырайын алууда колдонула турган озгорулмо
  // баштапкы абалы Бишкек

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Model View'),
      ),
      body: FutureBuilder<WeatherModel>(
        // Функциябызды чакырып алабыз
        future: weatherRepo.getWeatherModel(city),
        // чакырылган бюлд функция weatherRepo.getWeatherModel(city), барат
        builder: (BuildContext context, AsyncSnapshot<WeatherModel> snapshot){
          // BuildContext тин context алат жана келген датаны snapshot ко которот
          if (snapshot.hasData &&
              // snapshot то дата бар болсо жана
              snapshot.connectionState == ConnectionState.done) {
            // snapshot интернеттен дааны алып буткон болсо
            WeatherModel? weatherModel = snapshot.data;
            // WeatherModel тибинде(моделибиз) weatherModel озгорулмого snapshot келген датаны бер

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    // Form виджетин ач (форма толтуруу учун колдонулат)
                    key: formKey,
                    // key ге жогорудагы formKey мааничин бер (кийин контрол кылганда колдонобуз)
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        bottom: 40.0,
                      ),
                      child: TextFormField(
                        // колдонуучу мааынат киргизуу учун TextFormField ач
                        controller: myController,
                        // controller ге жогорудагы myController маанисин бер (кийин маалыматты бир жака жиберээрде колдонобуз)
                        onChanged: (value){
                          // onChanged методу value деген маани алсын (колдонуучу кандай маалымат кирп жатканын текшеруу учун)
                          print(value);
                        },
                        validator: (value) {
                          // validator методу value аттуу маани алсын (колдонуучу бир мааламат кирген же кирбеген контролл кылуу учун)
                          if (value == null) {
                            // value бош болсо
                            return 'Шаар кириңиз';
                            // Шаар кириңиз деп чыгар/жаз
                          }
                          // андай эмес болсо
                          return null;
                          // эч нерсе кылба
                        },
                        autofocus: false,
                        decoration: InputDecoration(
                          hintText: 'Шаар жазыңыз',
                          contentPadding: new EdgeInsets.symmetric(
                            vertical: 25.0,
                            horizontal: 10.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'City: ${weatherModel!.cityName}',
                  ),
                  Text(
                    'Celcius: ${weatherModel.celcius.round()}',
                  ),
                  Text(
                    'Wind speed: ${weatherModel.windSpeed}',
                  ),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            // эгер snapshot интернет менен байланышып жатса
            return Center(
              child: CircularProgressIndicator(),
              // ортодо загрузка белгисин чыгар
            );
          } else {
            // Эгер жогорудагылардын эч бири болбосо
            return Center(
              child: Text('Data null'),
              // ортодо Data null деп жаз
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            // StateFulWidget ти кайрадан чий
            if(formKey.currentState!.validate()){
              // эгер formKey мааниге ээ болсо
              print(myController.text);
              // колдонуучунун TextFormField ге брген мааыматын колнсолдо жаздыр
              city = myController.text;
              // city озгорулмосуно ал маалыматты котор
              weatherServices.getWeatherModel(city);
              // weatherServices тин getWeatherModel методун чакыр да ага city ни бер
            }else{
              // formKey мааниге ээ эмес болсо
              print("boosh");
            }
          });
        },
      ),
    );
  }
}
