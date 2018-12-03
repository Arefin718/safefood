$(document).ready(function() {

//Image varification
    var uploadField = document.getElementById("company_image");
    var _validFileExtensions = ["jpg", "jpeg", "bmp", "gif", "png"];
    uploadField.onchange = function() {
        if(this.files[0].size > 2000000){
            alert("File is too big!");
            this.value = "";
        }else{
            var sFileName = uploadField.value;
            var fileExtension=sFileName.split('.').pop();
            console.log(fileExtension);

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
                this.value = "";
                return false;
            }
        }
    }




    //load google map
    initialize();

    DivisionSelect();

    /*
     * autocomplete location search
     */
    var PostCodeid = '#search_location';
    console.log(PostCodeid);
    $(function () {
        $(PostCodeid).autocomplete({

            source: function (request, response) {
                geocoder.geocode({
                    'address': request.term
                }, function (results, status) {
                    response($.map(results, function (item) {
                        return {
                            label: item.formatted_address,
                            value: item.formatted_address,
                            lat: item.geometry.location.lat(),
                            lon: item.geometry.location.lng()
                        };
                    }));
                });
            },
            select: function (event, ui) {
                $('.search_addr').val(ui.item.value);
                $('.search_latitude').val(ui.item.lat);
                $('.search_longitude').val(ui.item.lon);
                var latlng = new google.maps.LatLng(ui.item.lat, ui.item.lon);
                marker.setPosition(latlng);
                initialize();
            }
        });
    });

    /*
     * Point location on google map
     */
    $('.get_map').click(function (e) {
        var address = $(PostCodeid).val();
        geocoder.geocode({ 'address': address }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker.setPosition(results[0].geometry.location);
                $('.search_addr').val(results[0].formatted_address);
                $('.search_latitude').val(marker.getPosition().lat());
                $('.search_longitude').val(marker.getPosition().lng());
            } else {
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        e.preventDefault();
    });

    //Add listener to marker for reverse geocoding
    google.maps.event.addListener(marker, 'drag', function () {
        geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                if (results[0]) {
                    $('.search_addr').val(results[0].formatted_address);
                    $('.search_latitude').val(marker.getPosition().lat());
                    $('.search_longitude').val(marker.getPosition().lng());
                }
            }
        });
    });
});

var geocoder;
var map;
var marker;

/*
 * Google Map with marker
 */
function initialize() {
    var initialLat = $('.search_latitude').val();
    var initialLong = $('.search_longitude').val();
    initialLat = initialLat ? initialLat : 23.777176;
    initialLong = initialLong ? initialLong : 90.399452;

    var latlng = new google.maps.LatLng(initialLat, initialLong);
    var options = {
        zoom: 16,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("geomap"), options);

    geocoder = new google.maps.Geocoder();

    marker = new google.maps.Marker({
        map: map,
        draggable: true,
        position: latlng
    });

    google.maps.event.addListener(marker, "dragend", function () {
        var point = marker.getPosition();
        map.panTo(point);
        geocoder.geocode({ 'latLng': marker.getPosition() }, function (results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                marker.setPosition(results[0].geometry.location);

                $('#search_location').val(results[0].formatted_address);
                $('.search_addr').val(results[0].formatted_address);
                $('.search_latitude').val(marker.getPosition().lat());
                $('.search_longitude').val(marker.getPosition().lng());
            }
        });
    });

}

function DivisionSelect(){
    $('#division').on('change', function() {
        // DistrictSelect();
        $division_id=this.value;

        $.ajax({
            url: '/districtlist',
            type: 'GET',
            data: {'division_id': $division_id},
            success: function (response) {
                if(response.length>0) {
                    var districts="";
                    console.log(response);
                    for (var i = 0; i < response.length; i++) {
                        districts+='<option value="'+response[i]['district_id']+'">'+response[i]['title_english']+'</option>';
                    }

                }
                $('#district').html(districts);
                DistrictSelect();

            },
            error: function (response) {
                console.log(response);

            }
        });

    });
}

function DistrictSelect(){
    $('#district').on('change', function() {
        $district_id=this.value;
        console.log("district selected");
        $.ajax({
            url: '/thanaupazilalist',
            type: 'GET',
            data: {'district_id': $district_id},
            success: function (response) {
                if(response.length>0) {
                    var thana_upazila="";
                    console.log(response);
                    for (var i = 0; i < response.length; i++) {
                        thana_upazila+='<option value="'+response[i]['upazila_id']+'">'+response[i]['title_english']+'</option>';
                    }

                }
                $('#upazila').html(thana_upazila);
            },
            error: function (response) {
                console.log(response);

            }
        });
    });
}

