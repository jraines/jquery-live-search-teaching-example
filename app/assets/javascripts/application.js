// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//Here we replicate the _product partial
//The ugliness here is a big part of why many
//front-end frameworks exist -- just to have
//better templating for client side views
function productTemplate(p){
  return "<div class='product'>" +
         "<p>id: " + p.id +
         "</p>" +
         "<p>name: " + p.name +
         "</p>" +
         "<p>description: " + p.description +
         "</p>" +
         "</div>"
}

function renderSearchResults(data){
  results = data.map(productTemplate).join("");
  $("#products").html(results)
}

function performSearch(e){
  urlBase = "/search?query=";
  url     = urlBase + $(e.target).val();
  $.getJSON(url, renderSearchResults)
}


$(document).ready(function(){
  $("#search").keyup(performSearch);
});
