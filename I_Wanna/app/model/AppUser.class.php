<?php

class AppUser extends DbObject {
    // name of database table
    const DB_TABLE = 'user';

    // database fields
    protected $id;
    protected $avatar;
    protected $username;
    protected $first_name;
    protected $last_name;
    protected $password;
    protected $email;
    protected $progress;
    protected $deaths;
    protected $time;
    protected $start_time;
    protected $achievements;
    protected $achievement;
    protected $achi;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'avatar' => '/avatar/default.png',
            'username' => '',
            'password' => '',
            'email' => null,
            'first_name' => null,
            'last_name' => null,
            'progress' => 0,
            'deaths' => 0,
            'time' => date("H:i:s", mktime(0,0,0)),
            'start_time' => date("Y-m-d H:i:s"),
            'achievements' => 0
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->avatar = $args['avatar'];
        $this->username = $args['username'];
        $this->password = $args['password'];
        $this->email = $args['email'];
        $this->first_name = $args['first_name'];
        $this->last_name = $args['last_name'];
        $this->progress = $args['progress'];;
        $this->deaths = $args['deaths'];
        $this->time = $args['time'];
        $this->start_time = $args['start_time'];
        $this->achievements = array_sum(str_split(decbin($args['achievements'])));
        $this->achievement = str_split(decbin($args['achievements']));
    }

    // save changes to object
    public function save() {
        $db = Db::instance();
        // omit id and any timestamps
        $db_properties = array(
        		'avatar' => $this->avatar,
            'username' => $this->username,
            'password' => $this->password,
            'email' => $this->email,
            'first_name' => $this->first_name,
            'last_name' => $this->last_name,
            'start_time' => $this->start_time
            );
        $db->store($this, __CLASS__, self::DB_TABLE, $db_properties);
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }

    // load user by username
    public static function loadByUser($identity=null) {
        if($identity === null)
            return null;

        $query = sprintf(" SELECT id FROM %s WHERE (username = '%s' OR email = '%s') ",
            self::DB_TABLE,
            $identity,
            $identity
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
}
