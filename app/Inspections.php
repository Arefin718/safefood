<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Inspections extends Model
{
    public static function InspectionsoftheMonth($current_date){
$inspections=DB::select("
SELECT
id,
    company_id,
    inspected_by,
    current_category,
    MAX(inspection_date) as inspection_date,
    next_inspection
FROM
    inspections
    WHERE next_inspection LIKE '$current_date-%'
GROUP BY
id,
    company_id,
    next_inspection,
    inspected_by,
    current_category
");
return $inspections;
    }

    public static function InspectionExpired($current_date){
        $inspections=DB::select("
SELECT
id,
    company_id,
    inspected_by,
    current_category,
    MAX(inspection_date) as inspection_date,
    next_inspection,
    TIMESTAMPDIFF(MONTH,next_inspection, $current_date) as difference
FROM
    inspections
    WHERE next_inspection >= $current_date &&
    TIMESTAMPDIFF(MONTH,next_inspection, $current_date) >=1
GROUP BY
id,
    company_id,
    next_inspection,
    inspected_by,
    current_category
    
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

}
