function AddInspection() {

    var restaurant_id=$('#form_restaurant_id').val();
    var id=$('#form_id').val();

    var inspection_date=$('#form_inspection_date').val();
    var current_category=$('#form_category').val();
    var inspected_by=$('#form_inspected_by').val();

        $.ajax({
            type: "POST",
            url: "/company/addinspection",
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            },
            data: {
                id:id,
                restaurant_id : restaurant_id,
                inspection_date : 	inspection_date,
                current_category:current_category,
                inspected_by:	inspected_by,

            },
            success: function (result) {

                console.log(result);
            }
        });


}