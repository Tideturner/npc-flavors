<?php

$extension = simplexml_load_file('../extension.xml');

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
$zip->open('npc-flavors.ext', ZipArchive::CREATE);
foreach( $files as $file ) {
	$zip->addFile('../'.$file,$file);
}
$zip->close();