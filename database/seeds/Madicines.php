<?php

use Illuminate\Database\Seeder;
use App\Madicines;

class MadicinesTable extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = array(
            ['type' => 'Sulfonilurea','generic' => 'Klorpropamid','name' => 'Diabenese','content' => '100-250','dose' => '100-500','working_hour' => '24-36','frequent' => '1','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Sulfonilurea','generic' => 'Glibenklamid','name' => 'Daonil','content' => '2.5-5','dose' => '2.5-15','working_hour' => '12-24','frequent' => '1-1','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Sulfonilurea','generic' => 'Glipizid','name' => 'Minidiab','content' => '5-10','dose' => '5-20','working_hour' => '10-16','frequent' => '1-2','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Sulfonilurea','generic' => 'Glipizid','name' => 'Glucotrol-XL','content' => NULL,'dose' => NULL,'working_hour' => NULL,'frequent' => '1','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Sulfonilurea','generic' => 'Glikzaid','name' => 'Diamicron','content' => '80','dose' => '80-240','working_hour' => '10-20','frequent' => '1','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Sulfonilurea','generic' => 'Glikzaid','name' => 'Diamicron-MR','content' => NULL,'dose' => NULL,'working_hour' => NULL,'frequent' => NULL,'suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Sulfonilurea','generic' => 'Glukuidon','name' => 'Glurenorm','content' => '30','dose' => '30-120','working_hour' => NULL,'frequent' => '1-1','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Sulfonilurea','generic' => 'Glimepirid','name' => 'Amaryl','content' => '[1,2,3,4]','dose' => '0.5-6','working_hour' => NULL,'frequent' => '3','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Glinid','generic' => 'Repaglinid','name' => 'NovoNorm','content' => '[0.5,1,2','dose' => '100-500','working_hour' => '24-36','frequent' => '3','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Glinid','generic' => 'Nateglinid','name' => 'Starflix','content' => '120','dose' => '360','working_hour' => NULL,'frequent' => '1','suggestion' => 'Segera Sebelum Makan'],

            ['type' => 'Tiazolidindion','generic' => 'Pioglitazon','name' => 'Actos, Deculin','content' => '15-30','dose' => '15-30','working_hour' => '24','frequent' => '1','suggestion' => 'Tidak Bergantung Makan'],

            ['type' => 'Tiazolidindion','generic' => 'Rosiglitazon','name' => 'Avandia','content' => '4','dose' => '2-4','working_hour' => '24','frequent' => '1','suggestion' => 'Tidak Bergantung Makan'],

            ['type' => 'Glukosidase Alpha','generic' => 'Acarbose','name' => 'Glucobay','content' => '50-100','dose' => '100-300','working_hour' => NULL,'frequent' => '3','suggestion' => 'Bersama Suapan Pertama'],

            ['type' => 'Buguanid','generic' => 'Metformin','name' => 'Glucophage*','content' => '500-850','dose' => '250-3000','working_hour' => '6-8','frequent' => '1-3','suggestion' => 'Bersama atau Sesudah Makan'],

            ['type' => 'Buguanid','generic' => 'Metformin','name' => 'Glucophage XR','content' => '500','dose' => '500-2000','working_hour' => '24','frequent' => '1','suggestion' => 'Bersama atau Sesudah Makan'],
        );
        Madicines::insert($data);
    }
}
