<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Companies extends Model
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
    companies.*,
    inspections.*,
    company_quality_types.title AS quality,
    districts.title_english AS district,
    upazilas.title_english AS upazila
FROM
    companies
LEFT JOIN inspections ON inspections.inspection_id = companies.inspection_id
LEFT JOIN company_quality_types ON company_quality_types.company_quality_types_id = companies.company_quality_type_id
LEFT JOIN districts ON districts.district_id = companies.district_id
LEFT JOIN upazilas ON upazilas.upazila_id = companies.upazila_id
WHERE
    companies.company_id = '$company_id'
LIMIT 1
    
    ");

    return $company;
}

public static function CompaniesList(){
    $companies=DB::Select("
    SELECT
    companies.*,
    inspections.*,
    company_quality_types.title AS quality
FROM
    companies
LEFT JOIN inspections ON inspections.inspection_id = companies.inspection_id
LEFT JOIN company_quality_types ON company_quality_types.company_quality_types_id = companies.company_quality_type_id
ORDER BY
    companies.id
DESC
    
    ");
    return $companies;
}

}
