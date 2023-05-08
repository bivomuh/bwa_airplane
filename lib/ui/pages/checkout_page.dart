import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/success_checkout_page.dart';
import 'package:airplane/ui/widgets/booking_item_details.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;

  const CheckoutPage(
    this.transaction, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // !Item Details
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 250,
              height: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      'Ciliwung',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    // !Booking Details
    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // !Destination Tile
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaction.destination.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                            fontSize: 18, fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(
                            fontSize: 14, fontWeight: light),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 17,
                      height: 17,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                    const SizedBox(width: 6),
                  ],
                )
              ],
            ),

            // !Booking Details Text
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
            ),

            //!Booking Details Tile
            BookingItemDetails(
                title: 'Travelers',
                valueText: '${transaction.amountOfTraveler} person',
                valueColor: kBlackColor),
            BookingItemDetails(
              title: 'Seat',
              valueText: transaction.selectedSeats,
              valueColor: kBlackColor,
            ),
            BookingItemDetails(
              title: 'Insurance',
              valueText: transaction.insurance ? 'YES' : 'NO',
              valueColor: transaction.insurance ? kGreenColor : kRedColor,
            ),
            BookingItemDetails(
              title: 'Refundable',
              valueText: transaction.refundable ? 'YES' : 'NO',
              valueColor: transaction.refundable ? kGreenColor : kRedColor,
            ),
            BookingItemDetails(
              title: 'VAT',
              valueText: '${(transaction.vat * 100).toStringAsFixed(0)} %',
              valueColor: kBlackColor,
            ),
            BookingItemDetails(
                title: 'Price',
                valueText: NumberFormat.currency(
                  locale: 'id',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(transaction.price),
                valueColor: kBlackColor),
            BookingItemDetails(
                title: 'Grand Total',
                valueText: NumberFormat.currency(
                  locale: 'id',
                  symbol: 'IDR ',
                  decimalDigits: 0,
                ).format(transaction.grandTotal),
                valueColor: kPrimaryColor),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 14),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image_card.png'),
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: defaultMargin,
                                height: defaultMargin,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/icon_plane.png'),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Pay',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                NumberFormat.currency(
                                  locale: 'id',
                                  symbol: 'IDR ',
                                  decimalDigits: 0,
                                ).format(state.user.balance),
                                style: blackTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Current Balance',
                                style:
                                    greyTextStyle.copyWith(fontWeight: light),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }

          return SizedBox();
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child: CircularProgressIndicator(),
            );
          }

          return CustomButton(
            title: 'Pay Now',
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
            margin: const EdgeInsets.only(top: 30),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          children: [
            TextButton(
                onPressed: () {},
                child: Text(
                  'Terms and Conditions',
                  style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: light,
                      decoration: TextDecoration.underline),
                )),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          route(),
          bookingDetails(),
          paymentDetails(),
          payNowButton(),
          tacButton(),
        ],
      ),
    );
  }
}
