import 'package:flutter_learn/generated/json/base/json_convert_content.dart';

class HomeEntity with JsonConvert<HomeEntity> {
	HomeData data;
	int errorCode;
	String errorMsg;
}

class HomeData with JsonConvert<HomeData> {
	int curPage;
	List<HomeDataData> datas;
	int offset;
	bool over;
	int pageCount;
	int size;
	int total;
}

class HomeDataData with JsonConvert<HomeDataData> {
	String apkLink;
	int audit;
	String author;
	bool canEdit;
	int chapterId;
	String chapterName;
	bool collect;
	int courseId;
	String desc;
	String descMd;
	String envelopePic;
	bool fresh;
	int id;
	String link;
	String niceDate;
	String niceShareDate;
	String origin;
	String prefix;
	String projectLink;
	int publishTime;
	int selfVisible;
	int shareDate;
	String shareUser;
	int superChapterId;
	String superChapterName;
	List<dynamic> tags;
	String title;
	int type;
	int userId;
	int visible;
	int zan;
}
