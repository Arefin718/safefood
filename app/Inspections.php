<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Inspections extends Model
{
    public static function InspectionsoftheMonth($current_date){
$inspections=DB::select("
SELECT
    inspections.*,
    company_quality_types.title AS company_quality,
    TIMESTAMPDIFF(MONTH,inspections.next_inspection, '$current_date') as difference
FROM
    inspections
LEFT JOIN company_quality_types ON company_quality_types.company_quality_types_id = inspections.quality_category
WHERE (
    TIMESTAMPDIFF(MONTH,next_inspection, '$current_date') = 0)

");
return $inspections;
    }

    public static function InspectionExpired($current_date){
        $inspections=DB::select("
SELECT
    inspections.*,
    company_quality_types.title AS company_quality,
    TIMESTAMPDIFF(MONTH,inspections.next_inspection, '$current_date') as difference
FROM
    inspections
LEFT JOIN company_quality_types ON company_quality_types.company_quality_types_id = inspections.quality_category
WHERE (
    TIMESTAMPDIFF(MONTH,next_inspection, '$current_date') >=1)
ORDER BY
    TIMESTAMPDIFF(MONTH,inspections.next_inspection, '$current_date')
DESC
    
");
        return $inspections;
    }


    public static function GetInspectionListByID($company_id){
        $inspections=DB::select("
SELECT
    inspections.*,
    company_quality_types.title AS quality_category
FROM
    inspections
JOIN company_quality_types ON company_quality_types.company_quality_types_id = inspections.quality_category
WHERE
    inspections.company_id = '$company_id'
ORDER BY
    inspection_id
DESC
    
    
");
        return $inspections;
    }

    public static function InspectionList(){
        $inspections = DB::select("
    
        SELECT
    inspections.*,
    company_quality_types.title AS company_quality
FROM
    inspections
LEFT JOIN company_quality_types ON company_quality_types.company_quality_types_id = inspections.quality_category
ORDER BY
    inspections.inspection_id
DESC
        
        ");

        return $inspections;
    }
}
