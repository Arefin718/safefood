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
    logins.created_at AS last_login
FROM
    admins
LEFT JOIN logins ON logins.login_id = admins.id
WHERE
    logins.created_at =(
    SELECT
        MAX(created_at)
    FROM
        logins
    WHERE
        login_id = admins.id
) AND  admins.status NOT LIKE 0
        
        ");

        return $admins;
    }
}
