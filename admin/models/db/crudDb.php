<?php

	namespace Ajepp\DB;

	if(file_exists("../config.php"))
	{
		require_once "../config.php";
    }

	use Ajepp\DB\connection as cn;

    class CrudDb extends cn
    {
		private $db;

		function __construct()
		{
			$this->db = cn::connect();
		}

		function __destruct() 
		{
			$this->db->close();
		}

        public function query($query)
        {
			if($result = $this->db->query($query))
			{
				return (object) array('error' => false, 'result' => $result, 'message' => 'Query excecuted');
			}
			else
			{
				return (object) array('error' => true, 'result' => null, 'message' => $this->db->error);
			}
			
			$result->close();
        }

        public function queryWithLastId($query)
		{
			if($result = $this->db->query($query))
			{
				return (object) array('error' => false, 'id' => $this->db->insert_id, 'result' => $result, 'message' => 'Query excecuted');
			}
			else
			{
				return (object) array('error' => true, 'id' => null, 'result' => null, 'message' => $this->db->error);
			}
			
			$result->close();
		}


    }
?>