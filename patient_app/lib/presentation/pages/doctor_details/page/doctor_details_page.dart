import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:patient_app/core/services/extension/dimen.dart';
import 'package:patient_app/data/models/doctors/doctor_model.dart';
import 'package:patient_app/presentation/component/constants/constant.dart';
import 'package:provider/provider.dart';

import '../../../component/components.dart';
import '../../home/view_model/request_doctor_view_model.dart';

class DoctorDetailsPage extends StatelessWidget {
  const DoctorDetailsPage({Key? key, required this.doctorData})
      : super(key: key);
  final DoctorModel? doctorData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: doctorData?.name ?? "",
          textStyle: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: ColorManager.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomNetworkImage(
            image: doctorData?.imageUrl ?? "",
            height: 200,
            width: double.infinity,
            boxFit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              SizedBox(
                height: 20.h,
              ),

            RatingBar.builder(
              initialRating: doctorData?.rate ??0.0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding:  EdgeInsets.symmetric(horizontal: 1.0.w),
              itemBuilder: (context, _) =>  Icon(
                Icons.star,
                size: 20.w,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
              ignoreGestures: true,
              itemSize: 20.h,

            ),



              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: "DR-name : ",
                    overflow: TextOverflow.ellipsis,
                    textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.lightBlack,
                        fontWeight: FontWeightManager.semiBold),
                  ),
                  Expanded(
                    child: CustomText(
                      text: doctorData?.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: ColorManager.primaryColor,
                              fontWeight: FontWeightManager.medium),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Address : ",
                    overflow: TextOverflow.ellipsis,
                    textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.lightBlack,
                        fontWeight: FontWeightManager.semiBold),
                  ),
                  Expanded(
                    child: CustomText(
                      text: doctorData?.address ?? "",
                      overflow: TextOverflow.ellipsis,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: ColorManager.primaryColor,
                              fontWeight: FontWeightManager.medium),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Specialist : ",
                    overflow: TextOverflow.ellipsis,
                    textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.lightBlack,
                        fontWeight: FontWeightManager.semiBold),
                  ),
                  Expanded(
                    child: CustomText(
                      text: doctorData?.specialist,
                      overflow: TextOverflow.ellipsis,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: ColorManager.primaryColor,
                              fontWeight: FontWeightManager.medium),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Working Time : ",
                    overflow: TextOverflow.ellipsis,
                    textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: ColorManager.lightBlack,
                        fontWeight: FontWeightManager.semiBold),
                  ),
                  Expanded(
                    child: CustomText(
                      text:
                          "${doctorData?.avaliableFrom}AM - ${doctorData?.avaliableFrom}PM",
                      overflow: TextOverflow.ellipsis,
                      textStyle: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(
                              color: ColorManager.primaryColor,
                              fontWeight: FontWeightManager.medium),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Bio : ",
                    overflow: TextOverflow.ellipsis,
                    textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.lightBlack,
                          fontWeight: FontWeightManager.semiBold,
                        ),
                  ),
                  Expanded(
                    child: CustomText(
                      text: "${doctorData?.bio}",
                      overflow: TextOverflow.ellipsis,
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeightManager.medium,

                              ),    maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Price : ",
                    overflow: TextOverflow.ellipsis,
                    textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.lightBlack,
                          fontWeight: FontWeightManager.semiBold,
                        ),
                  ),
                  Expanded(
                    child: CustomText(
                      text: doctorData?.price.toString() ?? "",
                      overflow: TextOverflow.ellipsis,
                      textStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: ColorManager.primaryColor,
                                fontWeight: FontWeightManager.medium,
                              ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: CustomButton(
                  onPressed: () {
                    Provider.of<RequestDoctorsViewModel>(context, listen: false)
                        .requestDoctors(
                      context: context,
                      doctorId: doctorData?.id,
                    )
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
                  backgroundColor: ColorManager.blueColor,
                  //  width: 114.w,
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
