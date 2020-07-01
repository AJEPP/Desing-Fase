<?php
namespace Ajepp\Functions;

class DateDecode{
  public function decodeFecha($fecha)
    {

      $format_d = explode("%", $fecha);

      $year = $format_d[0];
      $time= '';

      for($x=1;$x<=count($format_d)-1;$x++){
          if($x == 1)
          {
              $time .=substr_replace($format_d[$x],'',0,2);
          }else{ $time .=substr_replace($format_d[$x],':',0,2);}

          }

      $date_decode = $year.' '.$time;

      return $date_decode;

    }
}
 ?>
