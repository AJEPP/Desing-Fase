<?php
   /**
   *
   * @About:      Controller of providers
   * @File:       proveedoresController.php
   * @Date:       2020-06-14T13:45:59
   * @Version:    $Rev:$ 1.0
   * @Developer:  José Daniel Quijano (jose.quijano55@gmail.com)
   **/

   namespace Ajepp\Controllers;

   use Ajepp\Models\proveedoresModel as model;

   class ProveedoresController
   {
       private $model;

       public function __construct()
       {
           $this->model = new model();
       }

       public function getProviders()
       {
           $providers = $this->model->getProviders();

           $list = '';
            $cont = 1;
           if($providers->num_rows > 0)
           {
            while($prov = $providers->fetch_object())
            {
                 $list.='<tr>
                            <td>'.$cont.'</td>
                            <td>'.$prov->pro_nombre.'</td>
                            <td>'.$prov->pro_apellido.'</td>
                            <td>'.$prov->pro_correo.'</td>
                            <td>'.$prov->pro_celular.'</td>
                            <td>
                                <a class = "text-success" href="#" data-id = "'.$prov->id.'">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a class = "text-danger" href="#" data-id = "'.$prov->id.'">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                         </tr>';

                $cont++;
            }
           }
           else
           {
               $list = '<tr class = "text-center">
                            <td colspan = "6"><b>No hay proveedores registrados</b></td>
                        </tr>';
           }

           return $list;
       }
   }
?>