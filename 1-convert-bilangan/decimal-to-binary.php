<?php
	$input = isset($_GET['input']) ? (int) $_GET['input'] : 0;

	$result = '';
	if ($input == 0){
        $result = 0;
	}else{
		$bin = "";
	    while ($input > 0)
	    {
	        $bin = (($input & 1) == 0 ? '0' : '1') . $bin;
	         
	        $input >>= 1;
	    }
	    $result = $bin;
	}
     
    


	$arr = array();
	$arr['info'] = 'success';
	$arr['result'] = $result;

	echo json_encode($arr);
?>