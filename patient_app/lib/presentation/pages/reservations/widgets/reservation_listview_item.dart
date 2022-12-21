import 'package:flutter/material.dart';
import 'package:patient_app/config/navigation/navigation.dart';
import 'package:patient_app/core/services/extension/dimen.dart';

import 'package:patient_app/data/models/reservations/reservations_model.dart';
import '../../../component/components.dart';
import '../../../component/constants/constant.dart';

class ReservationWidget extends StatefulWidget {
  final ReservationsModel? reservation;

  ReservationWidget({
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
          status = "Cancel";
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
        child: ListTile(
          leading: Icon(
            Icons.work_history,
            color: ColorManager.greenColor,
            size: 50.w,
          ),
          title: CustomText(
            text: widget.reservation?.doctor?.name ?? "",
            textStyle: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeightManager.bold),
          ),
          subtitle: CustomText(
              text: widget.reservation?.doctor?.specialist ?? "",
              textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: ColorManager.primaryColor,
                fontWeight: FontWeightManager.medium
              )),
          trailing: CustomText(
              text: status ?? "",
              textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: ColorManager.blueColor,
                fontWeight: FontWeightManager.bold
              )),
        ),
      ),
    );
  }
}
