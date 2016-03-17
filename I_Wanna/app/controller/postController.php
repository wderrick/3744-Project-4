<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a PostController and route it
$pc = new PostController();
$pc->route($action);

class PostController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'comm':
				$this->comments();
				break;

			case 'delete':
				$this->deletion();
				break;
		}
    $pageTitle = "Tell me what you wanna: ";
		include_once(SYSTEM_PATH.'/view/settings.php');	
		include_once(SYSTEM_PATH.'/view/header.php');
		include_once(SYSTEM_PATH.'/view/cont.tpl');
		include_once(SYSTEM_PATH.'/view/footer.php');	
	}
	
	public function comments() {
		// Name and Subject can be left blank.
		$name = 'Anonymous';
		$subject = '(No subject)';
		$time = date("Y-m-d H:i:s");
		$author_id = $_SESSION['user']->getId();
		
		if($_POST['name'] != '') {
			$name = $_POST['name'];
		}
		if ($_POST['subject'] != '') {
			$subject = $_POST['subject'];
		}
		$content = $_POST['content'];
		
		if ($content == null) {
			$_SESSION['error'] = "You need to at least say something...!";
		} elseif ($author_id == null) {
			$_SESSION['error'] = "How did you make it to this page!";
		} else {
			$cont = new ContactUs(array(
				'author_id' => $author_id,
				'name' => $name,
				'subject' => $subject,
				'content' => $content,
				'time' => $time
			));
			$cont->save();
			header('Location: '.BASE_URL.'Contact-Us/');
		}
	}
	
	public function deletion() {
		ContactUs::deleteById($_GET['id']);
		$_SESSION['error'] = "Deletion successful!";
	}
}
