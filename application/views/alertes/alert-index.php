<?php if ((isset($_SESSION['success'])) OR (isset($_SESSION['error']))) {

    if (!empty($_SESSION['success']) OR !empty($_SESSION['error'])) {

        $messageNotife = (isset($_SESSION['success'])) ? $_SESSION['success'] : $_SESSION['error'];

        $typeMsg = (isset($_SESSION['success'])) ? 'alert-success' : 'alert-danger';

        ?>

        <div class="row" id="alt" style="display: none">

            <div class="col-sm-12">
                <div class="alert alert-dismissible <?= $typeMsg; ?>">
                    <button id="bld" type="button" class="close" aria-label="Close">
                        <span aria-hidden="true">×</span></button>
                    <strong><?= $messageNotife; ?></strong>
                </div>
            </div>
        </div>

        <?php
    }
}
unset($_SESSION['success']);
unset($_SESSION['error']);

?>