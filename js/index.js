

  //test for getting url value from attr
// var img1 = $('.test').attr("data-thumbnail");
// console.log(img1);

//test for iterating over child elements
var langArray = [];
$('.vodiapicker option').each(function(){
  var img = $(this).attr("data-thumbnail");
  var text = this.innerText;
  var value = $(this).val();
  var item = '<li><img src="'+ img +'" alt="" value="'+value+'"/><span>'+ text +'</span></li>';
  langArray.push(item);
})

$('#country-ul').html(langArray);

//Set the button value to the first el of the array
$('.btn-drp').html(langArray[0]);
$('.btn-drp').attr('value', 'en');

//change button stuff on click
$('#country-ul li').click(function(){
   var img = $(this).find('img').attr("src");
   var value = $(this).find('img').attr('value');
   var text = this.innerText;
   var item = '<li><img src="'+ img +'" alt="" /><span>'+ text +'</span></li>';
  $('.btn-drp').html(item);
  $('.btn-drp').attr('value', value);
  $(".drp-contain").toggle();
  //console.log(value);
});

$(".btn-drp").click(function(){
        $(".drp-contain").toggle();
    });

//check local storage for the lang
var sessionLang = localStorage.getItem('lang');
if (sessionLang){
  //find an item with value of sessionLang
  var langIndex = langArray.indexOf(sessionLang);
  $('.btn-drp').html(langArray[langIndex]);
  $('.btn-drp').attr('value', sessionLang);
} else {
   var langIndex = langArray.indexOf('ch');
  console.log(langIndex);
  $('.btn-drp').html(langArray[langIndex]);
  //$('.btn-drp').attr('value', 'en');
}


