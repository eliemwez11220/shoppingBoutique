<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="robots" content="all,follow">
    <title><?= $title; ?></title>
    <!-- SEO for website references by research robot -->
    <link rel="canonical" href="https://www.congoagile.com"/>
    <meta name="robots" content="max-snippet:-1, max-image-preview:large, max-video-preview:-1"/>

    <meta name="author" content="Elie Mwez; Rubuz; Congo Agile; Digitafriza;">
    <meta name="keywords" content="Vente; Shopping; e-commerce; shopiza; digitafriza; congo agile; produits; ">
    <meta property="description"
          content="Shopiza - Vendez ou Achetez autrement grace aux applications intelligentes et sites internet de gestion de vente en ligne et local. Developpee par la compagnie Digitafriza
                    , une compgnie de la fondation Congo Agile"/>

    <meta property="og:url" href="<?= base_url() . $page; ?>"/>
    <meta property="og:site_name"
          content="Shopiza - Apps et sites internet de gestion de vente en ligne et local."/>
    <meta property="og:title"
          content="Shopiza - Vendez ou Achetez autrement grace aux applications intelligentes et sites internet de gestion de vente en ligne et local. Developpee par la compagnie Digitafriza
                    , une compgnie de la fondation Congo Agile"/>

    <meta property="og:description"
          content="Shopiza - Apps et sites internet de gestion de vente en ligne et local. Developpee par la compagnie Digitafriza
                    , une compgnie de la fondation Congo Agile. Une plateforme qui regorge des milliers d'applications et sites internet de
                        gestion de vente des produits en ligne et en local."/>
    <meta property="og:image" content="<?= base_url('ressources/'); ?>logo/shopiza.jpg">
    <meta property="og:locale" content="fr_FR"/>
    <meta property="og:type" content="website"/>

    <meta name="twitter:card" content="summary"/>
    <meta name="twitter:card" content="summary_large_image">
    <meta name="twitter:url" content="www.congoagile.com">
    <meta name="twitter:creator" content="@eliemwez">
    <meta name="twitter:title" content="Congo Agile Foundation in République démocratique du Congo, ville de Lubumbasshi, province du Haut-Katanga |
    Vous servir est notre devoir."/>
    <meta name="twitter:description"
          content="Congo Agile Foundation in République démocratique du Congo, ville de Lubumbasshi, province du Haut-Katanga"/>

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
                            <form method="post" class="form-validate">
                                <div class="form-group">
                                    <input id="login-username" type="email" name="resetEmail" required autofocus
                                           data-msg="Saisissez votre adresse mail valide" class="input-material"  value="<?= set_value('resetEmail'); ?>">
                                    <label for="login-username" class="label-material">Adresse e-mail</label>
                                </div>
                                <div class="form-group">
                                    <button id="login" type="submit" name="loginSubmit" class="btn btn-primary"> Reinitialiser</button>
                                </div>
                            </form>
                            <small>Vous n'avez pas encore un compte ?</small>
                            <a href="<?= base_url('register'); ?>" class="signup">Creez-en gratuitement</a>
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

            </div>
            <div class="text-right">

                <small>Powered by Digitafriza. Solutions informatiques !</small>
                <br>
                <small>
                    © 2020 -
                    <script>document.write(new Date().getFullYear());</script> | Shopiza et son logo sont des marques déposées de <a href="https://www.digitafriza.com">Digitafriza, Inc.</a>
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