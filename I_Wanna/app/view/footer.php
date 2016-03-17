<?php
	// The footer menu, unlike the header menu, does not disable for current page.
	function footer_menu($dir, $title) {
		echo '<li class="menu_left">';
  	switch ($dir) {
  		case ('home'):
  			$dir = '';
  			break;
  		case ('char'):
  			$dir = 'Character/';
  			break;
  		case ('login'):
  			$dir = 'Login/';
  			break;
  		case ('regi'):
  			$dir = 'Registration/';
  			break;
  		case ('mobi'):
  			$dir = 'Mobile/';
  			break;
  		case ('cont'):
  			$dir = 'Contact-Us/';
  			break;
  	}
    echo '<a href="'.BASE_URL.$dir.'"><div class="footer_menu">'.$title.'</div></a></li>';
	}
?>

</div>
<img src="<?= BASE_URL ?>public/img/footer.png" alt="footer" class="footer"/>
<ul class="footer_menu_wrapper">
	<?php
		footer_menu("home", "Home Page");
		footer_menu("char", "Character Profile");
		footer_menu("regi", "Register");
		footer_menu("mobi", "Mobile Version");
		footer_menu("cont", "Contact Us");
	?>
	<li class="menu_right">
		<div>
			<p id="copyright">Copyright 2016 All Rights Reserved
			</p>
		</div>
	</li>
</ul>