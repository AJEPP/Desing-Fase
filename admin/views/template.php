<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Dashboard - Brand</title>
    <?php include 'includes/header.php'; ?>
</head>

<body id="page-top">
    <div id="wrapper">
        <?php
        if(isset($_SESSION['user']))
        {
            include 'includes/sidebar.php';
            echo '<div class="d-flex flex-column" id="content-wrapper">';
                echo '<div id="content">';
                include 'includes/navbar.php';
        }
                    use \Ajepp\Controllers\linksController as mvc;
                    $module = new mvc();  

                    $module->setModules();
        if(isset($_SESSION['user']))
        {
         
                echo '</div>';
                include 'includes/footer.php';
            echo '</div>';
        }
        ?>
        <a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <?php 
        include 'includes/scripts.php'; 
        
        echo $module->setScript();
    ?>
</body>

</html>