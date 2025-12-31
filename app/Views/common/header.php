<?php

use App\Helpers\SessionManager;


?>
<!DOCTYPE html>
<html lang="en">

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">E-Commerce</a>
            <div class="navbar-nav ms-auto">
                <span class="navbar-text me-3">
                    <?= trans('header.welcome')?>, <?= htmlspecialchars(SessionManager::get('user_name')) ?>!
                </span>
                <a href="dashboard"><button type="button" id="accountBtn" class="btn btn-outline-light me-2"><i class="bi bi-person-fill"></i> <?= trans('header.account')?></button></a>
                <button type="button" id="cartBtn" class="btn btn-outline-light me-2"><i class="bi bi-cart" style="color: black;"></i> <?= trans('header.cart')?></button>
                <a href="<?=APP_BASE_URL?>/user/logout" > <button class="btn btn-outline-light btn-sm me-2 p-2"><?= trans('header.logout')?></button> </a>
                <button
                    class="btn btn-primary  dropdown-toggle d-flex align-items-center "
                    id="bd-theme"
                    type="button"
                    aria-expanded="false"
                    data-bs-toggle="dropdown"
                    aria-label="Toggle theme (auto)">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-translate" viewBox="0 0 16 16">
                        <path d="M4.545 6.714 4.11 8H3l1.862-5h1.284L8 8H6.833l-.435-1.286zm1.634-.736L5.5 3.956h-.049l-.679 2.022z" />
                        <path d="M0 2a2 2 0 0 1 2-2h7a2 2 0 0 1 2 2v3h3a2 2 0 0 1 2 2v7a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-3H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v7a1 1 0 0 0 1 1h7a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zm7.138 9.995q.289.451.63.846c-.748.575-1.673 1.001-2.768 1.292.178.217.451.635.555.867 1.125-.359 2.08-.844 2.886-1.494.777.665 1.739 1.165 2.93 1.472.133-.254.414-.673.629-.89-1.125-.253-2.057-.694-2.82-1.284.681-.747 1.222-1.651 1.621-2.757H14V8h-3v1.047h.765c-.318.844-.74 1.546-1.272 2.13a6 6 0 0 1-.415-.492 2 2 0 0 1-.94.31" />
                    </svg>
                    <span class="visually-hidden" id="bd-theme-text">Toggle language</span>
                </button>
                <ul
                    class="dropdown-menu dropdown-menu-end shadow"
                    aria-labelledby="bd-theme-text">
                    <li>
                        <form method="GET">
                            <input type="hidden" name="lang" value="fr">
                            <input type="submit" value="French" class="dropdown-item d-flex align-items-center">
                        </form>
                    </li>
                    <li>
                        <form method="GET">
                            <input type="hidden" name="lang" value="en">
                            <input type="submit" value="English" class="dropdown-item d-flex align-items-center">
                        </form>
                    </li>
                </ul>


            </div>
        </div>
    </nav>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <title><?= $page_title ?></title>

        <div id="cart" class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvas" aria-labelledby="offcanvasRightLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasRightLabel">

                </h5>
                <button id="cartClose" type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <h3><?= trans('header.your_cart')?></h3>
                <form action="update_item" method="POST">
                    <ul class="list-group">

                        <?php
                        $total = 0.0;
                        $cart = SessionManager::get('cart');
                        foreach ($cart ?? [] as $name => $item):
                            $total += (($item['price'])  * (int) $item['amount'] ?? 1)
                        ?>
                            <li class="list-group-item text-bg-dark">
                                <?= $name ?> - <?= $item['price']  ?>$
                                <div class=" mb-4">
                                    <input class="text-bg-dark" type="number" name="<?= $item['id'] ?>" value="<?= $item['amount'] ?>">

                                </div>

                                <a href="remove_item/<?= $name ?>" class="btn btn-danger"> <?= trans('header.accout')?></a>

                            </li>
                            <br>
                        <?php endforeach; ?>
                    </ul>
                    <input type="submit" class="btn btn-success btn-sm" value="Confirm Changes">

                </form>
            </div>
            <footer style="margin-left:20px;">
                <h3> Total: <?= $total ?> $</h3>
                <a class="btn btn-primary btn-sm" href="checkout"><?= trans('header.checkout')?></a>
            </footer>
        </div>

        <script>
            $('#cartBtn').click(function() {


                if ($('#cart').hasClass('show')) {
                    $('#cart').removeClass('show');
                } else {
                    $('#cart').addClass('show');
                }
            })
            $('#cartClose').click(function() {

                $('#cart').removeClass('show');
            })
        </script>
    </head>






    <body>
