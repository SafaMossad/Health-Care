import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../../config/navigation/navigation.dart';
import '../../../../domain/domain.dart';
import '../../../component/components.dart';
import '../../../component/constants/constant.dart';
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
      backgroundColor: ColorManager.grey.withOpacity(0.2),
      appBar: AppBar(
        title: CustomText(
            text: "My Reservations Requests",
            textStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorManager.white)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<LocalAuthProvider>(context, listen: false)
                    .logOut()
                    .then((value) {
                  if (value == true) {
                    NavigationService.pushReplacement(
                        context, Routes.loginScreen);
                  }
                });
              },
              icon: const Icon(Icons.logout,color: ColorManager.blueColor,)),
        ],
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
