<?php

	namespace Ajepp\DB;
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
				return $result;
			}
			else
			{
				return $this->db->error;
			}
			
			$result->close();
        }

        public function queryWithLastId($query)
		{
			$result = $this->db->query($query);
			return (object) array('id' => $this->db->insert_id, 'result' => $result);
			$result->close();
		}

    }
?>