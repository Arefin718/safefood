<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Companys extends Model
{
public static function SearchRestaurantByKeywords($key_words){
$restaurants=DB::select("

SELECT
    *
FROM
    restaurants
WHERE
    title_english LIKE '%$key_words%' 
    OR title_bangla LIKE '%$key_words%'
     OR restaurant_id LIKE '%$key_words%' 
     OR location_english LIKE '%$key_words%' 
     OR location_bangla LIKE '%$key_words%' 
     OR city_english LIKE '%$key_words%' 
     OR city_bangla LIKE '%কেএফসি%' 
     OR thana_upazila_english LIKE '%$key_words%' 
     OR thana_upazila_bangla LIKE '%$key_words%'


");

return $restaurants;
}

public static function CompanyDetails($company_id){
    $company=DB::Select("
    SELECT
    companys.*,
    inspections.inspection_date AS inspection_date,
    inspections.next_inspection AS next_inspection,
    inspections.current_category AS current_category,
    inspections.inspected_by AS inspected_by,
    inspections.inspected_by_designation as inspected_by_designation
FROM
    companys
LEFT JOIN inspections ON inspections.created_at =(
    SELECT
        MAX(created_at)
    FROM
        inspections
    WHERE
        company_id = companys.company_id
)
WHERE
    companys.company_id = '$company_id'
    LIMIT 1
    
    ");

    return $company;
}
}
