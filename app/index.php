<!DOCTYPE html>
<html> 
  <head> 
    <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="X-UA-Compatible" content="ie=edge">
		<meta name="description" content="Hermit">
		<title>Hermit</title>
		<style>
      @import url('https://fonts.googleapis.com/css?family=Press+Start+2P');

      *{
          padding: 0px;
          margin: 0px;
          font-family: 'Press Start 2P', cursive;
      }

      form {
        margin-top: 20px;
      }

      .heading {
          text-align: center;
          padding: 10px;
          margin-top: 20px;
      }

      input {
          display: block;
          width: 50%;
          padding: 10px;
          margin: auto;
          margin-top: 20px;
      }

      input[type="submit"] {
          text-transform: uppercase;
          padding: 5px;
      }

      input[type="file"] {
          text-transform: uppercase;
          padding: 5px;
      }

      .center {
        display: block;
        margin-left: auto;
        margin-right: auto;
        text-align: center;
      }
    </style>
  </head>
  <body>
      <div class="center">
        <h1 class="heading">Hermit</h1>
        <img src="data:image/png;base64,<?php echo base64_encode(file_get_contents('./resources/hermit.jpg')); ?>">

        <form action="upload.php" method="post" enctype="multipart/form-data">
          Henry the Hermit is looking for new shells. Upload your shell here: 
          <input type="file" name="fileToUpload" id="fileToUpload">
          <input type="submit" value="Upload Image" name="submit">
        </form>
      </div>
  </body>
</html>