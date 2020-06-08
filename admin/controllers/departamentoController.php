<?php
   /**
    *
    * @About:      departamentoController for all modules
    * @File:       departamentoController.php
    * @Date:       2020-03-05T12:53:07
    * @Version:    $Rev:$ 1.0
    * @Developer:  Jose Daniel quijano
    **/

  namespace Ajepp\Controllers;
  
  use Ajepp\Models\departamentoModel as departamentoModel;

  class departamentoController
  {
    private $model;

    public function __construct()
    {
        $this->model = new departamentoModel();
    }

    public function getDepartamentos()
    {
        $departamento = $this->model->getDepartamentos();

        $list = '';
        $cont = 1;

        while($depa = $departamento->result->fetch_object())
        {
        $list.= '<tr>
                    <td>'.$cont.'</td>
                    <td>'.$depa->dep_nombre.'</td>
                    <td>'.$depa->dep_locacion.'</td>
                    <td class = "">
                        <a class ="text-warning edit" href="#" data-id = "'.$depa->id.'"><i class="fas fa-edit"></i></a>
                        <a class ="text-danger delete" href="#" data-id = "'.$depa->id.'"><i class="fas fa-trash"></i></a>
                    </td>
                </tr>';

        $cont++;
        }

        echo $list;
    }

    public function adddepartamento($data)
    {
        $add = $this->model->adddepartamento($data);  
        return $add;     
    }

    public function getdepartamento($id)
      {
         $dep = $this->model->getdepartamento($id);
         if($dep->result->num_rows > 0 )
         {
            $rsp = (object) array('error' => false, 'data' => $dep->result->fetch_object());
         }
         else
         {
            $rsp = (object) array('error' => true, 'data' => null);
         }
         return $rsp;
      }

      public function editdepartamento($data)
      {
         $edit = $this->model->editdepartamento($data);
         return $edit;     
      }

      public function deletedepartamento($id)
      {
         $delete = $this->model->deletedepartamento($id);
         return $delete;
      }

  }
?>
