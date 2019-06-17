<?php
//login_success.php  
session_start();
if (isset($_SESSION["usuario"])) {
//    echo '<h3>Login Success, Welcome - ' . $_SESSION["usuario"] . '</h3>';
//    echo '<br /><br /><a href="logout.php">Logout</a>';
    ?>

    <?php include 'parts/head.php'; ?>

    <main role="main" class="container">
        <div class="jumbotron">
            <img class="img-fluid mb-4" src="imagens/Certifico.png" alt="" >
        </div>
    </main>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script><script src="/docs/4.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
    <!--    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
        <script>window.jQuery || document.write('<script src="js/jquery-3.4.0.min"><\script>')</script><script src="js/bootstrap.bundle.min.js" ></script>-->
    </body>
    </html>

    <?php
} else {
    header("location: login.php");
}
?>

