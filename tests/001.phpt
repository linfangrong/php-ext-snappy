--TEST--
Test snappy_compress() function : basic functionality
--SKIPIF--
--FILE--
<?php 
include(dirname(__FILE__) . '/data.inc');

echo "*** Testing snappy_compress() : basic functionality ***\n";

// Initialise all required variables

$smallstring = "A small string to compress\n";


// Calling gzcompress() with all possible arguments

// Compressing a big string
echo "-- Compression --\n";
$output = snappy_compress($data);
var_dump(md5($output));
var_dump(strcmp(snappy_uncompress($output), $data));

// Compressing a smaller string
echo "-- Compression --\n";
$output = snappy_compress($smallstring);
var_dump(bin2hex($output));
var_dump(strcmp(snappy_uncompress($output), $smallstring));

// Calling gzcompress() with mandatory arguments
echo "\n-- Testing with no specified compression --\n";
var_dump( bin2hex(snappy_compress($smallstring) ));

?>
===Done===
--EXPECT--
*** Testing snappy_compress() : basic functionality ***
-- Compression --
string(32) "aa706ffad8df5ca3f37f4ec061d91ca2"
int(0)
-- Compression --
string(58) "1b684120736d616c6c20737472696e6720746f20636f6d70726573730a"
int(0)

-- Testing with no specified compression --
string(58) "1b684120736d616c6c20737472696e6720746f20636f6d70726573730a"
===Done===
