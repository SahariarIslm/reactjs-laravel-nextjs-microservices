<?php

namespace App\Http\Controllers\Influencer;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Http\Resources\ProductResource;

class ProduactController
{
    public function index(Request $request)
    {

        $query = Product::query();
        if($s = $request->input('s')){
            $query->whereRaw("title LIKE '%{$s}%'")
                ->orWhereRaw("description LIKE '%{$s}%'");
        }
        return ProductResource::collection($query->get());
    }
}
