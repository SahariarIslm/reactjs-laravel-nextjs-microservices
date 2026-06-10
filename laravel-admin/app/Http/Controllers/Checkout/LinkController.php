<?php

namespace App\Http\Controllers\Checkout;

use Illuminate\Http\Request;
use App\Models\Link;
use App\Http\Resources\LinkResource;

class LinkController
{
    public function show($code)
    {
        $link = Link::where('code',$code)->first();
        return new LinkResource($link);
    }
}
