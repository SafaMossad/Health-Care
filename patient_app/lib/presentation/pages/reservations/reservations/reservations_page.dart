import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/core/services/extension/dimen.dart';
import 'package:patient_app/presentation/component/components.dart';
import 'package:patient_app/presentation/component/constants/constant.dart';
import 'package:provider/provider.dart';

import '../../../component/custom_widgets/custom_loading_widget.dart';
import '../reservations.dart';
import '../view_model/reservation_view_model.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({Key? key}) : super(key: key);

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel =
        Provider.of<ReservationsViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
            text: "My Reservations",
            textStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorManager.white)),
        automaticallyImplyLeading: false,
        centerTitle: true,

      ),
      body: FutureBuilder(
          future: viewModel.getReservations(context: context),
          builder: (ctx, data) {
            if (data.connectionState == ConnectionState.waiting ||
                data.hasError) {
              return const Center(
                child: CustomLoadingWidget(),
              );
            } else {
              return Consumer<ReservationsViewModel>(
                builder: (_, listData, ch) {
                  if (listData.reservationList == null) {
                    return const Center(
                        child: CustomText(text: "Some Thing went Wrong"));
                  } else if (listData.reservationList!.isEmpty) {
                    return const CustomText(
                      text: "No Data Yet",
                    );
                  } else {
                    return ListView.builder(
                        itemCount: listData.reservationList?.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return ReservationWidget(
                            reservation: listData.reservationList?[index],
                          );
                        });
                  }
                },
              );
            }
          }),
    );
  }
}
