<?php

class ContactUs extends DbObject {
    // name of database table
    const DB_TABLE = 'contact';

    // database fields
    protected $id;
    protected $author_id;
    protected $name;
    protected $subject;
    protected $content;
    protected $time;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
        		'id' => null,
            'author_id' => 0,
            'name' => '',
            'subject' => '',
            'content' => '',
            'time' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->author_id = $args['author_id'];
        $this->name = $args['name'];
        $this->subject = $args['subject'];
        $this->content = $args['content'];
        $this->time = $args['time'];
    }
    
    public function email() {
    	// Won't work unless an SMTP server is set up. On local server it's not likely.
    	$message = 'From: '.$this->name.'\n\nContents: '.$this->content.'\n\nTime: '.$this->time;
    	mail(EMAIL, $this->subject, $message);
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
        		'id' => $this->id,
        		'author_id' => $this->author_id,
            'name' => $this->name,
            'subject' => $this->subject,
            'content' => $this->content,
            'time' => $this->time
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
        // $this->email();
    }

    // load object by ID. Management purposes only.
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }
    

    // delete object by ID.
    public static function deleteById($id) {
        $db = Db::instance();
        $query = sprintf(" DELETE FROM %s WHERE id = '%s' LIMIT 1 ",
        	self::DB_TABLE,
        	$id
        	);
        $db->execute($query);
    }
    
    // load object by author id.
    public static function loadByAuthor($author_id=null) {
        if($author_id === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE author_id = '%s' ",
            self::DB_TABLE,
            $author_id
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result))
            return null;
        else {
            $row = mysqli_fetch_assoc($result);
            $obj = self::loadById($row['id']);
            return ($obj);
        }
    }
    
    // load all comments on database
    public static function getAllCommentsOfAuthor($author_id=null) {
        $query = sprintf(" SELECT id FROM %s WHERE author_id = '%s' ",
            self::DB_TABLE,
            $author_id
            );
        $db = Db::instance();
        $result = $db->lookup($query);
        if(!mysqli_num_rows($result))
            return null;
        else {
            $objects = array();
            while($row = mysqli_fetch_assoc($result)) {
                $objects[] = self::loadById($row['id']);
            }
            return ($objects);
        }
    }
}
