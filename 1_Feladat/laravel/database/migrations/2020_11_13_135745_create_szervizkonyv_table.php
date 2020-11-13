<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSzervizkonyvTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('szervizkonyv', function (Blueprint $table) {
            $table->id();
            $table->string('tulajdonos',50)->nullable([false]);;
            $table->integer('auto')->nullable([false]);
            $table->tinyInteger('garancialis',1)->nullable([false]);
            $table->integer('eletkor')->nullable([false]);
            $table->timestamp('szerviz_kezdete')->nullable([false]);
            $table->timestamp('szerviz_vege');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('szervizkonyv');
    }
}
