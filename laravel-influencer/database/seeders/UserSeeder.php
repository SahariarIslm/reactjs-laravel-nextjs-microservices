<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create admin user with specific credentials
        User::create([
            'first_name' => 'Admin',
            'last_name' => 'User',
            'email' => 'admin@abc.com',
            'password' => Hash::make('123'),
            'role_id' => 1, // Assuming role_id 1 is admin
            'email_verified_at' => now(),
        ]);

        // Create random users
        User::factory()->count(20)->create();
    }
}
