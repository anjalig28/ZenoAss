<?php 

interface Discount {

    public function giveDiscount($retailer_price, $mrp, $qty);
}

class FixedDiscount implements Discount {

	public $fixedDiscount = 20;

    public function giveDiscount($retailer_price, $mrp, $qty){

    	$final_price = ($mrp-$fixedDiscount) * $qty;

    	$new_retailer_price = $retailer_price *  $qty;

    	$new_mrp = $mrp * $qty;

		if($final_price < $new_retailer_price && $final_price < $new_mrp){

    		return $final_price;

    	}else{

    		return $mrp;
    		
    	}

    }
}

class PercentageDiscount implements Discount{

	

    public function giveDiscount($retailer_price, $mrp, $qty){

    	$percentageDiscount = 5;

    	$final_price = ($mrp - (($mrp * $percentageDiscount) / 100)) * $qty;

    	$new_retailer_price = $retailer_price *  $qty;

    	$new_mrp = $mrp * $qty;

		if($final_price < $new_retailer_price && $final_price < $new_mrp){

    		return $final_price;

    	}else{

    		return $mrp;
    		
    	}

    }
}

class BuyOneGetOneFree implements Discount{

    public function giveDiscount($retailer_price, $mrp, $qty){

    	$final_price = ($mrp * $qty) / 2;

    	$new_retailer_price = $retailer_price *  $qty;

    	$new_mrp = $mrp * $qty;

		if($final_price < $new_retailer_price && $final_price < $new_mrp){

    		return $final_price;

    	}else{

    		return $mrp;
    		
    	}

    }
}

class Greater500 implements Discount{

    public function giveDiscount($retailer_price, $mrp, $qty){

    	if($mrp > 500){

    		$final_price = $mrp + (1*($qty-1));	

    	}else{
			$final_price = ($mrp * $qty);
    	}

    	$new_retailer_price = $retailer_price *  $qty;

    	$new_mrp = $mrp * $qty;

		if($final_price < $new_retailer_price && $final_price < $new_mrp){

    		return $final_price;

    	}else{

    		return $mrp;
    		
    	}

    }
}


class ApplyDiscount {

	public function __construct($drugId, $price, $qty, Discount $d){

		$mrp = 0;
		$retailer_price = 0;

		$servername = "localhost";
		$username = "root";
		$password = "";
		$dbname = "drugmanagement";

		// Create connection
		$conn = new mysqli($servername, $username, $password, $dbname);
		// Check connection
		if ($conn->connect_error) {
		  die("Connection failed: " . $conn->connect_error);
		}

		$sql = "SELECT mrp, retailer_price FROM drug where id = ".$drugId;
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
		  // output data of each row
		  while($row = $result->fetch_assoc()) {

		  	$mrp = $row["mrp"];
		  	$retailer_price = $row["retailer_price"];

		  }
		} 
		$conn->close();
		echo $d->giveDiscount($retailer_price, $mrp, $qty);

	}
	
}

$applyDiscount = new ApplyDiscount($drugId=2, $mrp=150, $qty=5, new BuyOneGetOneFree());


?>