<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Events\OrderCompletedEvent;
use Illuminate\Mail\Message;

class NotifyInfluencerListener
{
    public function handle(OrderCompletedEvent $event): void
    {
        $order = $event->order;
        \Mail::send('influencer.influencer',['order'=>$order], function(Message $message) use ($order) {
            $message->to($order->influencer_email);
            $message->subject('A new order has been completed!');
        });
    }
}
