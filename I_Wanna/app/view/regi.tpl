<div class="bground animated fadeInDown center">
  <div class="regi_wrapper">
    <form action="<?= BASE_URL ?>Register/" method="POST">
    <h1> Sign up </h1> 
    
    <div class="regi"> 
      <label>Username</label>
      <input name="username" type="text" maxlength="30" value="<?= (isset($_SESSION['username'])? $_SESSION['username'] : '') ?>"required/>
    </div>
    
    <div class="regi"> 
      <label>First Name</label>
      <input name="first_name" type="text" maxlength="30" value="<?= (isset($_SESSION['first_name'])? $_SESSION['first_name'] : '') ?>"required/>
    </div>
    
    <div class="regi"> 
      <label>Last Name</label>
      <input name="last_name" type="text" maxlength="30" value="<?= (isset($_SESSION['last_name'])? $_SESSION['last_name'] : '') ?>"required/>
    </div>
    
    <div class="regi"> 
      <label>Email Address</label>
      <input name="email" type="text" maxlength="30" value="<?= (isset($_SESSION['email'])? $_SESSION['email'] : '') ?>"required> 
    </div>
    
    <div class="regi"> 
      <label>Password</label>
      <input name="password" type="password" maxlength="30"required/> 
    </div>
    
    <div class="regi"> 
    	<label>Confirm Password</label>
      <input name="pswd_confirm" type="password" maxlength="30" required/> 
    </div>
    
    <div class="regi"> 
      <button type="submit">Sign Up</button>
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