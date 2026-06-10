<?php

namespace App\Listeners;

use App\Events\AdminAddedEvent;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Mail\Message;

class NotifyAddedAdminListener
{

    public function handle(AdminAddedEvent $event): void
    {
        $user = $event->user;

        \Mail::send('admin.adminAdded',[], function(Message $message) use ($user) {
            $message->to($user->email);
            $message->subject('You have been added to the Admin App!');
        });
    }
}
