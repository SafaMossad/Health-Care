import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:patient_app/config/navigation/navigation.dart';
import 'package:patient_app/core/services/extension/dimen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:patient_app/data/models/doctors/doctor_model.dart';
import 'package:provider/provider.dart';
import '../../../component/components.dart';
import '../../../component/constants/constant.dart';
import '../../home/view_model/request_doctor_view_model.dart';

class TopRateDoctorsGridWidget extends StatelessWidget {
  final DoctorModel? doctor;

  const TopRateDoctorsGridWidget({
    Key? key,
    required this.doctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
      child: InkWell(
        onTap: () {
          NavigationService.push(context, Routes.doctorDetails, arguments: {
            "doctorData": doctor,
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            border: Border.all(color: ColorManager.testFieldBorderColorBEBEBE),
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [customContainerShadow()],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: CustomNetworkImage(
                  image: doctor?.imageUrl ?? "",
                  boxFit: BoxFit.contain,
                  width: double.infinity,
                  height: 110.h,
                ),
              ),
              const Spacer(),
              CustomText(
                text: doctor?.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: ColorManager.lightBlack,
                    letterSpacing: -0.2,
                    fontWeight: FontWeightManager.medium),
              ),
              RatingBar.builder(
                initialRating: doctor?.rate ?? 0.0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0.w),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  size: 15.w,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
                ignoreGestures: true,
                itemSize: 15.h,
              ),
              const Spacer(),
              CustomText(
                text: doctor?.specialist ?? "",
                overflow: TextOverflow.ellipsis,
                textStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: ColorManager.greenColor,
                    fontWeight: FontWeightManager.semiBold),
              ),
              const Spacer(),
              Center(
                child: CustomButton(
                  onPressed: () {
                    Provider.of<RequestDoctorsViewModel>(context, listen: false)
                        .requestDoctors(context: context, doctorId: doctor?.id)
                        .then((value) {
                      AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.success,
                        body: const Center(
                          child: Text(
                            'Your Request Sent Successfully',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                        title: 'Success Reservation',
                        btnOkOnPress: () {},
                      ).show();
                    });
                  },
                  // icon: const Icon(Icons.shopping_cart_sharp),
                  buttonText: "Order Now",
                  height: 33.h,
                  backgroundColor: ColorManager.blueColor,
                  //  width: 114.w,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
