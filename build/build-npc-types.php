<?php

// 5E
// $npc_types_file = "npc-types";

// 2E
// $npc_types_file = "npc-types-2e";

// 3.5E / PF
$npc_types_file = "npc-types-35E";
$table = [];


$fp = fopen('./data/'.$npc_types_file.'.txt', 'r' );
while( $line = fgets( $fp ) ) {
	$parts = explode(':', $line );
	$types = explode('.', $parts[1] );
	foreach( $types as $key => $val ) $types[$key] = strtolower(trim($val));

	addToTable( trim($parts[0]), $types, $table );
}
fclose( $fp );

$fp = fopen( './data/'.$npc_types_file.'.lua', 'w' );
fwrite( $fp, "FlavorsByType = {\n".getLuaTable( '', $table )."\n}" );
//fwrite( $fp, print_r( $table, true ) );
fclose( $fp );

function addToTable( $npc, $types, &$table ) {
	$type = array_shift( $types );

	if ( !isset( $table[$type] ) ) {
		$table[$type] = [
			'examples' => []
		];
	}
	ksort($table);

	if ( count( $types ) ) {
		if ( !isset($table[$type]['subtypes']) ) $table[$type]['subtypes'] = [];
		addToTable( $npc, $types, $table[$type]['subtypes'] );
	}
	else {
		$table[$type]['examples'][] = '"'.$npc.'"';
		sort($table[$type]['examples']);
	}
}

function getLuaTable( $prefix, $table, $cutcomma = true ) {
	$out = '';

	foreach( $table as $type => $typedata ) {
		if ( isset( $typedata['examples'] ) ) $out .= "\t-- ".wordwrap(implode(', ', $typedata['examples'] ), 100, "\n\t-- ")."\n";
		$out .= "\t[\"$prefix$type\"] = {\n\t},\n\n";
		if ( isset( $typedata['subtypes'] ) && count($typedata['subtypes']) ) {
			$out .= getLuaTable( $type.'.', $typedata['subtypes'], false );
		}
	}

	if ( $cutcomma ) $out = substr( $out, 0, strlen($out)-1);

	return $out;
}
