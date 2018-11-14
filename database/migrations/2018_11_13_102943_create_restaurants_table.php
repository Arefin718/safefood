<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRestaurantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('restaurants', function (Blueprint $table) {
            $table->increments('id');
            $table->string('restaurant_id')->unique();
            $table->string('title_english');
            $table->string('title_bangla');

            $table->string('location_english');
            $table->string('division_english');
            $table->string('city_english');
            $table->string('thana_english');
            $table->string('location_bangla');
            $table->string('division_bangla');
            $table->string('city_bangla');
            $table->string('thana_bangla');
            $table->string('zip_code');
            $table->string('latitude');
            $table->string('longitude');

            $table->string('owner_name');
            $table->string('owner_contact_number');
            $table->string('category');


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
        Schema::dropIfExists('restaurant');
    }
}
