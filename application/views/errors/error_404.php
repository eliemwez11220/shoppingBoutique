<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <title>Error 404 - Page not found on the server</title>

    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="<?= base_url('ressources/security/'); ?>vendor/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome CSS-->
    <link rel="stylesheet" href="<?= base_url('ressources/security/'); ?>vendor/font-awesome/css/font-awesome.min.css">
    <!-- Fontastic Custom icon font-->
    <link rel="stylesheet" href="<?= base_url('ressources/security/'); ?>css/fontastic.css">
    <!-- Google fonts - Poppins -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,700">
    <!-- theme stylesheet-->
    <link rel="stylesheet" href="<?= base_url('ressources/security/'); ?>css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="<?= base_url('ressources/security/'); ?>css/custom.css">
    <!-- Favicon-->
    <link rel="shortcut icon" href="<?= base_url('ressources/security/'); ?>img/favicon.ico">
    <!-- Tweaks for older IEs--><!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
</head>
<body>

<div class="page login-page">
    <div class="container d-flex align-items-center">
        <div class="form-holder has-shadow">
            <div class="row">
                <!-- Logo & Information Panel-->
                <div class="col-lg-6">
                    <div class="info d-flex align-items-center">
                        <div class="content">
                            <div class="logo text-center">
                                <div>
                                    <img src="<?= base_url('ressources/'); ?>logo/shopiza.png"
                                         alt="SHOPIZA" style="height:150px">
                                </div>
                                <h1>Vendez autrement.</h1>
                            </div>
                            <small class="text-justify">
                                Bienvenue chez Shopiza, un produit de Digitafriza. Trouver des meilleurs sites internet
                                et applications
                                Web et Mobiles pour iOS et Android developpees avec le framework CodeIgniter et
                                Bootstrap ainsi que Flutter
                                de Google. Merci de vous revoir une fois de plus, nous sommes ravi de votre fidelite.
                            </small>
                        </div>
                    </div>
                </div>
                <!-- Form Panel    -->
                <div class="col-lg-6 bg-white">
                    <div class="form d-flex align-items-center">
                        <div class="content">
                            <div class="text-center">
                                <h1 class="display-1 text-danger font-title font-weight-bold">404</h1>
                                <h3 class="display-4 font-title text-danger font-weight-bold">Page non trouvée</h3>

                                <h4 class="text-info">
                                    La page que vous tentez d'afficher n'existe pas ou une autre erreur s'est produite.
                                    <br>

                                    Vous pouvez revenir à <a class="font-weight-bold text-danger" href="javascript:history.back()">la
                                        page précédente</a> ou aller à
                                    <a class="font-weight-bold text-danger" href="<?= base_url(); ?>">la page d'accueil</a>.
                                </h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

<!--Footer-->
<footer class="page-footer text-center font-small text-dark fixed-bottom bg-white">

    <div class="container-fluid font-weight-bold">
        <!-- Social icons -->    <!--Copyright-->
        <div class="footer-copyright py-3">
            <div class="float-left text-left">
                <small>Shopiza - Vendre autrement !</small>
                <br>
                <small>Powered by Digitafriza. Solutions informatiques.</small>
            </div>
            <div class="text-right">

                <small>
                    © 2020 -
                    <script>document.write(new Date().getFullYear());</script>
                    , Shopiza et son logo sont des marques déposées de <a href="https://www.congoagile.com">Digitafriza, Inc.</a>
                </small>
                <br><small>Validate and authorized by <a href="https://www.congoagile.com">Congo Agile Foundation Teams.</a></small>
            </div>
        </div>
        <!--/.Copyright-->
    </div>
</footer>

<!-- JavaScript files-->
<script src="<?= base_url('ressources/security/'); ?>vendor/jquery/jquery.min.js"></script>
<script src="<?= base_url('ressources/security/'); ?>vendor/popper.js/umd/popper.min.js"></script>
<script src="<?= base_url('ressources/security/'); ?>vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="<?= base_url('ressources/security/'); ?>vendor/jquery.cookie/jquery.cookie.js"></script>
<script src="<?= base_url('ressources/security/'); ?>vendor/chart.js/Chart.min.js"></script>
<script src="<?= base_url('ressources/security/'); ?>vendor/jquery-validation/jquery.validate.min.js"></script>
<!-- Main File-->
<script src="<?= base_url('ressources/security/'); ?>js/front.js"></script>
</body>
</html>