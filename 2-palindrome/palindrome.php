<?php

	protected function getPalindrome($input){

		$input = str_replace(' ', '', $input);

		$jml_char = strlen($input);

		$potong = 0;
		$cek_pertama = 0;
		$tampung_kata = '';
		for ($i=0; $i < $jml_char; $i++) { 
			$potong = $jml_char - $i;
			$jml_potong = $i + 1;
			for ($j=0; $j < $jml_potong; $j++) { 
				$string_pakai = substr($input,$j,$potong);

				$reverse = strrev($string_pakai);

				if($string_pakai == $reverse) {
					if ($cek_pertama == 0) {
						$tampung_kata = $string_pakai;
						$cek_pertama = 1;
					}
				}
			}
		}


		if ($tampung_kata == '') {
			$result = 'Tidak ada palindrome';
		}else{
			$result = $tampung_kata;
		}

		return $result;
	}
?>