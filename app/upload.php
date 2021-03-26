<?php
  $target_dir = "uploads/";
  $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
  $filename = tempnam($target_dir, '');
  $uploadOk = 1;
  $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

  // Check file size
  if ($_FILES["fileToUpload"]["size"] > 50000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
  }

  // Allow certain file formats
  if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
  && $imageFileType != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
  }

  // Check if $uploadOk is set to 0 by an error
  if ($uploadOk == 0) {
    echo "<p>Sorry, your file was not uploaded.</p>";
    echo "<a href='/'>Back</a>";
  // if everything is ok, try to upload file
  } else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $filename)) {
      echo "<p>The file ". htmlspecialchars( basename( $_FILES["fileToUpload"]["name"])) . " has been uploaded to " . $filename . "</p>";
      $path = "/show.php?filename=" . rawurlencode(basename($filename));
      echo "<a href=$path>See Image</a>";
    } else {
      echo "<p>Sorry, there was an error uploading your file.</p>";
      echo "<a href='/'>Back</a>";
    }
  }
?>