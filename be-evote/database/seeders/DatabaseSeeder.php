<?php

namespace Database\Seeders;

use App\Models\Admin;
use App\Models\Candidate;
use App\Models\Config;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Admin::create([
            'name' => 'Fikri Omar',
            'username' => 'fikriomar16',
            'password' => Hash::make('admin12345'),
            'is_super' => 1
        ]);
        Admin::create([
            'name' => 'Super Admin',
            'username' => 'superadmin',
            'password' => Hash::make('admin12345'),
            'is_super' => 1
        ]);
        Config::factory(1)->create();
        // User::factory(27)->create();
        // Admin::factory(3)->create();
        Candidate::factory(3)->create();
    }
}
