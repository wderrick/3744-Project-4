<?php

class Intro extends DbObject {
    // name of database table
    const DB_TABLE = 'intro';

    // database fields
    protected $id;
    protected $title;
    protected $img;
    protected $img_alt;
    protected $subtitle;
    protected $content;

    // constructor
    public function __construct($args = array()) {
        $defaultArgs = array(
            'id' => null,
            'img' => null,
            'img_alt' => null,
            'title' => null,
            'subtitle' => null,
            'content' => null
            );

        $args += $defaultArgs;

        $this->id = $args['id'];
        $this->img = $args['img'];
        $this->img_alt = $args['img_alt'];
        $this->title = $args['title'];
        $this->subtitle = $args['subtitle'];
        $this->content = $args['content'];
    }

    // load object by ID
    public static function loadById($id) {
        $db = Db::instance();
        $obj = $db->fetchById($id, __CLASS__, self::DB_TABLE);
        return $obj;
    }
}
