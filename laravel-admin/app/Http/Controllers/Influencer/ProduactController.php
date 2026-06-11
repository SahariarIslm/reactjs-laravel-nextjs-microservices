<?php

namespace App\Http\Controllers\Influencer;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\ProductResource;

class ProduactController
{
    public function index(Request $request)
    {
        $s = $request->input('s');
        $cacheKey = 'products' . ($s ? '_' . md5($s) : '');

        $products = \Cache::remember($cacheKey, 5, function () use ($s) {
            $query = Product::query();

            if ($s) {
                $query->where(function ($q) use ($s) {
                    $q->whereRaw("title LIKE ?", ["%{$s}%"])
                      ->orWhereRaw("description LIKE ?", ["%{$s}%"]);
                });
            }

            // cache raw array, NOT the Resource object
            return $query->get()->toArray();
        });

        // wrap in resource AFTER retrieving from cache
        return ProductResource::collection(
            collect($products)->map(fn($p) => (object) $p)
        );
    }
}
