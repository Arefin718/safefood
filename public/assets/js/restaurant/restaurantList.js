$(document).ready(function(){
    $('#myTable').dataTable();
});


function changeStatus(id) {


    $.ajax({
        type: "POST",
        url: "/restaurant/changestatus",
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
            id : id,
        },
        success: function (result) {

            console.log(result);
        }
    });

}