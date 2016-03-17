<div class="animated fadeInDown bground center">
	<h1> Who are you? </h1>
  <h2> Um... You need to tell me who you are before I know who you are, right? </h2>
  <p> You will be redirected in <span id="counter">10</span><span id="second"> seconds</span>.</p>
  <p> Please use the login panel on the upper right corner of the home page. </p>
	
	<script>
		function countdown() {
    	var time = document.getElementById('counter');
    	if (parseInt(time.innerHTML) == 1) {
       	location.href = '<?= BASE_URL ?>';
       	return;
    	}
  		time.innerHTML = parseInt(time.innerHTML) - 1;
  		if (parseInt(time.innerHTML) < 2) {
  			var sec = document.getElementById('second');
  			sec.innerHTML = ' second';
  		}
		}			
		setInterval(function(){ countdown(); }, 1000);
	</script>
</div>