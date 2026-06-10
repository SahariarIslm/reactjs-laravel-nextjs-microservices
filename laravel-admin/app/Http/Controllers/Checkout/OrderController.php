<?php

namespace App\Http\Controllers\Checkout;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\Product;
use App\Models\Link;
use App\Models\OrderItem;
use Illuminate\Mail\Message;

class OrderController
{
    public function store(Request $request)
    {
        $link = Link::whereCode($request->input('code'))->first();
        \DB::beginTransaction();
        $order = new Order();

        $order->first_name       = $request->input('first_name');
        $order->last_name        = $request->input('last_name');
        $order->email            = $request->input('email');
        $order->code             = $link->code;
        $order->user_id          = $link->user->id;
        $order->influencer_email = $link->user->email;
        $order->address          = $request->input('address');
        $order->address2         = $request->input('address2');
        $order->city             = $request->input('city');
        $order->country          = $request->input('country');
        $order->zip              = $request->input('zip');

        $order->save();

        $lineItems = [];

        foreach($request->input('items') as $item)
        {
            $product = Product::find($item['product_id']);

            $orderItem = new OrderItem();
            $orderItem->order_id = $order->id;
            $orderItem->product_title = $product->title;
            $orderItem->price = $product->price;
            $orderItem->quantity = $item['quantity'];
            $orderItem->influencer_revenue = 0.1 * $product->price*$item['quantity'];
            $orderItem->admin_revenue = 0.9 * $product->price*$item['quantity'];

            $orderItem->save();
            $lineItems[] = [
                'name' => $product->title,
                'description' => $product->price,
                'images' => [
                    $product->image
                ],
                'amount' => 100*$product->price,
                'currency' => 'usd',
                'quantity' => $orderItem->quantity,
            ];
        }

        $stripe = Stripe::make(env('STRIPE_SECRET'));
        $source = $stripe->checkout()->sessioins()->create([
            'payment_method_types' => ['card'],
            'line_items'=> $lineItems,
            'success_url' => env('CHECKOUT_URL').'/success?source={CHECKOUT_SESSION_ID}',
            'cancel_url' => env('CHECKOUT_URL').'/error',
        ]);

        $order->transection_id = $source['id'];
        $order->save();

        \DB::commit();

        return $source;
    }

    public function confirm(Request $request)
    {


        if(!$order = Order::whereTransectionId($request->input('source'))->first()){
            return response([
                'error' => 'Order Not Found'
            ],404);
        }

        $order->complete = 1;
        $order->save();

        \Mail::send('admin',['order'=>$order], function(Message $message){
            $message->to('admin@abc.com');
            $message->subject('A new order has been completed!');
        });

        \Mail::send('influencer',['order'=>$order], function(Message $message) use ($order) {
            $message->to($order->influencer_email);
            $message->subject('A new order has been completed!');
        });

        return response([
            'message' => 'success'
        ]);
    }
}
