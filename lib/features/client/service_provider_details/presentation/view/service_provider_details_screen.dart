import 'dart:developer';

import 'package:flutter/material.dart';

import 'widgets/service_provider_details_body.dart';

class ServiceProviderDetailsScreen extends StatelessWidget {
  const ServiceProviderDetailsScreen({super.key, required this.id});

  final int id;
  @override
  Widget build(BuildContext context) {
    log("id $id");
    return Scaffold(body: ServiceProviderDetailsBody(id: id));
  }
}
