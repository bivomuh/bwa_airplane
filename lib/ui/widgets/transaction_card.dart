import 'package:airplane/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import 'booking_item_details.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
