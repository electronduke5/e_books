import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/review.dart';
import '../cubits/models_status.dart';
import '../cubits/review/review_cubit.dart';
import '../widgets/review_widget.dart';

class UserReviewsPage extends StatefulWidget {
  UserReviewsPage({Key? key}) : super(key: key);
  List<Review>? reviews;
  @override
  State<UserReviewsPage> createState() => _UserReviewsPageState();
}

class _UserReviewsPageState extends State<UserReviewsPage> {
  @override
  Widget build(BuildContext context) {
     widget.reviews = ModalRoute.of(context)!.settings.arguments as List<Review>?;
    return Scaffold(
      appBar: AppBar(
        title: Text('Мои отзывы'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<ReviewCubit, ReviewState>(
            listener: (context, state) async {
              if(state.deleteStatus.runtimeType == LoadedStatus) {
                List<Review>? loadedReviews = await context.read<ReviewCubit>().loadUserReview();
                setState(() {
                  widget.reviews = loadedReviews ?? widget.reviews;
                });
              }
            },
            child: ListView.builder(
              itemCount: widget.reviews!.length,
              itemBuilder: (context, index) {
                return ReviewCard(
                  review: widget.reviews![index],
                  isUserReview: true,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
