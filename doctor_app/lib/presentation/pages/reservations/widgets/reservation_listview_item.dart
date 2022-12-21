import 'package:doctor_app/core/services/extension/dimen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../../../../config/navigation/navigation.dart';
import '../../../../data/models/reservations/reservations_model.dart';
import '../../../component/components.dart';
import '../../../component/constants/constant.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../view_model/reservation_view_model.dart';

class ReservationWidget extends StatefulWidget {
  final ReservationsModel? reservation;

  const ReservationWidget({
    Key? key,
    required this.reservation,
  }) : super(key: key);

  @override
  State<ReservationWidget> createState() => _ReservationWidgetState();
}

class _ReservationWidgetState extends State<ReservationWidget> {
  String status = '';

  @override
  void initState() {
    x();
    super.initState();
  }

  void x() {
    switch (widget.reservation?.reservationStatus) {
      case 1:
        {
          status = "Pending";
        }
        break;
      case 2:
        {
          status = "Accepted";
        }
        break;
      case 3:
        {
          status = "Done";
        }
        break;
      case 4:
        {
          status = "Refuse";
        }
        break;
      default:
        {
          print("Invalid choice");
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
      child: Card(
          elevation: 5,
          color: ColorManager.white,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
            child: Row(
              children: [
                Icon(
                  Icons.work_history,
                  color: ColorManager.greenColor,
                  size: 50.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              text: widget.reservation?.user?.userName ?? "",
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeightManager.bold),
                            ),
                          ),
                          CustomText(
                            text: status,
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontWeight: FontWeightManager.bold,
                                    color:
                                        widget.reservation?.reservationStatus ==
                                                4
                                            ? ColorManager.red
                                            : ColorManager.greenColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                            onPressed: () {
                              Provider.of<ReservationsViewModel>(context,
                                      listen: false)
                                  .updateReservations(
                                      context: context,
                                      reservationId:
                                          widget.reservation?.reservationId,
                                      reservationStatus: 2)
                                  .then((value) => AwesomeDialog(
                                        context: context,
                                        animType: AnimType.scale,
                                        dialogType: DialogType.success,
                                        body: const Center(
                                          child: Text(
                                            'Success Accept Reservation',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        title: 'Success Accept Reservation',
                                        btnOkOnPress: () {
                                          NavigationService.pushReplacement(
                                              context, Routes.reservationsPage);
                                        },
                                      ).show());
                            },
                            textStyle: Theme.of(context).textTheme.labelSmall,
                            buttonText: "Accept",
                            backgroundColor: ColorManager.lightBlueColor,
                            height: 30.h,
                          )),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              child: CustomButton(
                            onPressed: () {
                              Provider.of<ReservationsViewModel>(context,
                                      listen: false)
                                  .updateReservations(
                                      context: context,
                                      reservationId:
                                          widget.reservation?.reservationId,
                                      reservationStatus: 4)
                                  .then((value) => AwesomeDialog(
                                        context: context,
                                        animType: AnimType.scale,
                                        dialogType: DialogType.success,
                                        body: const Center(
                                          child: Text(
                                            'Success Refuse Reservation',
                                            style: TextStyle(
                                                fontStyle: FontStyle.italic),
                                          ),
                                        ),
                                        title: 'Success Update Reservation',
                                        btnOkOnPress: () {
                                          NavigationService.pushReplacement(
                                              context, Routes.reservationsPage);
                                        },
                                      ).show());
                            },
                            buttonText: "Refuse",
                            textStyle: Theme.of(context).textTheme.labelSmall,
                            height: 30.h,
                          )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
