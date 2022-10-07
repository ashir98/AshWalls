import 'dart:convert';

import 'package:ash_walls/Models/category_wallpaper_model.dart';
import 'package:ash_walls/Models/wallpaper_model.dart';
import 'package:http/http.dart' as http;

class Service{


  Future<WallpaperModel> getWallpaper()async{

    final response =  await http.get(Uri.parse('https://api.pexels.com/v1/curated?per_page=50'),
    headers: {'Authorization':'563492ad6f91700001000001da2f329f1458418f899c97a220ce22b9'});
    
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      return WallpaperModel.fromJson(data);
    }else{
      return WallpaperModel.fromJson(data);
    }

  }

  Future<CategoryWallpaperModel> getCategoryWallpaper(String query)async{
    final response = await http.get(Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=80&orientation=portrait&per_page=50",),
    headers: {'Authorization':"563492ad6f91700001000001da2f329f1458418f899c97a220ce22b9"});

    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      return CategoryWallpaperModel.fromJson(data);

    }else{
      return CategoryWallpaperModel.fromJson(data);
    }
  }






}