<?php
   /**
   *
   * @About:      Form decode for use on requests
   * @File:       formDecode.php
   * @Date:       2020-05-24T21:49:27
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/
    namespace Ajepp\Fucntions;
    
    class FormDecode
    {

        public function getFormData($form)
        {
            $tempar = array();
            $form = urldecode($form);
            $frm = explode("&", $form);
            $data = (object)[];

            for($i = 0; $i < count($frm); $i++)
            {
                $temp = explode("=", $frm[$i]);
                //array_push($tempar, array($temp[0] => $temp[1]));
                $tempar[$temp[0]] = $temp[1];
            }
             $data = (object) $tempar;
            /*return json_decode($data); */

            return $data;
        }
    
    }

?>
