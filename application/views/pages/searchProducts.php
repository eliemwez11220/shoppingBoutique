<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">

                    <li class="active">Meilleures ventes</li>
                    <li><a href="<?= base_url(); ?>produits">costumes hommes</a></li>
                    <li><a href="<?= base_url(); ?>produits">pentalons</a></li>
                    <li><a href="<?= base_url(); ?>produits">chemises</a></li>
                    <li><a href="<?= base_url(); ?>produits">chaussures</a></li>
                    <li><a href="<?= base_url(); ?>produits">sacs dames</a></li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">
                        Resultat trouve pour - <?= $critere; ?>
                    </h3>
                </div>
            </div>

        <?php $line = 1;
        if (!empty($resultats)) {
            foreach ($resultats as $value) { ?>

                    <div class="col-lg-4 col-sm-6">

                            <div class="card-img-top">
                                <a href="<?= base_url('produits/details/') . $value->product_id; ?>">
                                    <img src="<?= base_url('assets/uploads/images/products/') . $value->product_image; ?>"
                                         alt="Article" height="200" width="350">
                                </a>
                            </div>
                        <div class="card">
                            <div class="card-body">
                                <h5 class="product-name">
                                    <a href="<?= base_url('produits/details/') . $value->product_id; ?>"><?= $value->product_title; ?></a>
                                </h5>
                            </div>
                            <div class="add-to-cart">
                                <a href="<?= base_url('produits/details/') . $value->product_id; ?>"
                                   class="btn btn-outline-danger"> Voir details
                                </a>
                            </div>
                        </div>
                    </div>

            <?php }
        } else { ?>
            <div class="alert alert-danger">
                <div class="text-center">
                    <h3>Aucun article en stock ne correpond a votre critere de recherche. Merci de votre confiance
                        !</h3>
                </div>
            </div>
        <?php } ?>
    </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->