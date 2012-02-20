// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require gmaps4rails/bing.js
//= require gmaps4rails/googlemaps.js
//= require gmaps4rails/mapquest.js
//= require gmaps4rails/openlayers.js
//= require gmaps4rails/all_apis.js
//= require twitter/bootstrap

Gmaps4Rails.prototype.createSidebar = function(marker_container) {
  var aSel, currentMap, html, li, ul, tbody;
  if (this.markers_conf.list_container) {
    ul = document.getElementById(this.markers_conf.list_container);
    li = document.createElement('tr');
    // aSel = document.createElement('a');
    // aSel.href = 'javascript:void(0);';
    html = marker_container.sidebar != null ? marker_container.sidebar : "Marker";
    // aSel.innerHTML = html;
    currentMap = this;
    li.onclick = this.sidebar_element_handler(currentMap, marker_container.serviceObject, 'click');
    li.innerHTML = html;
    return $('#' + this.markers_conf.list_container + ' tbody').append(li);
  }
};

Gmaps4Rails.prototype.resetSidebarContent = function() {
  if (this.markers_conf.list_container) {
    ul = document.getElementById(this.markers_conf.list_container);
    $('tbody', ul).html('');
  }
};
  
