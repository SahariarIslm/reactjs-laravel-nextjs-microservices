<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        \App\Models\Order::factory()->count(30)->create()
        ->each(function(\App\Models\Order $order){
            \App\Models\OrderItem::factory()->count(random_int(1, 5))->create([
                'order_id' => $order->id,
            ]);
        });
    }
}
