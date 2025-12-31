<?php

namespace App\Middleware;


use App\Helpers\FlashMessage;
use App\Helpers\SessionManager;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Routing\RouteContext;

class AuthMiddleware implements MiddlewareInterface
{

    public function process(Request $request, RequestHandler $handler): Response
    {
       if(SessionManager::get('is_authenticated')){
        return $handler->handle($request);

       }else {
        FlashMessage::error("Please log in to access this page.");
        $routeParser = RouteContext::fromRequest($request)->getRouteParser();
        $loginUrl = $routeParser->urlFor('auth.login');
        $psr17Factory = new \Nyholm\Psr7\Factory\Psr17Factory();
        $response = $psr17Factory->createResponse(302);
        return $response->withHeader('Location', $loginUrl)->withStatus(302);
       }
    }

}
