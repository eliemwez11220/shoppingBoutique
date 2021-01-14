<!-- /NAVIGATION -->

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <h3 class="breadcrumb-header">Validation commande</h3>
                <ul class="breadcrumb-tree">
                    <li><a href="<?= base_url(); ?>">Accueil</a></li>
                    <li class="active">Commande encours</li>
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
        <?php if (isset($achats)) { ?>
            <!-- row -->
            <div class="row">
                <div class="col-md-6 offset-3 order-details">
                    <div class="section-title text-center">
                        <h3 class="title">Votre panier d'articles</h3>
                    </div>
                    <div class="order-summary">
                        <div class="order-col">
                            <div><strong>Article (s) selected </strong></div>
                            <div><strong><?= $this->cart->total_items(); ?></strong></div>
                        </div>
                        <div class="order-products">
                            <div class="table-responsive-sm">
                                <!-- Table  -->
                                <table id="dtMaterialDesignExample" class="table table-hover table-striped table-sm">

                                    <tbody>
                                    <!-- product -->
                                    <?php $line = 1;
                                    if (!empty($achats)) {
                                        foreach ($achats as $items) { ?>
                                            <tr>
                                                <td>
                                                    <img style="height: 50px!important; width: 50px!important; border-radius:100px"
                                                         src="<?= base_url('assets/uploads/images/products/') . $items['image']; ?>"
                                                         alt=""></td>
                                                <td><span class="text-capitalize"> <?= $items['name']; ?></span></td>
                                                <td>$<?= $items['price']; ?></td>
                                                <td class="text-center font-weight-bold">
                                                    <?= $items['qty']; ?>
                                                </td>
                                                <td>$<?= $items['subtotal']; ?></td>
                                            </tr>

                                            <?php
                                        }
                                    } ?>

                                    </tbody>
                                    <!-- Table body -->
                                </table>
                            </div>
                        </div>
                        <div class="order-col">
                            <div><strong>NET A PAYER</strong></div>
                            <div><strong
                                        class="order-total">$<?= ($this->cart->total_items() > 0) ? $this->cart->total() : '0.00'; ?></strong>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
            <?php
        } ?>
    </div>
</div>
<!-- /SECTION -->
