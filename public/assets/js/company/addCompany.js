$(document).ready(function() {
    $.fn.datepicker.defaults.format = "yyyy-mm-dd";
    alert("test");
    $('.reg_date').datepicker({


    });


    var uploadField = document.getElementById("company_image");
    var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];
    uploadField.onchange = function() {
        if(this.files[0].size > 2000000){
            alert("File is too big!");
            this.value = "";
        }else{
            var sFileName = uploadField.value;
            var fileExtension=filename.split('.').pop();
            var blnValid=false;
            for (var j = 0; j < _validFileExtensions.length; j++) {
                var sCurExtension = _validFileExtensions[j];
                if (fileExtension==sCurExtension.toLowerCase()) {
                    blnValid = true;
                    break;
                }
            }

            if (!blnValid) {
                alert("Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", "));
                return false;
            }
        }
    }


});


public GetAddress()
{
    var address = $('#location_english').val();
    if(address != null) {
        jQuery.ajax({
            type: "GET",
            dataType: "json",
            url: "http://maps.googleapis.com/maps/api/geocode/json",
            data: {'address': address, 'sensor': false},
            success: function (data) {
                if (data.results.length) {
                    jQuery('#latitude').val(data.results[0].geometry.location.lat);
                    jQuery('#longitude').val(data.results[0].geometry.location.lng);
                    console.log(jQuery('#latitude').val(data.results[0].geometry.location.lat));
                } else {
                    jQuery('#latitude').val('invalid address');
                    jQuery('#longitude').val('invalid address');
                }
            }
        });
    }
}