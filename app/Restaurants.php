<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Restaurants extends Model
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
}
