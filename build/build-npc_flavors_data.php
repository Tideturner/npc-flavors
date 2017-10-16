<?php

$scripts_dir = '../scripts/';
$data_dir = './data/';

$definition = file( $data_dir.'definition.npc_flavors_data.lua');
$definition_out = [];

foreach( $definition as $line ) {
	if ( strpos( $line,'-- [[') !== false ) {
		$parts = explode('-- [[', $line );

		$indent = $parts[0];
		$filename = trim( explode( ']]', $parts[1] )[0] ).'.txt';

		$definition_out[] = getWordsFromFile( $data_dir.$filename, $indent )."\n";
	}
	else {
		$definition_out[] = $line;
	}
}

$fp = fopen( $scripts_dir.'npc_flavors_data.lua', 'w' );
fwrite( $fp, implode( "", $definition_out ) );
fclose( $fp );


function getWordsFromFile( $filename, $indent = '' ) {
	$words = cleanWords( file( $filename ) );

	$word_lines = [];

	$line = $indent;
	foreach( $words as $word ) {
		if ( strlen( $line.' '.$word.',' ) > 128 ) {
			$word_lines[] = $line;
			$line = $indent;
		}

		$line .= ' '.$word.',';
	}
	if ( trim($line) ) $word_lines[] = $line;

	return preg_replace('/\s?,\s?$/', '', implode( "\n", $word_lines ) );
}

function cleanWords( $lines ) {
	$words = [];
	foreach( $lines as $line ) {
		$line_words = preg_split( '/"\s?,|"\s?/', $line );
		foreach ( $line_words as $line_word ) {
			if ( trim( $line_word ) ) $words[] = trim( $line_word );
		}
	}

	$words = array_unique( $words );
	natsort( $words );

	$cleaned_words = [];
	foreach( $words as $word ) {
		$cleaned_words[] = '"'. $word .'"';
	}

	return $cleaned_words;
}