import 'package:season_sir_mobileapp/gridview.dart';
import 'package:season_sir_mobileapp/views/chatapp/Chats.dart';
import 'package:season_sir_mobileapp/views/chatapp/conversations.dart';
import 'package:season_sir_mobileapp/views/demoapp/loginpage.dart';
import 'package:season_sir_mobileapp/views/esewatest/esewa.dart';
import 'package:season_sir_mobileapp/views/maps/mapspage.dart';
import 'package:season_sir_mobileapp/views/news/dashboard.dart';
import 'package:season_sir_mobileapp/views/news/detailpage.dart';
import 'package:season_sir_mobileapp/views/webview/webview.dart';

class AppRoute{
  AppRoute._();
  static const String login = '/';
  static const String dashboardroute = '/dashboard';
  static const String detailPage = '/detailPage';
  static const String conversation = '/conversation';
  static const String chats = '/chats';
  static const String esewa = '/esewa';
  static const String maps = '/maps';
  static const String signup = '/signup';
  static const String webview ='/webview';
  static const String gridapppage ='/grid';

  static getAppRoutes() => {
    login: (context) => loginpage(),
    dashboardroute: (context) => const dashboard(),
    gridapppage: (context) => const GridViewApp(),
    detailPage: (context) => const detailpage(),
    conversation: (context) => Conversations(),
    chats: (context) => Chats(),
    esewa: (context) => EsewaApp(title: '',),
    maps: (context) => MapsPage(),
    webview: (context) => WebViewPage(),
  };
}