<?php


namespace App\Helpers;

class FlashMessage{

    private const FLASH_KEY =  'flash_messages';


public static function success($message){

    self::add('success',$message);
}
public static function info($message){

    self::add('info',$message);
}

public static function warning($message){

    self::add('warning',$message);
}

public static function error($message){

    self::add('error',$message);
}



public static function add(string $type, string $message) : void{

  if(!isset($_SESSION[self::FLASH_KEY])){
    $_SESSION[self::FLASH_KEY] = [];
  }

    $_SESSION[self::FLASH_KEY][] = [
        'type'  => $type,
        'message'=> $message
    ];

    }






    /**
     * Get all flash messages and clear them.
     */
    public static function get(): array
    {
        $messages = $_SESSION[self::FLASH_KEY] ?? [];
        unset($_SESSION[self::FLASH_KEY]);
        return $messages;
    }

    /**
     * Check if there are any flash messages.
     */
    public static function has(): bool
    {
        return !empty($_SESSION[self::FLASH_KEY]);
    }

    /**
     * Clear all flash messages without retrieving them.
     */
    public static function clear(): void
    {
        unset($_SESSION[self::FLASH_KEY]);
    }

    /**
     * Render all flash messages as Bootstrap alerts.
     */
    public static function sweetRender(): string
    {
        $messages = self::get();
        if (empty($messages)) {
            return '';
        }


        $script = '';
        foreach ($messages as $flash) {
            $type = $flash['type'];
            $message = htmlspecialchars($flash['message']);


                $script .= <<<HTML
                <script>
                Swal.fire({
                title: "$type",
                text: "$message",
                icon: "$type",
                  });
                </script>
                HTML;

            }


        return $script;
    }



     public static function render(bool $dismissible = true): string
    {
        $messages = self::get();
        if (empty($messages)) {
            return '';
        }

        $bootstrapTypes = [
            'success' => 'success',
            'error' => 'danger',
            'info' => 'info',
            'warning' => 'warning'
        ];

        $html = '';
        foreach ($messages as $flash) {
            $type = $bootstrapTypes[$flash['type']] ?? 'info';
            $message = htmlspecialchars($flash['message']);

            if ($dismissible) {
                $html .= <<<HTML
                <div class="alert alert-{$type} alert-dismissible fade show" role="alert">
                    {$message}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                HTML;
            } else {
                $html .= <<<HTML
                <div class="alert alert-{$type}" role="alert">
                    {$message}
                </div>
                HTML;
            }
        }

        return $html;
    }
}



