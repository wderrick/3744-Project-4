<div id="login" class="animated fadeInLeft">
<?php 
if (!isset($_SESSION['user'])) {
?>
	<div class="login_wrapper">
		<form action="<?= BASE_URL ?>Login/" method="POST">
      <h2> Sign In </h2>
      <div class="regi">
    		<label class="login" value="<?= (isset($_SESSION['identity'])? $_SESSION['identity'] : '') ?>">Username or Email</label>
    	</div>
      
      <div class="regi">
    		<input class="login" name="identity" type="text" maxlength="30" required/>
    	</div>
      
    	<div class="regi">
    		<label class="login">Password</label>
    	</div>
        
      <div class="regi">
       	<input class="login" name="password" type="password" minlength="6" maxlength="30" required/> 
    	</div>
        
    	<div class="regi">
      	<button type="submit">Sign In</button>
    	</div>
								
			<p id="error"> 
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
<?php 
} 
?>

 	<table class="calendar">
  	<tr>
  		<td> &lt;&lt; </td>
  		<td colspan="5"> February 2016 </td>
  		<td> &gt;&gt; </td>
  	</tr>
  	<tr>
  		<td> Sun </td>
  		<td> Mon </td>
  		<td> Tue </td>
  		<td> Wed </td>
  		<td> Thu </td>
  		<td> Fri </td>
  		<td> Sat </td>
  	</tr>
  	<tr>
  		<td class="not_of_this_month"> 31 </td>
  		<td> 1 </td>
  		<td> 2 </td>
  		<td> 3 </td>
  		<td> 4 </td>
  		<td> 5 </td>
  		<td> 6 </td>
  	</tr>
  	<tr>
  		<td> 7 </td>
  		<td> 8 </td>
  		<td> 9 </td>
  		<td> 10 </td>
  		<td> 11 </td>
  		<td> 12 </td>
  		<td> 13 </td>
  	</tr>
  	<tr>
  		<td> 14 </td>
  		<td> 15 </td>  			
  		<td> 16 </td>
			<td> 17 </td>
  		<td> 18 </td>
  		<td> 19 </td>
  		<td> 20 </td>
  	</tr>
  	<tr>
  		<td> 21 </td>
  		<td> 22 </td>
  		<td> 23 </td>
  		<td> 24 </td>
  		<td> 25 </td>
  		<td> 26 </td>
  		<td> 27 </td>
  	</tr>
  	<tr>
  		<td> 28 </td>
  		<td> 29 </td>
  		<td class="not_of_this_month"> 1 </td>
			<td class="not_of_this_month"> 2 </td>
  		<td class="not_of_this_month"> 3 </td>
  		<td class="not_of_this_month"> 4 </td>
  		<td class="not_of_this_month"> 5 </td>
  	</tr>
		<script>  
			<!-- To make cells look more square.  -->
			var wid = $('td').width();
			$('td').css({'height': wid * 0.9 +'px'});
		</script>
 	</table>
 
	<div class="animated fadeInUp" id="sidebar">
		<script>  
			$( document ).ready(function() {
				var wid = $('.calendar').width();
				$('#sidebar').css({'width': wid + 'px'});
			});
		</script>
		<?php
			if (!isset($_SESSION['user'])) {
				echo '<a href="#"><h2 class="center_text"> Log in to view your character! </h2></a></div></div>';
			} else {
  			echo '<img src="'.BASE_URL.'public/img'.$_SESSION['user']->get('avatar').'" alt="Avatar" class="in_block_img info"/>';
		?>
		<h1> 
		<?php
  		echo $_SESSION['user']->get('first_name'); 
			echo ' ';
 			echo substr($_SESSION['user']->get('last_name'), 0, 1);
 			echo '.';
		?>
		</h1>
		<h2> Progress </h2>
		<p> Stages <?= $_SESSION['user']->get('progress') ?> </p>
		<h2> Play Time </h2>
		<p> <?= $_SESSION['user']->get('time') ?> </p>
		<h2> Deaths </h2>
		<p> <?= $_SESSION['user']->get('deaths') ?> </p>
	</div> 
</div>
<?php
}
	// The intro. At most 4 will be displayed on the page.
	for($i = 1; $i <= 4; $i++) {
		$intro = Intro::loadById($i);
		if ($intro == null) {
			break;
		}
 		echo '<div class="bground_hp animated ';
 		if($i == 1) {
 			echo 'fadeInDown';
 		} else {
 			echo 'fadeInRight';
 		}
 		echo '">';
		echo '<img src="'.BASE_URL.'public/img'.$intro->get('img').'" alt="'.$intro->get('img_alt').'" class="';
 		if($i % 2 == 0) {
 			echo 'hp_left';
 		} else {
 			echo 'hp_right';
 		}
		echo ' in_block_img"/>';
		echo '<h1>'.$intro->get('title').'</h1>';
		echo '<h2>'.$intro->get('subtitle').'</h2>';
		echo '<p>'.$intro->get('content').'</p></div>';
	}
?>