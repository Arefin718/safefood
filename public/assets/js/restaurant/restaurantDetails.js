
function printImg() {
  var  popup = window.open();

    popup.document.getElementById("qrcode");
    console.log(document.getElementById("qrcode"));
    popup.focus(); //required for IE
    popup.print();
}





function makeCode () {
    $('#qrcode').html("");
    var qrcode = new QRCode("qrcode");
    var elText = "http://localhost:8000/restaurant/details/"+ $('#restaurant_id').html();

    qrcode.makeCode(elText);

   // printImg();


}

//makeCode();


