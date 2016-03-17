<div class="animated fadeInDown bground center">
		<div class="regi_wrapper">
		<form action="<?= BASE_URL ?>Comment/" method="POST">
      <h1> What do you want to say to us? </h1>
      <div class="regi">
    		<label class="login">Your Name</label>
    	</div>
      
      <div class="regi">
    		<input class="login" name="name" type="text" maxlength="30" value="<?= isset($_SESSION['name'])? $_SESSION['name'] : ''?>"/>
    	</div>
      
    	<div class="regi">
    		<label class="login">Subject</label>
    	</div>
        
      <div class="regi">
       	<input class="login" name="subject" type="text" value="<?= isset($_SESSION['subject'])? $_SESSION['subject'] : ''?>"/> 
    	</div>
      
    	<div class="regi">
    		<label class="login">Content</label>
    	</div>
        
      <div class="regi">
       	<textarea class="login" name="content" type="text" value="<?= isset($_SESSION['content'])? $_SESSION['content'] : ''?>"></textarea>
    	</div>
			<script>  
				var wid = $('input').width();
				$('textarea').css({'width': wid +'px'});
				$('textarea').css({'height': wid * 0.3 +'px'});
			</script>
        
    	<div class="regi">
      	<button type="submit">Submit</button>
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

<?php
	$comments = ContactUs::getAllCommentsOfAuthor($_SESSION['user']->getId());
	if($comments != null) {	
	echo '<div class="animated fadeInUp bground center" id="comment"><h1> Comments you already submitted </h1>';
	foreach($comments as $comment) {
		echo '<div class="regi"><h2># ';
		echo $comment->get('subject');
		echo ' # submitted on ';
		echo $comment->get('time');
		echo '</h2> <p> >>> ';
		echo $comment->get('content');
		echo '</p><form action="';
		echo BASE_URL.'Delete/?id=';
		echo $comment->getId();
		echo '" method="POST"><button type="submit">Delete</button></form></div>';	
	}
	echo '</div>';
}
?>