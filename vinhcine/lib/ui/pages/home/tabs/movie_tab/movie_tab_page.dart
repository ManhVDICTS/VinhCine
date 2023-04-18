import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinhcine/commons/app_colors.dart';
import 'package:vinhcine/generated/l10n.dart';
import 'package:vinhcine/ui/components/loading_footer_widget.dart';
import 'package:vinhcine/ui/pages/home/tabs/movie_tab/movie_tab_cubit.dart';
import 'package:vinhcine/ui/rows/movie_widget.dart';
import 'package:vinhcine/ui/widgets/app_bar_widget.dart';
import 'package:vinhcine/ui/widgets/customized_scaffold_widget.dart';
import 'package:vinhcine/ui/widgets/error_list_widget.dart';
import 'package:vinhcine/ui/widgets/loading_list_widget.dart';
import 'package:vinhcine/ui/widgets/status_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart' as refresh;

class MovieTabPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MovieTabPageState();
  }
}

class _MovieTabPageState extends State<MovieTabPage> with AutomaticKeepAliveClientMixin {
  late MovieTabCubit _cubit;

  refresh.RefreshController _refreshController = refresh.RefreshController();

  StreamSubscription? _messageSubscription;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _cubit = context.read<MovieTabCubit>();
    super.initState();
    _cubit.fetchMovieList(isReloaded: true);
    _messageSubscription = _cubit.messageController.stream.listen((event) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(event)));
    });
  }

  @override
  void dispose() {
    _messageSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CustomizedScaffold(
      appBar: AppBarWidget(title: S.of(context).movies),
      body: _buildBodyWidget(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: AppColors.main,
        onPressed: () {
          _cubit.addNewMovie();
        },
      ),
    );
  }

  Widget _buildBodyWidget() {
    return BlocConsumer<MovieTabCubit, MovieTabState>(
      listenWhen: (prev, current) {
        return current is FetchingDataSuccessfully || current is DidAnythingFail;
      },
      listener: (context, state) {
          _refreshController.loadComplete();
      },
      buildWhen: (prev, current) {
        return current is FetchingDataSuccessfully || current is WaitingForFetchingData;
      },
      builder: (context, state) {
        if (state is WaitingForFetchingData) {
          return _buildLoadingList();
        } else if (state is DidAnythingFail) {
          return _buildFailureList();
        } else if (state is FetchingDataSuccessfully) {
          return RefreshIndicator(
            child: refresh.SmartRefresher(
              controller: _refreshController,
              onLoading: () => _cubit.fetchMovieList(),
              enablePullUp: state.canLoadMore && state.currentPage <= 3, /// TODO load more 2 page thì dừng lại
              enablePullDown: false,
              footer: CustomFooterWidget(horizontal: 20, vertical: 16),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Container(
                        height: 1.0,
                        color: AppColors.lightGray,
                      ),
                    ),
                itemBuilder: (context, int index) {
                  final item = state.movies?[index];
                  return GestureDetector(
                    onLongPress: (){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            CupertinoAlertDialog(
                              title: Text(S.of(context).message),
                              content: Text(S.of(context).do_you_want_to_delete),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    S.of(context).cancel,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  onPressed: () async {
                                    bool deleteSuccess = _cubit.deleteMovie(item?.id ?? -1);
                                    if(deleteSuccess){
                                      Navigator.pop(context);
                                    }
                                    /*Navigator.pop(context);*/
                                  },
                                  child: Text(S.of(context).delete),
                                )
                              ],
                            ),
                      );
                    },
                    child: MovieWidget(
                      movie: item,
                      onPressed: () {},
                    ),
                  );
                },
                padding: EdgeInsets.zero,
                itemCount: state.movies?.length ?? 0,
              ),
            ),
            onRefresh: _refreshMovieList,
          );
        } else
        return Container();
      },
    );
  }

  Widget _buildLoadingList() {
    return LoadingListWidget();
  }

  Widget _buildFailureList() {
    return ErrorListWidget(
      onRefresh: _refreshMovieList,
    );
  }

  Future<void> _refreshMovieList() async {
    _cubit.fetchMovieList(isReloaded: true);
  }
}
