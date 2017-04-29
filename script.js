$(document).ready(function (){
  starter = false;
  if(starter == false){
    swal({
  title: "e<span style= 'background-color: #FA8072'> r </span>i n ' s - <span style='background-color: #00FF7F'>  g </span>a m e - <span style='background-color: #87CEFA'> b </span>o a r d ",
  text: "Move the square in the corner and collect the colors needed to complete the game. Make sure not to step on any other color than the one you need.",
  html: true
  });
  }
for(let i = 0; i < 10; i++){
  $("#wrapper").append("<div class='row" + i + "'>");
  for(let x = 0; x < 10; x++){
    $("#wrapper").append("<div class = 'box' id='" + i + "-" + x + "'></div>")
  }
}
let column = 0;
let row = 0;
//random blocks
for(let i = 0; i <= 25; i++){
  let rand = Math.floor(Math.random() * (10)) + 0;
  let rand2 = Math.floor(Math.random() * (10)) + 0;
  $(`#${rand}-${rand2}`).addClass('block');
}
//random energies
let array = []
for(let i = 0; i <= 11; i++){
  let rgb = "rgb(" + Math.floor(Math.random() * (255)) + ',' + Math.floor(Math.random() * (255)) + ','  + Math.floor(Math.random() * (255)) + ")"
  array.push(rgb);
}
console.log(array);

let colorArray = [];
let i = 0;
while(i <= 11){
  let rand = Math.floor(Math.random() * (10)) + 0;
  let rand2 = Math.floor(Math.random() * (10)) + 0;
  for(let x = 0; x <= colorArray.length - 1; x++){
    if(`${rand}-${rand2}` == colorArray[x]){
      i = i - 1;
    }
  }
    $(`#${rand}-${rand2}`).attr("style", `background: ${array[i]}`).addClass('energy').removeClass('block');
    colorArray.push(`${rand}-${rand2}`);
  i = i + 1;
}
console.log(colorArray);
$(`#${row}-${column}`).addClass('player').removeClass('block');
let arrayNum = 0
$("#scoreboard").append("<br><br><div><h2>color you need: </h2><div class = 'box colorNeed' style = 'background-color:" + array[arrayNum] +"'</div></div>");
function energyCollect (arrayNum, array, row, column){
  console.log(arrayNum);
  //console.log($(`#${row}-${column}`).css("background-color"));
  arrayNum = arrayNum + 1;
  console.log(arrayNum);
  console.log("new color is " + array[arrayNum]);
  $(".box.colorNeed").attr("style", `background: ${array[arrayNum]}`);
  $("#tally").removeClass("number");
  $("#tally").append("heloo");
  $(`#${row}-${column}`).removeClass('energy').attr("style", `background: black`);
  if(arrayNum == array.length){
    swal("SUCCESS", "You have completed the game.", "success");
  }
}
  let noEnergy = 0;
document.onkeydown = function myFunction() {
  switch (event.keyCode) {
    //up key
    case 38:
    //checks if player is on top row
    if(row != 0){
      console.log(noEnergy + 'dsga');
      console.log("color of square is" + $(`#${row}-${column}`).css("background-color"));
      console.log("need cBKJolor:" + array[arrayNum]);
      //collects energy and removes the player from previous position
      $(`#${row}-${column}`).removeClass('player');
      //moves player
      row = row - 1;
      $(`#${row}-${column}`).addClass("player");
      if($(`#${row}-${column}`).hasClass('block')){
        row = row + 1;
        $(`#${row}-${column}`).addClass("player");
        break;
      }
      else if($(`#${row}-${column}`).hasClass('energy')){
        if($(`#${row}-${column}`).css("background-color").replace(/\s+/g, '') == array[arrayNum]){
          energyCollect(arrayNum, array, row, column);
          arrayNum = arrayNum + 1;
        }
        else {
          swal({
          title: "Error!",
          text: "This is not the color you need.",
          type: "error",
          confirmButtonText: "Exit"
        });
        break;
      }
      }
      else {
        $(`#${row}-${column}`).addClass('player');

      }
      break;
    }
    else {
      break;
    }
    //down key
    case 40:
    //checks if player is on bottom row
    if(row != 9){
      console.log("color of square is" + $(`#${row}-${column}`).css("background-color"));
      console.log("need color:" + array[arrayNum]);
      //collects energy and removes the player from previous position
      $(`#${row}-${column}`).removeClass('player');
      row = row + 1;
      $(`#${row}-${column}`).addClass("player");
      if($(`#${row}-${column}`).hasClass('block')){
        row = row - 1;
        $(`#${row}-${column}`).addClass("player");
        break;
      }
      else if($(`#${row}-${column}`).hasClass('energy')){
        if($(`#${row}-${column}`).css("background-color").replace(/\s+/g, '') == array[arrayNum]){
          energyCollect(arrayNum, array, row, column);
          arrayNum = arrayNum + 1;
        }
        else {
          swal({
          title: "Error!",
          text: "This is not the color you need.",
          type: "error",
          confirmButtonText: "Exit"
        });
        break;
      }
      }
      else {
        $(`#${row}-${column}`).addClass('player');
      }
      break;
    }
    else {
      break;
    }
    //right key
    case 39:
    //checks if player is on last column
    if(column != 9){
      console.log(noEnergy);
      console.log("color of square is" + $(`#${row}-${column}`).css("background-color"));
      console.log("need color:" + array[arrayNum]);
      $(`#${row}-${column}`).removeClass('player');
      column = column + 1;
      $(`#${row}-${column}`).addClass("player");
      if($(`#${row}-${column}`).hasClass('block')){
        column = column - 1;
        $(`#${row}-${column}`).addClass("player");
        break;
      }
      else if($(`#${row}-${column}`).hasClass('energy')){
        if($(`#${row}-${column}`).css("background-color").replace(/\s+/g, '') == array[arrayNum]){
          energyCollect(arrayNum, array, row, column);
          arrayNum = arrayNum + 1;
        }
        else {
          swal({
          title: "Error!",
          text: "This is not the color you need.",
          type: "error",
          confirmButtonText: "Exit"
        });
        break;
      }
      }
      else {

        $(`#${row}-${column}`).addClass('player');
      }
      break;
    }
    else {
      break;
    }
    //left key
    case 37:
    //checks if player is in first column
    if(column != 0){
      console.log("color of square is" + $(`#${row}-${column}`).css("background-color"));
      console.log("need color:" + array[arrayNum]);
      $(`#${row}-${column}`).removeClass('player');
      column = column - 1;
      $(`#${row}-${column}`).addClass("player");
      if($(`#${row}-${column}`).hasClass('block')){
        column = column + 1;
        $(`#${row}-${column}`).addClass("player");
        break;
      }
      else if($(`#${row}-${column}`).hasClass('energy')){
        if($(`#${row}-${column}`).css("background-color").replace(/\s+/g, '') == array[arrayNum]){
          energyCollect(arrayNum, array, row, column);
          arrayNum = arrayNum + 1;
          break;
        }
        else {
          swal({
          title: "Error!",
          text: "This is not the color you need.",
          type: "error",
          confirmButtonText: "Exit"
        });
        break;
      }
      }
      else {
        $(`#${row}-${column}`).addClass('player');
        break;
      }
      break;
    }
    else {
      break;
    }
  }
}
})
