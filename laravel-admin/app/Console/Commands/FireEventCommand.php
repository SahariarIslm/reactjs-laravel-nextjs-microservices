<?php

namespace App\Console\Commands;

use Illuminate\Console\Attributes\Description;
use Illuminate\Console\Attributes\Signature;
use Illuminate\Console\Command;
use App\Jobs\AdminAdded;

#[Signature('fire')]
#[Description('Command description')]
class FireEventCommand extends Command
{
    /**
     * Execute the console command.
     */
    public function handle()
    {
        AdminAdded::dispatch();
    }
}
