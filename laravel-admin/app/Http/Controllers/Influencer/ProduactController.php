<?php

namespace App\Http\Controllers\Influencer;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\ProductResource;
use Illuminate\Support\Str;

class ProduactController
{
    public function index(Request $request)
    {
        $products = \Cache::remember('products', 60 * 30, function () {
            sleep(2);

            return Product::all()->toArray();
        });

        // Convert arrays back to Product models
        $products = Product::hydrate($products);

        if ($s = $request->input('s')) {
            $products = $products->filter(function (Product $product) use ($s) {
                return Str::contains($product->title, $s, true) ||
                    Str::contains($product->description, $s, true);
            });
        }

        return ProductResource::collection($products);
    }
}
