import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../theme/pallet_color.dart';
import '../../home/model/catalog_model.dart';
import '../bloc/detail_catalog_bloc.dart';
import '../model/detail_catalog_model.dart';

class DetailCatalogScreen extends StatelessWidget{
  const DetailCatalogScreen({
    super.key,
    required this.catalog
  });
  final Catalog catalog;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailCatalogBloc(),
      child: DetailCatalogView(catalog: catalog) ,
    );
  }
}

class DetailCatalogView extends StatefulWidget{
  const DetailCatalogView({
    super.key,
    required this.catalog
  });
  final Catalog catalog;
  @override
  State<DetailCatalogView> createState() => _DetailCatalogViewState();
}

class _DetailCatalogViewState extends State<DetailCatalogView> {
  DetailCatalog? detailCatalog;
  
  @override
  void initState() {
    super.initState();
    context.read<DetailCatalogBloc>().add(DetailCatalogInitialEvent(widget.catalog.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(widget.catalog.name)),
      body: BlocConsumer<DetailCatalogBloc, DetailCatalogState>(
        listener:(context, state) {
          if(state is DetailCatalogInitialFailureState){
            showTopSnackBar(Overlay.of(context),
            CustomSnackBar.error(message: state.error));
          }
           if(state is DetailCatalogInitialSuccesState){
            detailCatalog = state.detailCatalog;
           }
        },
        builder: (context, state) {
          if(state is DetailCatalogInitialFailureState) {
            return const Center();
          }
          if(state is DetailCatalogInitialSuccesState) {
            return detailCatalog == null
            ? Center(child: Text('tidak ada data',style: TextStyle(color: C1),))
            : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detailCatalog!.id,
                    style: TextStyle(color: C1)
                  ),
                  Text(
                    detailCatalog!.name,
                    style: TextStyle(color: C1)
                  ),
                  Text(
                    detailCatalog!.speed,
                    style: TextStyle(color: C1)
                  ),
                  Text(
                    detailCatalog!.price.toString(),
                    style: TextStyle(color: C1)
                  ),
                  Text(
                    detailCatalog!.merchant.id,
                    style: TextStyle(color: C1)
                  ),
                  Text(
                    detailCatalog!.merchant.name,
                    style: TextStyle(color: C1)
                  ),
                  Text(
                    detailCatalog!.merchant.email,
                    style: TextStyle(color: C1)
                  ),
                  Text(
                    detailCatalog!.servicePlanId,
                    style: TextStyle(color: C1)
                  ),
                  Text(
                    detailCatalog!.servicePlan.name,
                    style: TextStyle(color: C1)
                  ),
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(
              color: C1,
            ),
          );
        },
      ),
    );
  }
}