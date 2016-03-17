<div id="info" class="animated fadeInRight bground_info">
	<?php 
	// PHP: The job of checking whether the user is logged in has been handled by the siteController.
	?>
  <img src="<?= BASE_URL ?>public/img<?= $_SESSION['user']->get('avatar') ?>" alt="Avatar" class="in_block_img"/>
  <h1> 
  <?php
  	echo $_SESSION['user']->get('first_name'); 
  	echo ' ';
  	echo substr($_SESSION['user']->get('last_name'), 0, 1);
  	echo '.';
  ?>
  </h1>
  <h2> Progress </h2>
  <p> Stages <?= $_SESSION['user']->get('progress') ?> / 10 </p>
  <h2> Play Time </h2>
  <p> <?= $_SESSION['user']->get('time') ?> </p>
  <p> since <?= $_SESSION['user']->get('start_time') ?> </p>
  <h2> Deaths </h2>
  <p> <?= $_SESSION['user']->get('deaths') ?> </p>
  <h2> Achievements </h2>
  <p> <?= $_SESSION['user']->get('achievements') ?> </p>
</div>

<div id="achievement" class="animated fadeInLeft bground_char">
  <h1> Recent Achievements </h1>
  <?php
  	$number = $_SESSION['user']->get('achievements');
  	for($i = $number; $i > $number - 7; $i--) {
  		if ($i < 1 || $_SESSION['user']->get('achievement')[$i - 1] == null) {
  			if ($i == $number) {
  				// Means no achievement data is found.
  				echo '<h2># You haven\' won any achievements! Play hard!</h2>';
  			}
  			break;
  		}
  		if ($_SESSION['user']->get('achievement')[$i - 1] == 1) {
  			$achievement = Achievement::loadById($i);
  			echo '<h2># '.$achievement->get('title').'</h2>';
  			echo '<p>>>> '.$achievement->get('intro').'</p>';
  		}
  	}
  ?>
  </div>

<div id="pswd_change"class="bground_char animated fadeInUp hp_right">
  <div class="regi_wrapper">
    <form action="<?= BASE_URL ?>Edit/" method="POST">
    <h1> Change Password </h1>
    <div class="regi"> 
      <label>Current Password</label>
      <input name="pswd_current" type="password" maxlength="30"required/> 
    </div>
    
    <div class="regi"> 
      <label>New Password</label>
      <input name="password" type="password" maxlength="30"required/> 
    </div>
    
    <div class="regi"> 
    	<label>Confirm New Password</label>
      <input name="pswd_confirm" type="password" maxlength="30" required/> 
    </div>
    
    <div class="regi"> 
      <button type="submit">Change Password</button>
    </div>
								
		<p id="error_large"> 
			<?php
				if(isset($_SESSION['error'])) {						
					if($_SESSION['error'] != '') {
						echo $_SESSION['error'];
						$_SESSION['error'] = '';
					}
				}
			?>
		</p>
    
    </form>
  </div>
</div>