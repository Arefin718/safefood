<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Session;
class Admin extends Model
{
    public static function GetAllAdmins(){
        $admins=DB::Select("
       SELECT
    admins.*,
    activities.*
FROM
    admins
LEFT JOIN activities ON activities.admin_id = admins.admin_id
WHERE
    activities.created_at =(
    SELECT
        MAX(created_at)
    FROM
        activities
    WHERE
        admin_id = admins.admin_id
) AND admins.status NOT LIKE 0
        
        ");

        return $admins;
    }
}
