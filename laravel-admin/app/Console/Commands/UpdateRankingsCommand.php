<?php

namespace App\Console\Commands;

use Illuminate\Console\Attributes\Description;
use Illuminate\Console\Attributes\Signature;
use Illuminate\Console\Command;
use App\Models\User;
use App\Models\Order;
use Illuminate\Support\Facades\Redis;

#[Signature('update:rankings')]
class UpdateRankingsCommand extends Command
{
    public function handle()
    {
        $users   = User::where('is_influencer',1)->get();
        $users->each(function(User $user){
            $orders = Order::where('user_id',$user->id)->where('complete',1)->get();
            $revenue = $orders->sum(function(Order $order){
                return $order->influencer_total;
            });

            Redis::zadd('rankings',$revenue,$user->full_name);
        });
    }
}
