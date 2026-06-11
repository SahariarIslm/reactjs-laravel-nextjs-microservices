<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class ProductCacheFlush
{

    public function handle(object $event): void
    {
        \Cache::forget('products');
    }
}
