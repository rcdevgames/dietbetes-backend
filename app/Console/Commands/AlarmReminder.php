<?php

namespace App\Console\Commands;

use App\Alarm;
use App\User;
use App\NotificationLog;
use Carbon\Carbon;
use Illuminate\Console\Command;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Log;

class AlarmReminder extends Command
{
    const DELIMITER     = "_";
    const PREFIX        = "DIETBETES" . self::DELIMITER;
    const SUFIX_START   = self::DELIMITER . "START";
    const SUFIX_END     = self::DELIMITER . "END";
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reminder:users';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Push Notification For User';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        Log::info(self::PREFIX . 'Reminder' . self::SUFIX_START);
        $alarms = Alarm::where('status',1)->get();
        $current = Carbon::now()->format("H:i");

        foreach ($alarms as $key => $value) {
            if ($value->remind_at == $current) {
                $user = User::where('id', $value->user_id)->where('status', 1)->first();
                if($user && $user->onesignal_token != NULL) {
                    $client = new Client(['headers' => ['Content-Type' => 'application/json', 'Authorization' => 'Basic ZTUzNTk1OGItNjg2My00YjhhLWE3YzEtMDQyYjdmODRlY2Ez']]);
                    try {
                        $result = $client->post("https://onesignal.com/api/v1/notifications", ['json' => [
                            "app_id" => "1005a0a0-2d0e-4307-bc0e-e1c0b00570f1",
                            "include_player_ids" => [$user->onesignal_token],
                            "data" => ["newTask" => false],
                            "headings" => ["en" => $value->title],
                            "contents" => ["en" => $value->note]
                        ]]);
                        $res = $result->getBody()->getContents();
                        NotificationLog::create(['message' => $res]);
                        Log::info($res);
                    
                    } catch (\GuzzleHttp\Exception\ConnectException $e) {
                        // This is will catch all connection timeouts
                        $res = $e->getResponse()->getBody();
                        NotificationLog::create(['message' => $res]);
                        Log::info($res);
                    } catch (\GuzzleHttp\Exception\ServerException $e) {
                        // This will catch all 500 level errors.
                        $res = $e->getResponse()->getBody();
                        NotificationLog::create(['message' => $res]);
                        Log::info($res);
                    } catch (\GuzzleHttp\Exception\ClientException $e) {
                        // This will catch all 400 level errors.
                        $res = $e->getResponse()->getBody();
                        NotificationLog::create(['message' => $res]);
                        Log::info($res);
                    }
                }
            }            
        }
        Log::info(self::PREFIX . 'Reminder' . self::SUFIX_END);
    }
}
