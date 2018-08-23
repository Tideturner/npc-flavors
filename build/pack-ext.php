<?php

$extension = simplexml_load_file('../extension.xml');
$version = (string)$extension->properties->version;

if ( !file_exists('./releases') ) mkdir( 'releases' );
$release_dir = './releases/'.$version;
if ( !file_exists($release_dir ) ) mkdir( $release_dir );

$files = [
	'extension.xml'
];
foreach( $extension->base->includefile as $inc ) {
	$files[] = (string)$inc['source'];
}
foreach( $extension->base->script as $inc ) {
	$files[] = (string)$inc['file'];
}

$zip = new ZipArchive();
$zip->open($release_dir.'/npc-flavors.ext', ZipArchive::CREATE);
foreach( $files as $file ) {
	$zip->addFile('../'.$file,$file);
}
$zip->close();