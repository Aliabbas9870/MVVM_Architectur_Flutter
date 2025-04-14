import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvmapp/data/response/status.dart';
import 'package:mvvmapp/utility/routes/route_names.dart';
import 'package:mvvmapp/view_model/home_view_model.dart';
import 'package:mvvmapp/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    homeViewModel.fetechMovieLsit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPref = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
                onTap: () {
                  userPref.remove().then((val) {
                    Navigator.pushNamed(context, RouteNames.login);
                  });
                },
                child: Text("Logout"))
          ],
        ),
        body: ChangeNotifierProvider<HomeViewModel>(
          create: (BuildContext context) => homeViewModel,
          child: Consumer<HomeViewModel>(builder: (context, val, _) {
            switch (val.movieList.status) {
              case Status.LOADING:
                return CircularProgressIndicator();
              case Status.ERROR:
                return Text(val.movieList.message.toString());
              case Status.COMPLETE:
                return ListView.builder(
                    itemCount: val.movieList.data!.data!.length,
                    itemBuilder: (context, ind) {
                final list=     val.movieList.data!.data![ind];
                     
                      return SingleChildScrollView(
                        child: Card(
                          child: ListTile(
                            leading: CachedNetworkImage(
                              imageUrl: list.posterPath
                                      .toString() ??
                                  '',
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                              fit: BoxFit.cover,
                            ),
                            title: Text(list.originalTitle
                                .toString()),
                            subtitle: Text(list
                            .originalLanguage
                                .toString()),
                                trailing:Text(list.voteAverage.toString())
                          ),
                        ),
                      );
                    });
              default:
            } //nice
            return Container();
          }),
        ));
  }
}
