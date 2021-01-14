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
        <form action="<?php echo base_url('shopping/validerCommande'); ?>" method="post">
            <!-- row -->
            <div class="row">

                <div class="col-md-6">
                    <!-- Billing Details -->
                    <div class="billing-details">
                        <div class="section-title">
                            <h3 class="title">Informations d'dentification du client</h3>
                        </div>
                        <div class="form-group">
                            <input class="input" type="text" name="client_name" placeholder="Votre nom" required>
                        </div>
                        <div class="form-group">
                            <input class="input" type="text" name="client_prename" placeholder="Votre prenom" required>
                        </div>
                        <div class="form-group">
                            <input class="input" type="email" name="client_email" placeholder="Votre Adresse mail" required>
                        </div>
                        <div class="form-group">
                            <input class="input" type="text" name="client_address"
                                   placeholder="Votre adresse de livraison" required>
                        </div>
                        <div class="form-group">
                            <input class="input" type="text" name="client_city" placeholder="Votre ville">
                        </div>

                        <div class="form-group">
                            <input class="input" type="tel" name="client_phone" placeholder="Numero de Telephone">
                        </div>
                        <div class="form-group">
                            <div class="input-checkbox">
                                <input type="checkbox" id="create-account" name="client_account">
                                <label for="create-account">
                                    <span></span>
                                    Avez-vous besoin d'un compte utilisateur ?
                                </label>
                                <div class="caption">
                                    <p>
                                        En ayant un compte utilisateur, vous pourrez effectuer des achats
                                        facilement et d'une maniere rapide. En plus vous allez commencer a etre notifier
                                        pour chaque arrivage.
                                    </p>
                                    <div class="form-group">
                                        <input class="input" type="password" name="client_password"
                                               placeholder="Creer un mot de passe pour securiser votre compte">
                                    </div>
                                    <div class="form-group">
                                        <input class="input" type="password" name="password_confirmation"
                                               placeholder="Confirmer votre mot de passe pour eviter les erreurs de saisie">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Billing Details -->

                    <!-- Shiping Details
                    <div class="shiping-details">
                        <div class="section-title">
                            <h3 class="title">Shiping address</h3>
                        </div>
                        <div class="input-checkbox">
                            <input type="checkbox" id="shiping-address">
                            <label for="shiping-address">
                                <span></span>
                                Ship to a diffrent address?
                            </label>
                            <div class="caption">
                                <div class="form-group">
                                    <input class="input" type="text" name="first-name" placeholder="First Name">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="last-name" placeholder="Last Name">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="email" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="address" placeholder="Address">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="city" placeholder="City">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="country" placeholder="Country">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="text" name="zip-code" placeholder="ZIP Code">
                                </div>
                                <div class="form-group">
                                    <input class="input" type="tel" name="tel" placeholder="Telephone">
                                </div>
                            </div>
                        </div>
                    </div>  -->
                    <!-- /Shiping Details -->

                    <!-- Order notes -->
                    <div class="order-notes">
                        <textarea class="input" placeholder="Faite une note ou observation sur la commande" name="observation"></textarea>
                    </div>
                    <!-- /Order notes -->
                </div>

                <!-- Order Details -->
                <div class="col-md-6 order-details">
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
                                                <td>
                                                    <a class="btn btn-sm btn-success"
                                                       href="<?= base_url('shopping/addToCart/') . $items['id']; ?>">
                                                        <i class="fa fa-plus"></i>
                                                    </a>
                                                    <a class="btn btn-sm btn-warning"
                                                       onclick="return confirm('Vous voulez vraiment modifier ?')"
                                                       href="<?= base_url('shopping/updateQuantity/') . $items['rowid']; ?>">
                                                        <i class="fa fa-refresh"></i>
                                                    </a>

                                                    <a class="btn btn-sm btn-danger"
                                                       onclick="return confirm('Etes-vous sur de vouloir enlever cet article du panier?')"
                                                       href="<?= base_url('shopping/deleteToCart/') . $items['rowid']; ?>">
                                                        <i class="fa fa-close"></i>
                                                    </a>
                                                </td>
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
                            <div>Shiping</div>
                            <div><strong>FREE</strong></div>
                        </div>
                        <div class="order-col">
                            <div><strong>Total Hors Taxes</strong></div>
                            <div><strong
                                        class="order-total">$<?= ($this->cart->total_items() > 0) ? $this->cart->total() : '0.00'; ?></strong>
                            </div>
                        </div>
                    </div>
                    <div class="payment-method">
                        <div class="input-radio">
                            <input type="radio" name="payment" id="payment-1">
                            <label for="payment-1">
                                <span></span>
                                Compte bancaire
                            </label>
                            <div class="caption">
                                <p>Veuillez nous contacter pour vous donner notre numero bancaire</p>

                                <p><a href="tel:+243977090011"><i class="fa fa-phone"></i> +243977090011</a></p>
                                <p><a href="https://wa.me/243858533285?text=bonjour"><i class="fa fa-whatsapp"></i>
                                        +243858533285</a></p>
                                <p><a href="mailto:contact@congoagile.com"><i class="fa fa-envelope-o"></i>
                                        contact@congoagile.com</a></p>
                                <p><a href="https://maps.google.com"><i class="fa fa-map-marker"></i>Lubumbashi,
                                        RDC</a></p>


                            </div>
                        </div>  <hr>
                        <div class="input-radio">
                            <input type="radio" name="payment" id="payment-2">
                            <label for="payment-2">
                                <span></span>
                                Mobiles Money
                            </label>
                            <div class="caption">
                                <p>Nous acceptons les operateurs suivants : </p>

                                <p><a href="tel:+243977090011">Airtel Money +243977090011</a></p>
                                <p><a href="https://wa.me/243858533285?text=bonjour">Orange Money +243858533285</a>
                                </p>
                                <p><a href="https://wa.me/243858533285?text=bonjour">M-pesa +243 821 733 330</a>
                                </p>
                                <p><a href="https://wa.me/243858533285?text=bonjour">Pepele Mobile 112-207-333</a>
                                </p>

                            </div>
                        </div><hr>
                        <div class="input-radio">
                            <input type="radio" name="payment" id="payment-3">
                            <label for="payment-3">
                                <span></span>
                                Paypal System
                            </label>
                            <div class="caption">
                                <p>
                                    Transferer rapidement de l'argent avec le systeme Paypal Securiser.
                                    <br>
                                    <a href="https://paypal.com/client?id=contact@congoagile.com"><i
                                                class="fa fa-envelope-o"></i> cell@congoagile.com</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="input-checkbox">
                        <input type="checkbox" id="terms" required>
                        <label for="terms">
                            <span></span>
                            I've read and accept the <a href="#">terms & conditions</a>
                        </label>
                    </div>
                    <a href="<?= base_url(); ?>produits" class="btn btn-success order-submit">
                        <i class="fa fa-chevron-circle-left"></i> continuer mes achats
                    </a>
                    <br>
                    <button class="primary-btn order-submit" type="submit" name="btn_commande">Valider ma commande
                    </button>
                </div>
                <!-- /Order Details -->
            </div>
            <!-- /row -->
        </form>
    </div>
    <!-- /container -->
</div>
<!-- /SECTION -->
