import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_provider/country_detail_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Modal/country_modal.dart';
import 'package:http/http.dart' as http;

class CountryDataScreen extends StatefulWidget {
  const CountryDataScreen({super.key});

  @override
  State<CountryDataScreen> createState() => _CountryDataScreenState();
}

class _CountryDataScreenState extends State<CountryDataScreen> {

  Future<List<Country>> getAllCountries() async {

    String url = 'https://countriesnow.space/api/v0.1/countries/flag/images';  // this is the api url

     var response = await  http.get(Uri.parse(url));   // send the request

     if(response.statusCode == 200){   //  if request successfully

     Map<String, dynamic> jsonResponse =  json.decode(response.body);   // declare the type of response

     var jsonList = jsonResponse['data'];   //  pick the required list of data

     List<Country> countries = [];                     //  declare the empty list for saving the data

     for ( var countryMap in jsonList){                // for loop saving the map data through modal into List
       Country country = Country.fromMap(countryMap);  // convert response into map
       countries.add(country);                         //  adding into list
     }
     return countries;                                 //  return the result
     }
     return <Country> [];                              //   else return empty list

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country List"),
      ),
      body: FutureBuilder(
        future: getAllCountries(),
          builder: (context,snapshot) {
            if(snapshot.hasData){
                if(snapshot.data!.isEmpty){
                   return const Center(child: Text("Something went wrong"),);
                } else {

                  List<Country> countries = snapshot.data!;

                return ListView.builder(
                    itemCount: countries.length,
                      itemBuilder: (context , index){

                      Country country = countries[index];

                       return GestureDetector(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) =>  CountryDetailScreen(country: country)),
                           );
                         },
                         child: Container(
                           padding: const EdgeInsets.all(10),
                           margin: const EdgeInsets.only(bottom: 10),
                           child: Row(
                             children: [
                               SizedBox(
                                 height: 100,
                                   width: 80,
                                   child: Hero(
                                     tag: country.flag,
                                       child: SvgPicture.network(country.flag,fit: BoxFit.cover,))),
                               const SizedBox(width: 10,),
                               Text(country.name,style: const TextStyle(fontSize: 21),),

                             ],
                           ),
                         ),
                       );
                      }
                  );
                }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
      ),
    );
  }
}





