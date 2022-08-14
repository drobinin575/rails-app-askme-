// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import './add_jquery'
import "@hotwired/turbo-rails"
import "controllers"

$(document).ready(function(){
    $("button .text-sm").click(function(){
        $(".color-field").attr("value", "#370617");
    });
});
