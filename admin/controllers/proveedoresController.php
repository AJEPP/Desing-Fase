<?php
   /**
    *
    * @About:      proveedoresController for all modules
    * @File:       proveedoresController.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/

  namespace Ajepp\Controllers;
  
  use Ajepp\Models\proveedoresModel as proveedoresModel;

  class proveedoresController
  {
    private $model;

    public function __construct()
    {
        $this->model = new proveedoresModel();
    }

    public function getproveedoress()
    {
        $proveedores = $this->model->getproveedoress();

        $list = '';
        $cont = 1;

        while($prov = $proveedores->result->fetch_object())
        {
            $list.='<tr>
                <td>'.$cont.'</td>
                <td>'.$prov->pro_nombre.'</td>
                <td>'.$prov->pro_apellido.'</td>
                <td>'.$prov->pro_edad.'</td>
                <td>'.$prov->pro_genero.'</td>
                <td>'.$prov->pro_nacionalidad.'</td>
                <td>'.$prov->pro_dirreccion.'</td>
                <td class = "">
                    <a class ="text-warning edit" href="#" data-id = "'.$prov->id_prov.'"><i class="fas fa-edit"></i></a>
                    <a class ="text-danger delete" href="#" data-id = "'.$prov->id_prov.'"><i class="fas fa-trash"></i></a>
                </td>
            </tr>';

            $cont++;
        }

        echo $list;
    }

    public function addproveedores($data)
    {
        $add = $this->model->addproveedores($data);  
        return $add;     
    }

    public function getproveedores($id)
    {
        $pro = $this->model->getProveedores($id);
        if($pro->result->num_rows > 0 )
        {
            $rsp = (object) array('error' => false, 'data' => $pro->result->fetch_object());
        }
        else
        {
            $rsp = (object) array('error' => true, 'data' => null);
        }
        return $rsp;
        // return $pro;
    }

    public function editproveedores($data)
    {
       $edit = $this->model->editproveedores($data);
       return $edit;     
    }
 
    public function deleteproveedores($id)
    {
       $delete = $this->model->deleteproveedores($id);
       return $delete;
    }

  }
?>
