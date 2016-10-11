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

var openOne = $("#open_one").html();
function resetOpenOne(event){
  $("#open_one").html(openOne);
}

var closeOne = $("#close_one").html();
function resetCloseOne(event){
  $("#close_one").html(closeOne);
}

var openTwo = $("#open_two").html();
function resetOpenTwo(event){
  $("#open_two").html(openTwo);
}

var closeTwo = $("#close_two").html();
function resetCloseTwo(event){
  $("#close_two").html(closeTwo);
}

$(document).ready(function(){
  $("#open_times_one").hide();
  $("#open_times_two").hide();
});
