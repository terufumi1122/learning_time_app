// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree

function TimeFormat(time_h,time_m,time_s){
  var str = “”;
  var tmp;
  if(time_h < 100){
    tmp = “00” + String( time_h );
    str += tmp.substr(tmp.length - 2);
  }else{
    str += String( time_h );
  }
  str += “:”;
  tmp = “00” + String( time_m );
  str += tmp.substr(tmp.length - 2);
  str += “:”;
  tmp = “00” + String( time_s );
  str += tmp.substr(tmp.length - 2);

  return str;
}

// 表示された時間を取得する
var time_view = parseInt((new Date)/1000);

// 経過時間を表示する
function TimeLapsed(){
  var now_unixtime = parseInt((new Date)/1000);
  var tmp = now_unixtime - time_view;
  var time_h = Math.floor(tmp/3600);
  var time_m = Math.floor(tmp/60);
  var time_s = tmp - time_m*60 - time_h*3600;

  return TimeFormat(time_h,time_m,time_s);
}

// 経過時間をdiv領域に表示する動作を一定間隔で繰り返す
function TimeLapsedView(){
  document.getElementById(“area_time”).innerHTML = TimeLapsed();
  setTimeout(“TimeLapsedView()”,100);
}
TimeLapsedView();
