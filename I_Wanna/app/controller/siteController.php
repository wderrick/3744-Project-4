<?php 
include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController { 

	// route us to the appropriate class method for this action
	public function route($action) {
		if ($action == 'registration') {
			// Specially handled.
			$action = $this->registration();
		}
	
		switch($action) {
			case 'home':
				if (!isset($_SESSION['user'])) {
					$pageTitle = 'I Wanna!';
				} else {
					$pageTitle = $_SESSION['user']->get('first_name').' '.$_SESSION['user']->get('last_name').' wanna!';
				}
				break;

			case 'char':
				if (!isset($_SESSION['user'])) {
					$pageTitle = 'You didn\'t say who you are...';
					$action = 'login';
				} else {
					$pageTitle = $_SESSION['user']->get('first_name').' '.$_SESSION['user']->get('last_name').' wanna!';
				}
				break;
				
			case 'regi':
    		$pageTitle = 'I heard you wanna?';
				break;
				
			case 'mobi':
   		 	$pageTitle = "I wanna it on the go >.>";
				break;
				
			case 'cont':
				if (!isset($_SESSION['user'])) {
					$pageTitle = 'You didn\'t say who you are...';
					$action = 'login';
				} else {
    			$pageTitle = "Tell me what you wanna: ";
    		}
				break;

			case 'edit':
				$pageTitle = 'You wanna change?';
				$action = $this->edit();
				break;
				
			case 'login':
    		$this->login();
				if (!isset($_SESSION['user'])) {
					$pageTitle = 'I Wanna!';
				} else {
					$pageTitle = $_SESSION['user']->get('first_name').' '.$_SESSION['user']->get('last_name').' wanna!';
				}
    		$action = 'home';
				break;
				
			case 'logout':
				$pageTitle = "Bye bye... I guess.";
    		$this->logout();
    		$action = 'home';
				break;
				
			case 'error':
    		$pageTitle = "It doesn't look like it wanna...";
		}
		include_once(SYSTEM_PATH.'/view/settings.php');	
		include_once(SYSTEM_PATH.'/view/header.php');
		include_once(SYSTEM_PATH.'/view/'.$action.'.tpl');
		include_once(SYSTEM_PATH.'/view/footer.php');	
	}
	
	public function registration() {
		$_SESSION['username'] = $_POST['username'];
		$password = $_POST['password'];
		$_SESSION['email'] = $_POST['email'];
		$_SESSION['first_name'] = $_POST['first_name'];
		$_SESSION['last_name'] = $_POST['last_name'];
		$password_confirm = $_POST['pswd_confirm'];
		
		// html handled the empty space. Assume all POSTs are legal.
		if (AppUser::loadByUser($_SESSION['username']) !== null) {
			$_SESSION['error'] = "Username ".$_SESSION['username']." already exists!";
		} elseif(AppUser::loadByUser($_SESSION['email']) !== null) {
			$_SESSION['error'] = "Email ".$_SESSION['email']." already exists!";
		} elseif($password !== $password_confirm) {
			$_SESSION['error'] = "Passwords don't match!";
		}
		else {
			$new_user = new AppUser(array(
				'username' => $_SESSION['username'],
				'password' => $password,
				'email' => $_SESSION['email'],
				'first_name' => $_SESSION['first_name'],
				'last_name' => $_SESSION['last_name']
			));
			$new_user->save();
			$_SESSION['user'] = $new_user;
			header('Location: '.BASE_URL);
			return;
		}
		return 'regi';
	}

	public function login() {
		$_SESSION['identity'] = $_POST['identity'];
		$password = $_POST['password'];
		
		$user = AppUser::loadByUser($_SESSION['identity']);
		if($user == null) {
			$_SESSION['error'] = "Username or email does not exist!";
		} elseif($user->get('password') != $password) {
			$_SESSION['error'] = "Password is incorrect!";
		} else {
			$_SESSION['user'] = $user;
			header('Location: '.BASE_URL);
		}
	}

	public function logout() {
		// erase the session
		unset($_SESSION['user']);
		session_destroy(); // for good measure
	}
	
	public function edit() {
		// edit() can only be called when is logged in.
		$current = $_SESSION['user']->get('password');
		$pswd_current = $_POST['pswd_current'];
		$password = $_POST['password'];
		$pswd_confirm = $_POST['pswd_confirm'];
		
		if ($current === $pswd_current) {
			if ($password == $pswd_confirm) {
				$user = AppUser::loadById($_SESSION['user']->getId());
				$user->set('password', $password);
				$user->save();
				return 'home';
			}
			$_SESSION['error'] = "Passwords don't match!";
			return 'char';
		}
		$_SESSION['error'] = "Current password is incorrect!";
		return 'char';
	}
} 