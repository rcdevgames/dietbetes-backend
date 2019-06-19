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
        $currentDay = date('N', strtotime(Carbon::now()->format('l')));

        foreach ($alarms as $key => $value) {
            Log::info("Tanggal ". ($value->remind_on == 0 || strpos($value->remind_on, $currentDay) != false));
            Log::info("Jam ". ($value->remind_at == $current));
            if (($value->remind_on == 0 || strpos($value->remind_on, $currentDay) != false) && $value->remind_at == $current) {
                $user = User::where('id', $value->user_id)->where('status', 1)->first();
                if($user && $user->onesignal_token != NULL) {
                    $client = new Client(['headers' => ['Content-Type' => 'application/json', 'Authorization' => 'key=AAAAVymkZMo:APA91bECDhCjY4kSRZMAoqsne_aQLxK5958DWpL4XkaauCaygHcx-XoBBorm46HFE9DRkqN5ItX2QroLIbKlNlh3-H5gb8TNkUbGcRZ6TI0Xvem2S7Pq9MGEmIWOB_3Jz8wER4qFCiFP']]);
                    try {
                        $result = $client->post("https://fcm.googleapis.com/fcm/send", ['json' => [
                            "app_id" => "1005a0a0-2d0e-4307-bc0e-e1c0b00570f1",
                            "registration_ids" => [$user->onesignal_token],
                            "priority" => "high",
                            "notification" => [
                                "title" => $value->title,
                                "body" => $value->note,
                                "sound" => "default",
                                "icon" => "icon_launcher"
                            ]
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
