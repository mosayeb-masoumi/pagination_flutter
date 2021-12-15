
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pagination/static/character_list_item.dart';
import 'package:pagination/static/repository2.dart';
import '../model/character_summary.dart';


class PaginationStatic extends StatefulWidget {
  const PaginationStatic({Key? key}) : super(key: key);

  @override
  _PaginationStaticState createState() => _PaginationStaticState();
}

class _PaginationStaticState extends State<PaginationStatic> {

  static const _pageSize = 8;
  final PagingController<int , CharacterSummary> _pagingController = PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      // final newItems = await RemoteApi.getCharacterList(pageKey, _pageSize);

      final newItems = await MyRepository().fetchPalyListName(pageKey, _pageSize);


      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PagedListView<int, CharacterSummary>.separated(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<CharacterSummary>(
        animateTransitions: true,
        itemBuilder: (context, item, index) => CharacterListItem(character: item, index: index),
        // itemBuilder: (context, item, index) {
        //   return myWidget(context ,item ,index);
        // }


      ),
      separatorBuilder: (context, index) => const Divider(),
    );
  }


  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  // Widget myWidget(BuildContext context, CharacterSummary item, int index) {
  //   return  Container(
  //     margin: EdgeInsets.only(bottom: 50),
  //     padding: EdgeInsets.all(20),
  //     child: Text(item.name+index.toString() , style: TextStyle(fontSize: 15),),
  //   );
  // }

}
