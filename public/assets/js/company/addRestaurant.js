public GetAddress()
{
    var address = 'B-56+Sector-64+Noida+up+india';//address which you want Longitude and Latitude
    jQuery.ajax({
        type: "GET",
        dataType: "json",
        url: "http://maps.googleapis.com/maps/api/geocode/json",
        data: {'address': address, 'sensor': false},
        success: function (data) {
            if (data.results.length) {
                jQuery('#latitude').val(data.results[0].geometry.location.lat);
                jQuery('#longitude').val(data.results[0].geometry.location.lng);
            } else {
                jQuery('#latitude').val('invalid address');
                jQuery('#longitude').val('invalid address');
            }
        }
    });
}