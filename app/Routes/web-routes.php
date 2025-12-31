<?php

declare(strict_types=1);

/**
 * This file contains the routes for the web application.
 */

use App\Middleware\SessionMiddleware;
use App\Middleware\AdminAuthMiddleware;
use App\Middleware\TwoFactorMiddleware;
use App\Middleware\AuthMiddleware;
use App\Middleware\LocaleMiddleware;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;


return static function (Slim\App $app): void {

    $app->add(SessionMiddleware::class);
    $app->add(LocaleMiddleware::class);
 
};
