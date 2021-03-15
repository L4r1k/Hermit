<?php
    $filename = "/var/www/html/uploads/" . rawurlencode($_GET['filename']);
    if((@include $filename) === false)
    {
        echo "<p>$filename</p>";
    }
?>

<a href='/'>Home</a>

<hr>

<img src="data:image/png;base64,<?php echo base64_encode(file_get_contents('/var/www/html/uploads/' . $_GET['filename'])); ?>">