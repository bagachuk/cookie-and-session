<?
  session_start();
  $error="Неверный пароль";
  if(isset($_SESSION["email"])){
      header("Location:/сессии/look.php");
      }
  elseif(isset($_POST["email"]) && isset($_POST["pass"]) && $_POST["pass"]!="" && $_POST["pass"]=="7777"){
    $user_email=$_POST["email"];
    $user_pass=$_POST["pass"];
    $_SESSION["email"]=$user_email;
    $_SESSION["pass"]=$user_pass;
    header("Location:/сессии/look.php");
      }
  elseif($_POST["pass"]!="" && $_POST["pass"]!="7777"){
    $_SESSION['error']=$error;
  }
?>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Лабораторная работа 2.2 сессии</title> 
  </head>
  <body>
    <div class="container">
     <form action="/сессии/primer3.php" method="POST">
        <div class="container">
          <label for="email" class="form-label" >Адрес электронной почты</label>
          <input type="email" class="form-control"  name="email" id="exampleInputEmail1" aria-describedby="emailHelp"> 
          <label for="pass" class="form-label">Пароль</label>
          <input type="password" class="form-control"  name="pass" id="exampleInputPassword1">
          <?php 
          if(isset($_SESSION['error'])){ 
          $error=$_SESSION['error'];
          echo "$error";} 
		  ?>
		  <br>
          <button type="submit" class="btn btn-primary">Отправить</button>
        </div>
      </form>
    </div>
    
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>

