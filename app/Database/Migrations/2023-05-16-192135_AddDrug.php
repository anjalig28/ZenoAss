<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddDrug extends Migration
{
    public function up()
    {
         $this->forge->addField([
            'id' => [
				'type' => 'BIGINT',
				'constraint' => 255,
				'unsigned' => true,
				'auto_increment' => true
            ],
            'drug_name' => [
				'type' => 'VARCHAR',
				'constraint' => '255',
            ],
            'mrp' => [
				'type' => 'DECIMAL',
				'constraint' => '4,2',
            ],
            'retailer_price' => [
				'type' => 'DECIMAL',
				'constraint' => '4,2',
            ],
            'expiry_date' => [
				'type' => 'TIMESTAMP',
				'null' => true
            ],
            'barcode' => [
				'type' => 'VARCHAR',
				'constraint' => '255',
            ],
            'type' => [
				'type' => 'ENUM("Ethical","Generic")',
				'default' => 'Ethical',
				'null' => FALSE,
            ]
        ]);
        $this->forge->addPrimaryKey('id');
        $this->forge->createTable('drug');
    }

    public function down()
    {
        $this->forge->dropTable('drug');
    }
}
