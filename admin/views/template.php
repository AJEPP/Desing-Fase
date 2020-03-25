<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <?php include 'includes/header.php'; ?>

</head>
<body id="page-top">
    <div class="wraper">
        <?php 

            if(isset($_SESSION['user']))
            {
                include 'includes/sidebar.php';

                echo '<div class="main-panel">';
                include 'includes/navbar.php';
                echo '<div class="content">';
            }
            use \Ajepp\Controllers\linksController as mvc;
            $module = new mvc();  

            $module->setModules();

            if(isset($_SESSION['user']))
            {
                echo '</div></div>';
            }
        ?>
    </div>
    <?php 
        include 'includes/scripts.php'; 
        
        //echo $module->setScript();
    ?>
</body>
</html>