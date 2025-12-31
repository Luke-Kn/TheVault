<?php

namespace App\Helpers;

use App\Helpers\Core\Result;

use function DI\add;

class FieldValidator
{
    private const FLASH_KEY =  'field_validation';



    public static function isFloat($var){

        $var  = htmlspecialchars($var);

        if (!isset($var)) {
           self::add( Result::failure("Float must be set"));
        }elseif (!filter_var($var,FILTER_VALIDATE_FLOAT)) {
            self::add( Result::failure("Float is not of type float"));
        }
    }

    public static function isEmail($var){
        $var  = htmlspecialchars($var);
        if (!isset($var)) {
           self::add(Result::failure("Email must be set"));
        }elseif (!filter_var($var,FILTER_VALIDATE_EMAIL)) {
           self::add( Result::failure("Email must be formatted properly"));
        }

    }

    public static function isText($var){
        $var  = htmlspecialchars($var);
        if (!isset($var)) {
           self::add( Result::failure("Text must be set"));
        }elseif (!is_string($var)) {
           self::add( Result::failure("Text must be a string"));
        }
    }

        public static function isPassword($var, $confirm){
        $var  = htmlspecialchars($var);
        if (!isset($var)) {
           self::add( Result::failure("Password must be set"));
        }elseif (strlen($var)<8) {
           self::add( Result::failure("Password must be at least 8 characters"));
        }elseif (!is_string($var)) {
           self::add( Result::failure("Password must be a string"));
        }elseif (!preg_match('/[0-9]/', $var)) {
           self::add( Result::failure("Password must contain a number"));
        }elseif ( $var != $confirm) {
           self::add( Result::failure("Password must match confirmation"));
        }
    }

        public static function isName($var){
        $var  = htmlspecialchars($var);
        if (!isset($var)) {
            self::add( Result::failure("Name must be set"));
        }elseif (!preg_match("/^[a-zA-Z]+$/", $var)) {
           self::add( Result::failure("Name must only contain letters"));
        }elseif (!is_string($var)) {
           self::add( Result::failure("Name must be a String"));
        }

    }

    public static function isNumber($var) {
        $var  = htmlspecialchars($var);
        if (!isset($var)) {
           self::add( Result::failure("Number must be set"));
        }elseif (!is_int((Int) $var)) {
            dd($var);
           self::add( Result::failure("Number must be an integer"));
        }
    }

    public static function add(Result $result){
 if(!isset($_SESSION[self::FLASH_KEY])){
    $_SESSION[self::FLASH_KEY] = [];
  }

    $_SESSION[self::FLASH_KEY][] = [
        'message'  => $result->getMessage(),
    ];
    }

public static function checkResults() : bool{
    if(!empty($_SESSION[self::FLASH_KEY])){
    foreach ($_SESSION[self::FLASH_KEY] as $result) {
            FlashMessage::error($result['message']);

         }
    }

    return !empty($_SESSION[self::FLASH_KEY]);

}

public static function getKey(){


    return self::FLASH_KEY;
}

public static function messages(): String {
$messages = "";

    foreach ($_SESSION[self::FLASH_KEY] as $result) {
        $messages = $messages." / ".$result->getMessage();
    }
    return $messages;
}

public static function clear(){

 unset($_SESSION[self::FLASH_KEY]);

}


}
