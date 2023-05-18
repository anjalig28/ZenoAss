<?php 

namespace App;

use CodeIgniter\Test\CIUnitTestCase;
use App\Models\DrugModel;

Class TestDrug extends CIUnitTestCase
{
	public function setUp() : void
	{
		parent::setUp();
	}

	public function tearDown() : void
	{
		parent::tearDown();
	}

	public function testIndex(){
		//$this->assertTrue(defined('APPPATH'));
		$model = new DrugModel();

        // Get every row created by ExampleSeeder
        $objects = $model->findAll();

        // Make sure the count is as expected
        $this->assertCount(1, $objects);
	}
}