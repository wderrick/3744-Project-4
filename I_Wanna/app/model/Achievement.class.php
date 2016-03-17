<?php
	class Achievement extends DbObject {
		const DB_TABLE = 'achievements';
			
		protected $id;
		protected $title;
		protected $content;
			
		// constructor
    public function __construct($args = array()) {
      $defaultArgs = array(
  	     'id' => null,
         'title' => null,
         'intro' => null
      );

			$args += $defaultArgs;

    	$this->id = $args['id'];
      $this->title = $args['title'];
      $this->intro = $args['intro'];
    }

    // load object by ID
    public static function loadById($id) {
      $db = Db::instance();
      $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
      return $obj;
    }
	}
