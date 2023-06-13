import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefexample/exceptions/shared_not_initialize_exception.dart';

enum SharedKeys{
  userName,notification,darkMode,google,facebook
}

abstract class ISharedManager{
  Future<void> saveString(SharedKeys key,String value);
  String? getString(SharedKeys key);
  Future<void> saveBool(SharedKeys key,bool value);
  bool? getBool(SharedKeys key);
  Future<bool> removeItems(SharedKeys key);
}

class SharedManager implements ISharedManager{
  SharedPreferences? preferences;

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }
  SharedManager(){
    init();
  }
  void _checkPreferences(){
    if(preferences == null){
      throw SharedNotInitializeException();
    }
  }

  @override
  Future<void> saveString(SharedKeys key,String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  @override
  String? getString(SharedKeys key){
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  @override
  Future<void> saveBool(SharedKeys key,bool value) async{
    _checkPreferences();
    await preferences?.setBool(key.name, value);
  }
  @override
  bool? getBool(SharedKeys key){
    _checkPreferences();
    return preferences?.getBool(key.name);
  }

  @override
  Future<bool> removeItems(SharedKeys key) async{
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}

///shared_pref map şeklinde veri alıyor: key-value=> burda key= string value temel tipleri!
/*
SharedPreferences.getInstance() metodu, cihazdaki yerel depolama sistemine erişim sağlar ve verileri okur veya yazabilir.
 Bu işlem cihazın performansına bağlı olarak zaman alabilir ve asenkron bir şekilde gerçekleştirilir. Bu nedenle, bu işlem
  tamamlandığında çalışması gereken kodu beklemek için await kullanıyoruz.


  biz neden generic yapıyoruz cünkü shared paketi biraz sınırlı tür açısından o yuzden mesela metotların dynamic yaparsak eger
    dynamic getValue(SharedKeys key) {
    _checkPreferences();
    return preferences?.get(key.toString());
  }

  Future<void> saveValue(SharedKeys key, dynamic value) async {
    _checkPreferences();
    await preferences?.set(key.toString(), value);
  }
  bu sekilde o zaman her türde veri gelir ve class türünde vs o zaman crashı yeriz burda generici kullanarak sağladıgı temel
  veri türlerini aldırtabiliriz! bu sayede kolay temiz ve okunur bi manager yazarız!
 */