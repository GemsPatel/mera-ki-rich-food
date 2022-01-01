<section class="my_account parallax">
	<div class="container">
		<link rel="stylesheet" href="<?php echo asset_url('assets/css/style.css');?>">
		<link rel="stylesheet" href="<?php echo asset_url('assets/css/form-elements.css');?>">
		<div class="col-sm-6">
			<div class="form-box">
				<div class="form-top">
					<div class="form-top-left">
						<h3>Login to our site</h3>
						<p style="font-size: 13px;">Enter username and password to log on:</p>
					</div>
					<div class="form-top-right">
						<i class="fa fa-key"></i>
					</div>
				</div>
				<div class="form-bottom">
					<form role="form" onsubmit="return false;" method="get" id="login-form" class="login-form">
						<div class="form-group">
							<label class="sr-only" for="login_email">Username</label>
							<input type="text" name="login_email" placeholder="Username..." class="form-username form-control" id="form-username">
							<div for="login_email" class="input-notification error" id="login-error-msg"></div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="login_password">Password</label>
							<input type="password" name="login_password" placeholder="Password..." class="form-password form-control" id="form-password">
							<div for="login_password" class="input-notification error" id="login-error"></div>
							<div for="login_not_match" class="input-notification error" id="login-error"></div>
						</div>
						<div class="clearfix">
							<div class="pull-left"></div>
							<div class="pull-right"><a class="forgot_pass cursor" data-toggle="modal" data-target="#CloudwebsModal"><?php echo getLangMsg("fyp");?></a></div>
						</div>
						<div class="mt5"></div>
						<button type="submit" class="button btn" title="Login" name="sign_in" id="login">Sign in!</button>
						<span id="login_loading_img" class="hide">
							<img class="login_priloaded" src="<?php echo asset_url('images/preloader-white.gif') ?>" alt="loader" />
						</span>
					</form>
				</div>
			</div>
			<div class="social-login" style="text-align: center;">
				<h3>...or login with:</h3>
				<div class="social-login-buttons">
					<a class="btn btn-link-1 btn-link-1-facebook" href="javascript:void(0)" onclick="facebook_login()" >
						<i class="fa fa-facebook"></i> Facebook
					</a>
					<a class="btn btn-link-1 btn-link-1-twitter hide" href="#">
						<i class="fa fa-twitter"></i> Twitter
					</a>
					<a class="btn btn-link-1 btn-link-1-google-plus" href="#">
						<i class="fa fa-google-plus"></i> Google Plus
					</a>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="form-box">
				<div class="form-top">
					<div class="form-top-left">
						<h3>Sign up now</h3>
						<p style="font-size: 13px;">Fill in the form below to get instant access:</p>
					</div>
					<div class="form-top-right">
						<i class="fa fa-pencil"></i>
					</div>
				</div>
				<div class="form-bottom">
					<form onsubmit="return false;" method="get" id="form-validate-register" class="registration-form">
						<div class="form-group">
							<label class="sr-only" for="customer_firstname">First name</label>
							<input type="text" name="customer_firstname" placeholder="First name..." class="form-first-name form-control" id="form-first-name">
							<div for="customer_firstname" class="input-notification error" id="login-error"></div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="customer_lastname">Last name</label>
							<input type="text" name="customer_lastname" placeholder="Last name..." class="form-last-name form-control" id="form-last-name">
							<div for="customer_lastname" class="input-notification error" id="login-error"></div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="customer_emailid">Email</label>
							<input type="text" name="customer_emailid" placeholder="Email..." class="form-email form-control" id="form-email">
							<div for="customer_emailid" class="input-notification error" id="login-error"></div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="customer_phoneno">Phone Number</label>
							<input type="text" name="customer_phoneno" placeholder="Phone ..." class="form-email form-control" id="form-phone">
							<div for="customer_phoneno" class="input-notification error" id="login-error"></div>
						</div>
						<div class="form-group">
							<label class="sr-only" for="customer_password">Password</label>
							<input type="password" name="customer_password" placeholder="Password ..." class="form-email form-control" id="form-password-su">
							<div for="customer_password" class="input-notification error" id="login-error"></div>
						</div>
						<div class="clearfix">
							<input type="checkbox" id="reg1" name="agree"><label for="reg1">Term & Condition</label>
							<div for="agree" class="input-notification error" id="login-error"></div>
						</div>
						<button id="signup" type="submit" title="Submit" class="btn" name="create_account">Sign me up!</button>
						<span id="signup_loading_img" class="hide">
							<img src="<?php echo asset_url('images/preloader-white.gif') ?>" alt="loader" style="padding:5px;" />
                        </span>
					</form>
				</div>
			</div>
		</div>
	</div><!-- //CONTAINER -->
</section>
<?php $this->load->view('elements/forgot-password')?>
<?php $this->load->view('elements/login_fb'); ?>