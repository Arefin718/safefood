<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCompanysTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companys', function (Blueprint $table) {
            $table->increments('id');
            $table->string('company_id')->unique();
            $table->string('title_english');
            $table->string('title_bangla')->nullable();
            $table->string('location_english');
            $table->string('division_english');
            $table->string('city_english');
            $table->string('thana_upazila_english');
            $table->string('location_bangla')->nullable();
            $table->string('division_bangla')->nullable();
            $table->string('city_bangla')->nullable();
            $table->string('thana_upazila_bangla')->nullable();
            $table->string('zip_code')->nullable();
            $table->string('latitude')->nullable();
            $table->string('longitude')->nullable();

            $table->string('owner_name');
            $table->string('owner_contact_number');

           // $table->date('inspection_date');
           // $table->string('current_category');
           // $table->string('inspected_by');

            $table->boolean("status")->default('1');
            $table->integer('added_by');
            $table->integer('updated_by')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('companys');
    }
}
