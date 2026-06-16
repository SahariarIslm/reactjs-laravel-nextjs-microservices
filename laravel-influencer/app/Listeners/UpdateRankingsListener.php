<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Events\OrderCompletedEvent;


class UpdateRankingsListener
{
    public function handle(OrderCompletedEvent $event): void
    {
        $order = $event->order;

        $revenue = $order->influencer_total;

        $user = User::find($order->user_id);

        Redis:zincrby('rankings',$revenue,$user->full_name);
    }
}
