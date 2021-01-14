<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
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
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<?= base_url('ressources/electronics/'); ?>css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="<?= base_url('ressources/electronics/'); ?>css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="<?= base_url('ressources/electronics/'); ?>css/slick-theme.css"/>

    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="<?= base_url('ressources/electronics/'); ?>css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="<?= base_url('ressources/electronics/'); ?>css/font-awesome.min.css">

    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="<?= base_url('ressources/electronics/'); ?>css/style.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>
<!-- HEADER -->
<header  >
    <!-- TOP HEADER -->
    <div id="top-header" style="position:fixed!important;top:0;right:0;left:0;z-index:1030">
        <div class="container-fluid">
            <ul class="header-links pull-left">
                <li><a href="tel:+243977090011"><i class="fa fa-phone"></i> +243977090011</a></li>
                <li><a href="https://wa.me/243858533285?text=bonjour"><i class="fa fa-whatsapp"></i> +243858533285</a></li>
                <li><a href="mailto:contact@congoagile.com"><i class="fa fa-envelope-o"></i> contact@congoagile.com</a></li>
                <li><a href="https://maps.google.com"><i class="fa fa-map-marker"></i>Lubumbashi, RDC</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="<?= base_url('shopping/monPanier');?>">
                        <i class="fa fa-shopping-cart"></i> <?= $this->cart->total_items(); ?>
                    </a></li> <li><a href="<?= base_url('shopping/monPanier');?>">
                        <i class="fa fa-dollar"></i> <?= ($this->cart->total_items() > 0) ? $this->cart->total() : '0.00'; ?>
                    </a></li>

                <li><a href="<?= base_url('security/session'); ?>"><i class="fa fa-user-o"></i> Mon compte</a></li>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header" style="margin-top: 35px!important;">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-sm-2">
                    <div class="header-logo">
                        <a href="#" class="logo">
                            <img src="<?= base_url('ressources/logo/'); ?>shopiza.png"
                                 alt="Shopiza" style="height: 90px!important;">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-sm-7">
                    <div class="header-search">
                        <form action="<?php echo base_url('pages/searchProducts'); ?>" method="post">
                            <select class="input-select" name="categorie">
                                <option value="0">Tous</option>
                                <option value="1">Chemises</option>
                                <option value="1">Pentalons</option>
                                <option value="1">Sacs dames</option>
                                <option value="1">Sacs hommes</option>
                                <option value="1">Chaussures</option>
                                <option value="1">Jackets</option>
                            </select>
                            <input class="input" placeholder="Search here" name="critere">
                            <button class="search-btn"><i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-sm-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist-->
                        <div>
                            <a href="#">
                                <i>Taux</i>
                                <span>1950 CDF</span>
                                <div class="qty"> <i class="fa fa-dollar">1</i></div>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Mon panier</span>
                                <div class="qty"><?= $this->cart->total_items(); ?></div>
                            </a>
                            <div class="cart-dropdown">

                                    <!-- product -->
                                    <?php $line = 1;
                                    if (!empty($achats)) {
                                        foreach ($achats as $items) { ?>
                                            <!-- /product --> <div class="cart-list">
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="<?= base_url('assets/uploads/images/products/') . $items['image']; ?>" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#"><?= $items['name']; ?></a></h3>
                                                    <h4 class="product-price"><span class="qty"><?= $items['qty']; ?></span>$<?= $items['price']; ?></h4>
                                                </div>
                                                <a class="delete"
                                                   onclick="return confirm('Etes-vous sur de vouloir enlever cet article du panier?')"
                                                   href="<?= base_url('shopping/deleteToCart/') . $items['rowid']; ?>">
                                                    <i class="fa fa-close"></i>
                                                </a>
                                            </div>
                                            </div>
                                            <div class="cart-summary">
                                                <small><?= $this->cart->total_items(); ?> articles(s)</small>
                                                <h5>$<?= $items['subtotal']; ?></h5>
                                            </div>
                                            <?php
                                        }
                                    } ?>


                                <div class="cart-btns">
                                    <a href="<?= base_url();?>home">Continuer</a>
                                    <a href="<?= base_url('shopping/monPanier');?>">Valider <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation" class="d-lg-none d-md-block">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li class="active"><a href="<?= base_url();?>">Accueil</a></li>
                <li><a href="<?= base_url();?>produits">Sacs dames</a></li>
                <li><a href="<?= base_url();?>produits">Costumes</a></li>
                <li><a href="<?= base_url();?>produits">Hommes</a></li>
                <li><a href="<?= base_url();?>produits">Femmes</a></li>
                <li><a href="<?= base_url();?>produits">Enfants</a></li>
                <li><a href="<?= base_url();?>produits">Chaussures</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->
