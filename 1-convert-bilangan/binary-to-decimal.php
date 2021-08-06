<?php
	$input = isset($_GET['input']) ? (int) $_GET['input'] : 0;

	$result = '';
	
	$digits = str_split($input);
    $reversed = array_reverse($digits);
    $temp_result = 0;

    for($x=0; $x < count($reversed); $x++) {
        if($reversed[$x] == 1) {
            $temp_result += pow(2, $x);
        }
    }

    $result = $temp_result;


	$arr = array();
	$arr['info'] = 'success';
	$arr['result'] = $result;

	echo json_encode($arr);
?>