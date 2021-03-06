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

<!-- SECTION -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- Product main img -->
            <!-- product -->
            <?php $line = 1;
            if (!empty($articles)) {
                foreach ($articles as $value) { ?>

                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="<?= base_url('assets/uploads/images/products/') . $value->image_deux; ?>"
                                     alt="Article Shopiza" height="450">
                            </div>

                            <div class="product-preview">
                                <img src="<?= base_url('assets/uploads/images/products/') . $value->image_trois; ?>"
                                     alt="Article Shopiza" height="450">
                            </div>

                            <div class="product-preview">
                                <img src="<?= base_url('assets/uploads/images/products/') . $value->product_image; ?>"
                                     alt="Article Shopiza" height="450">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img src="<?= base_url('assets/uploads/images/products/') . $value->image_deux; ?>"
                                     alt="Article Shopiza" height="150">
                            </div>

                            <div class="product-preview">
                                <img src="<?= base_url('assets/uploads/images/products/') . $value->image_trois; ?>"
                                     alt="Article Shopiza" height="150">
                            </div>

                            <div class="product-preview">
                                <img src="<?= base_url('assets/uploads/images/products/') . $value->product_image; ?>"
                                     alt="Article Shopiza" height="150">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="product-details">

                            <h1 class="product-name"><?= $value->product_title; ?></h1>
                            <div>
                                <h3 class="product-price">$<?= $value->product_price; ?>
                                    <del class="product-old-price">$<?= $value->product_old_price; ?></del>
                                </h3>
                                <span class="product-available">Disponible Stock</span>
                            </div>
                            <p><?php echo word_limiter($value->product_description,50); ?></p>

                            <div class="add-to-cart">
                                <a href="<?= base_url('shopping/addToCart/') . $value->product_id; ?>"
                                   class="btn btn-danger"><i class="fa fa-shopping-cart fa-2x"></i>
                                    Ajouter au panier
                                </a>
                            </div>
                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="#"><i class="fa fa-facebook fa-2x"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin fa-2x"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter fa-2x"></i></a></li>
                                <li><a href="#"><i class="fa fa-instagram fa-2x"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope fa-2x"></i></a></li>
                            </ul>

                        </div>
                    </div>

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                                <li><a data-toggle="tab" href="#tab2">Details</a></li>
                                <li><a data-toggle="tab" href="#tab3">Reviews (3)</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p><?php echo $value->product_description; ?></p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->

                                <!-- tab2  -->
                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                tempor
                                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                quis
                                                nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                consequat.
                                                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                                                dolore eu
                                                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                                                sunt in
                                                culpa qui officia deserunt mollit anim id est laborum.</p>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                                tempor
                                                incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                quis
                                                nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                                                consequat.
                                                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                                                dolore eu
                                                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                                                sunt in
                                                culpa qui officia deserunt mollit anim id est laborum.</p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab2  -->

                                <!-- tab3  -->
                                <div id="tab3" class="tab-pane fade in">
                                    <div class="row">
                                        <!-- Rating -->
                                        <div class="col-md-3">
                                            <div id="rating">
                                                <div class="rating-avg">
                                                    <span>4.5</span>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                                <ul class="rating">
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: 80%;"></div>
                                                        </div>
                                                        <span class="sum">3</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: 60%;"></div>
                                                        </div>
                                                        <span class="sum">2</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Rating -->

                                        <!-- Reviews -->
                                        <div class="col-md-6">
                                            <div id="reviews">
                                                <ul class="reviews">
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                                sed do
                                                                eiusmod tempor incididunt ut labore et dolore magna
                                                                aliqua</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="reviews-pagination">
                                                    <li class="active">1</li>
                                                    <li><a href="#">2</a></li>
                                                    <li><a href="#">3</a></li>
                                                    <li><a href="#">4</a></li>
                                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <!-- /Reviews -->

                                        <!-- Review Form -->
                                        <div class="col-md-3">
                                            <div id="review-form">
                                                <form class="review-form">
                                                    <input class="input" type="text" placeholder="Your Name">
                                                    <input class="input" type="email" placeholder="Your Email">
                                                    <textarea class="input" placeholder="Your Review"></textarea>
                                                    <div class="input-rating">
                                                        <span>Your Rating: </span>
                                                        <div class="stars">
                                                            <input id="star5" name="rating" value="5"
                                                                   type="radio"><label
                                                                    for="star5"></label>
                                                            <input id="star4" name="rating" value="4"
                                                                   type="radio"><label
                                                                    for="star4"></label>
                                                            <input id="star3" name="rating" value="3"
                                                                   type="radio"><label
                                                                    for="star3"></label>
                                                            <input id="star2" name="rating" value="2"
                                                                   type="radio"><label
                                                                    for="star2"></label>
                                                            <input id="star1" name="rating" value="1"
                                                                   type="radio"><label
                                                                    for="star1"></label>
                                                        </div>
                                                    </div>
                                                    <button class="primary-btn">Submit</button>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- /Review Form -->
                                    </div>
                                </div>
                                <!-- /tab3  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>

                <?php }
            } else { ?>
                <div class="alert alert-danger">
                    <div class="text-center">
                        <h3>Aucun article en stock. Merci de votre confiance !</h3>
                    </div>
                </div>
            <?php } ?>
        </div>

        <!-- /product tab -->
    </div>
    <!-- /row -->
</div>
<!-- /SECTION -->

<!-- Section -->
<div class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <div class="section-title text-center">
                    <h3 class="title">All Products</h3>
                </div>
            </div>

            <?php $line = 1;
            if (!empty($allProduits)) {
                foreach ($allProduits as $value) { ?>

                    <!-- product -->
                    <div class="col-lg-3 col-sm-6">
                        <div class="ml-1 mr-1 ">
                        <div class="card product">
                            <div class="product-img">

                                    <a href="<?= base_url('produits/details/') . $value->product_id; ?>">
                                        <img src="<?= base_url('assets/uploads/images/products/') . $value->product_image; ?>"
                                             alt="Article" height="250" width="265">
                                    </a>

                                <div class="product-label">
                                    <span class="new">Arrivals</span>
                                </div>
                            </div>
                            <div class="product-body">
                                <h3 class="product-name">
                                    <a href="<?= base_url('produits/details/') . $value->product_id; ?>"><?= $value->product_title; ?></a>
                                </h3>
                                <h4 class="product-price">$<?= $value->product_price; ?>
                                    <del class="product-old-price">
                                        $<?= $value->product_old_price; ?></del>
                                </h4>
                            </div>
                            <div class="add-to-cart">
                                <a href="<?= base_url('shopping/addToCart/') . $value->product_id; ?>"
                                   class="add-to-cart-btn small"><i class="fa fa-shopping-cart"></i>
                                    Ajouter au panier
                                </a>
                            </div>
                        </div>
                        </div>
                        <!-- /product -->
                    </div>
                <?php }
            } else { ?>
                <div class="alert alert-danger">
                    <div class="text-center">
                        <h3>Aucun article en stock. Merci de votre confiance !</h3>
                    </div>
                </div>
            <?php } ?>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /Section -->
