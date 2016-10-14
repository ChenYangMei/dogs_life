var myDropzone = false;

$(document).ready(function(){
  Dropzone.autoDiscover = false;

  console.log("bla");
  $("body").on('click', "#directions", function(){
    console.log("hey");
    // console.log(this);
    var dirLat = parseFloat($(this).attr("data-lat"));
    var dirLng = parseFloat($(this).attr("data-lng"));

    calcRoute(dirLat, dirLng);
  });
});


function openAtAllTimes(event) {
  $("#open_times_one").toggle("slow");
}

function addAnother(event) {
  $("#open_times_two").toggle("slow");
}

// Time Block One
function openNumber(event) {
  $("#openSun").remove();
  $("#orOne").remove();
}

function openSun(event) {
  $("#openNumber").remove();
  $("#orOne").remove();
}

function closeNumber(event) {
  $("#closeSun").remove();
  $("#orTwo").remove();
}

function closeSun(event) {
  $("#closeNumber").remove();
  $("#orTwo").remove();
}

// Time Block Two
function openNumberTwo(event) {
  $("#openSunTwo").remove();
  $("#orThree").remove();
}

function openSunTwo(event) {
  $("#openNumberTwo").remove();
  $("#orThree").remove();
}

function closeNumberTwo(event) {
  $("#closeSunTwo").remove();
  $("#orFour").remove();
}

function closeSunTwo(event) {
  $("#closeNumberTwo").remove();
  $("#orFour").remove();
}


// Reset
var openOne;
function resetOpenOne(event){
  $("#open_one").html(openOne);
}

var closeOne;
function resetCloseOne(event){
  $("#close_one").html(closeOne);
}

var openTwo;
function resetOpenTwo(event){
  $("#open_two").html(openTwo);
}

var closeTwo;
function resetCloseTwo(event){
  $("#close_two").html(closeTwo);
}

$(document).ready(function(){

  openOne = $("#open_one").html();
  closeOne = $("#close_one").html();
  openTwo = $("#open_two").html();
  closeTwo = $("#close_two").html();

  $("#open_times_one").hide();
  $("#open_times_two").hide();

  $.cloudinary.config({ cloud_name: 'drubv9lgc', api_key: '248327675289238'});

  // Display Image

  if ($("#images-div").length > 0) {
    var currentURL = window.location.pathname;
    var newURL = currentURL + '/images';
    console.log(newURL);
    $.ajax({
      url: newURL,
      method: "GET",
      dataType: "JSON"
    }).done(function (data) {
      for (var i = 0; i < data.images.length; i++) {
        var image = $.cloudinary.image(data.images[i].public_id, {class: "fade"});
        $("#images-div").append(image);
      }
      $('.fade').slick({
        dots: true,
        infinite: true,
        speed: 500,
        fade: true,
        arrows: true,
        cssEase: 'linear'
      });
    });
  }


  // Reviews
  var handleData = function (e, data) {
    // console.log(data);
    var $display = $("<div>");
    var $name;
    if (data.name !== null) {
      $name = $("<p></p>").text("Created by: " + data.user.name);
    }else{
      $name = $("<p></p>").text("Created by: " + data.user.user_name);
    }

    var $body = $("<p></p>").text(data.body);
    $display.prepend($name);
    $display.prepend($body);

    $("#reviews_display").append($display);

    $("#reviews_input").hide();
  };

  var handleError = function (e, xhr) {
    console.log("moo");
    $("#reviews_display").text("Something went wrong!");
  };

  $("#new_review").on( "ajax:success", handleData )
    .on( "ajax:error", handleError );


  // Drop Zone

  if ( $("form.dropzone").length !== 0) {
    Dropzone.options.myAwesomeDropzone = {
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 2, // MB
      parallelUploads: 6,
  	  url: 'https://api.cloudinary.com/v1_1/cloud9/image/upload',

    };

    myDropzone = new Dropzone($("form.dropzone")[0], {
      url: "https://api.cloudinary.com/v1_1/cloud9/image/upload"
    });

    myDropzone.on('sending', function (file, xhr, formData) {
    	formData.append('api_key', 248327675289238);
    	formData.append('timestamp', Date.now() / 1000 | 0);
    	formData.append('upload_preset', 'dogslife');
    });
    myDropzone.on('success', function (file, response) {
      // Send an AJAX request specifying which area it is
      var currentURL = window.location.pathname;
      var newURL = currentURL + "/new_image";

      $.ajax({
        url: newURL,
        method: "POST",
        dataType: "JSON",
        data: {
          response: response
        }
      }).done(function (data) {
        var content = $.cloudinary.image(data.public_id, { width: 200, height: 150, crop: 'fill' });
        $(".image_new").append(content);
      });

    });
  }

});
