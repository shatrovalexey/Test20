<?php
	require_once( '../phplib/init.php' ) ;

	$app = new Application\Application( ) ;
	$app->prepare( ) ;
	$app->execute( ) ;
	$app->finish( ) ;