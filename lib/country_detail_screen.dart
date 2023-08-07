import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Modal/country_modal.dart';

class CountryDetailScreen extends StatefulWidget {
  final Country country;
  const CountryDetailScreen({super.key, required this.country});

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Country Detail"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Hero(
                tag: widget.country.flag,
                child: SvgPicture.network(widget.country.flag,fit: BoxFit.cover,)),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("Country name"),
              Text(widget.country.name),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("ISO 2 name"),
              Text(widget.country.iso2),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text("ISO 3 name"),
              Text(widget.country.iso3),
            ],
          ),
        ],
      ),
    );
  }
}
