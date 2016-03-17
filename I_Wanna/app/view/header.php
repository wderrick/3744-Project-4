<?php
	// The header_menu function is to detect which page is requesting this header,
	// and the "current page" in the header menu is disabled and is applied 
	// a different style.
	function header_menu($dir, $direction, $title) {
  	global $action;
  	switch ($dir) {
  		case ('home'):
  			$page = '';
  			break;
  		case ('char'):
  			$page = 'Character';
  			break;
  		case ('regi'):
  			$page = 'Registration';
  			break;
  	}
			echo '<li class="menu_'.$direction;
		if ( $action === $dir) {
			echo '">';
    	echo '<div class="menu_here">'.$title.'</div>';
    } else {
			echo ' hang">';
    	echo '<a href="'.BASE_URL.$page.'">';
    	echo '<div class="menu">'.$title.'</div>';
    	echo '</a>';
    }
	}
?>

<img src="<?= BASE_URL ?>public/img/header.png" alt="header" class="header"/>
<div class="main">
<ul class="menu_wrapper"> 	
	<?php
    header_menu("home", "left", "Home Page");
    header_menu("char", "left", "Character");
    if (!isset($_SESSION['user'])) {
    	header_menu("regi", "right", "Sign Up");
    } else {			
    	echo '<li class="menu_right hang"><a href="'.BASE_URL.'Logout/"><div class="menu">Logout</div></a></li>';
			echo '<li class="menu_right"><div class="menu_here">Welcome, '.$_SESSION['user']->get('first_name').' '.$_SESSION['user']->get('last_name').'!</div></li>';
    }
  ?>
</ul>
