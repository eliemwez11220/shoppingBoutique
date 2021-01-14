<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Commande validee</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="<?= base_url(); ?>">Accueil</a></li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <?php if (isset($success)) { ?>
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="card text-center">
                       <div class="alert alert-success">
                           <h3 class="title">
                               Votre commande a ete prise en compte avec success
                           </h3>
                           <h5>Le montant total se leve a <span class="font-weight-bold text-danger" style="font-size: 30px">
                                   <?= $montantTotal; ?></span> USD apres application de la TVA de 16%</h5>
                           <br>
                           <a href="<?= base_url(); ?>produits" class="btn btn-primary">Parcourir d'autres articles</a>

                       </div>
                    </div>
                </div>
            </div>
            <?php
        } ?>
    </div>
</div>
<!-- /SECTION -->
