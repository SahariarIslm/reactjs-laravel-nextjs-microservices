<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Events\OrderCompletedEvent;
use Illuminate\Mail\Message;

class NotifyAdminListener
{

    public function handle(OrderCompletedEvent $event): void
    {
        $order = $event->order;
        \Mail::send('influencer.admin',['order'=>$order], function(Message $message){
            $message->to('admin@abc.com');
            $message->subject('A new order has been completed!');
        });
    }
}
