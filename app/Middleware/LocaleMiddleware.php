<?php

namespace App\Middleware;

use App\Helpers\SessionManager;
use App\Helpers\TranslationHelper;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Server\MiddlewareInterface;
class LocaleMiddleware implements MiddlewareInterface
{
    private TranslationHelper $translator;

public function __construct(TranslationHelper $translator) {
    $this->translator  = $translator;
}

public function process(Request $request, RequestHandler $requestHandler): ResponseInterface{

$lang = $request->getQueryParams()['lang']  ?? null;

if (isset($lang) && $this->translator->isLocaleAvailable($lang ?? '')) {
    SessionManager::set('locale', $lang);
$this->translator->setLocale($lang);
}elseif(SessionManager::has('locale')&& $this->translator->isLocaleAvailable(SessionManager::get('lang') ??'')) {
$this->translator->setLocale(SessionManager::has('locale'));
}else {
    $this->translator->setLocale($this->translator->getDefaultLocale());
}

$request = $request->withAttribute('Locale', $lang);

return $requestHandler->handle($request);

}

}
