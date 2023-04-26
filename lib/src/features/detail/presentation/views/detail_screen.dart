import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vinhcine/src/features/detail/domain/models/genre.dart';
import 'package:vinhcine/src/features/detail/presentation/cubit/detail_cubit.dart';
import 'package:vinhcine/src/core/di/injections.dart';

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailCubit>(
      create: (_) => di<DetailCubit>()..getMovieGenres(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Details Screen')),
        body: BlocBuilder<DetailCubit, DetailState>(builder: (context, state) {
          if(state is DetailSuccess){
            return RefreshIndicator(
              onRefresh: () => context
                  .read<DetailCubit>()
                  .getMovieGenres(),
              child: _buildListWidget(data: state.data, context: context),
            );
          } else {
            return const Center(child: Text("Error"),);
          }
        }),
      ),
    );
  }

  Widget _buildListWidget({required List<GenreModel> data, required BuildContext context}){
    return ListView.separated(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Text(
              data[index].name ?? '',
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 1, color: Colors.grey,);
        },
    );
  }
}
