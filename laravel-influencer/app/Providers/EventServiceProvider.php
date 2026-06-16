<?php

namespace App\Providers;

use App\Events\OrderCompletedEvent;
use App\Events\AdminAddedEvent;
use App\Events\ProductUpdatedEvent;
use App\Listeners\NotifyAdminListener;
use App\Listeners\NotifyInfluencerListener;
use App\Listeners\NotifyAddedAdminListener;
use App\Listeners\UpdateRankingsListener;
use App\Listeners\ProductCacheFlush;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        OrderCompletedEvent::class => [
            NotifyAdminListener::class,
            NotifyInfluencerListener::class,
            UpdateRankingsListener::class
        ],
        AdminAddedEvent::class => [
            NotifyAddedAdminListener::class
        ],
        ProductUpdatedEvent::class=>[
            ProductCacheFlush::class
        ]
    ];

    public function boot(): void
    {
        //
    }
}
