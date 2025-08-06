<?php

namespace App\Console\Commands;

use Illuminate\Foundation\Console\ServeCommand as BaseServeCommand;

class ServeCommand extends BaseServeCommand
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'serve:custom {--host=127.0.0.1} {--port=8000} {--tries=10} {--no-reload} {--env=}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Serve the application on the PHP development server with unlimited execution time';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Set unlimited execution time for development server
        set_time_limit(0);
        ini_set('max_execution_time', 0);
        
        return parent::handle();
    }
}
