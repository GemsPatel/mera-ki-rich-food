<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<div class="show-top-grids">
		<div class="col-sm-8 single-left">
			<div class="song">
				<div class="song-info">
					<h3>Etiam molestie nisl eget consequat pharetra</h3>	
				</div>
				<div class="video-grid">
					<iframe src="https://www.youtube.com/embed/oYiT-vLjhC4" allowfullscreen></iframe>
				</div>
			</div>
			<div class="song-grid-right">
				<div class="share">
					<h5>Share this</h5>
					<ul>
						<li><a href="#" class="icon fb-icon wd100px">Facebook</a></li>
						<li><a href="#" class="icon dribbble-icon wd100px">Dribbble</a></li>
						<li><a href="#" class="icon twitter-icon wd100px">Twitter</a></li>
						<li><a href="#" class="icon pinterest-icon wd100px">Pinterest</a></li>
						<li><a href="#" class="icon whatsapp-icon wd100px">Whatsapp</a></li>
						<li><a href="#" class="icon like wd100px">Like</a></li>
						<li><a href="#" class="icon comment-icon wd100px">Comments</a></li>
						<li class="view">200 Views</li>
					</ul>
				</div>
			</div>
			<div class="clearfix"> </div>
				<div class="published">
					<script src="jquery.min.js"></script>
					<script>
						$(document).ready(function () {
							size_li = $("#myList li").size();
							x=1;
							$('#myList li:lt('+x+')').show();
							$('#loadMore').click(function () {
								x= (x+1 <= size_li) ? x+1 : size_li;
								$('#myList li:lt('+x+')').show();
							});
							$('#showLess').click(function () {
								x=(x-1<0) ? 1 : x-1;
								$('#myList li').not(':lt('+x+')').hide();
							});
						});
					</script>
					<div class="load_more">	
						<ul id="myList">
							<li>
								<h4>Published on 15 June 2015</h4>
								<p>Nullam fringilla sagittis tortor ut rhoncus. Nam vel ultricies erat, vel sodales leo. Maecenas pellentesque, est suscipit laoreet tincidunt, ipsum tortor vestibulum leo, ac dignissim diam velit id tellus. Morbi luctus velit quis semper egestas. Nam condimentum sem eget ex iaculis bibendum. Nam tortor felis, commodo faucibus sollicitudin ac, luctus a turpis. Donec congue pretium nisl, sed fringilla tellus tempus in.</p>
							</li>
							<li>
								<p>Nullam fringilla sagittis tortor ut rhoncus. Nam vel ultricies erat, vel sodales leo. Maecenas pellentesque, est suscipit laoreet tincidunt, ipsum tortor vestibulum leo, ac dignissim diam velit id tellus. Morbi luctus velit quis semper egestas. Nam condimentum sem eget ex iaculis bibendum. Nam tortor felis, commodo faucibus sollicitudin ac, luctus a turpis. Donec congue pretium nisl, sed fringilla tellus tempus in.</p>
								<p>Nullam fringilla sagittis tortor ut rhoncus. Nam vel ultricies erat, vel sodales leo. Maecenas pellentesque, est suscipit laoreet tincidunt, ipsum tortor vestibulum leo, ac dignissim diam velit id tellus. Morbi luctus velit quis semper egestas. Nam condimentum sem eget ex iaculis bibendum. Nam tortor felis, commodo faucibus sollicitudin ac, luctus a turpis. Donec congue pretium nisl, sed fringilla tellus tempus in.</p>
								<div class="load-grids">
									<div class="load-grid">
										<p>Category</p>
									</div>
									<div class="load-grid">
										<a href="movies.html">Entertainment</a>
									</div>
									<div class="clearfix"> </div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="all-comments">
					<div class="all-comments-info">
						<a href="#">All Comments (8,657)</a>
						<div class="box">
							<form>
								<div class="row">
									<div class="col-sm-12">
										<input type="text" placeholder="Name" required=" ">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-6 mt12">
										<input type="text" placeholder="Email" required=" ">
									</div>
									<div class="col-sm-6 mt12">
										<input type="text" placeholder="Phone" required=" ">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<textarea placeholder="Message" required=" "></textarea>
									</div>
								</div>
								<input type="submit" value="SEND">
								<div class="clearfix"> </div>
							</form>
						</div>
					</div>
					<div class="media-grids">
						<div class="media">
							<h5>Tom Brown</h5>
							<div class="media-left">
								<a href="#"> </a>
							</div>
							<div class="media-body">
								<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
								<span>View all posts by :<a href="#"> Admin </a></span>
							</div>
						</div>
						<div class="media">
							<h5>Mark Johnson</h5>
							<div class="media-left">
								<a href="#">  </a>
							</div>
							<div class="media-body">
								<p>Maecenas ultricies rhoncus tincidunt maecenas imperdiet ipsum id ex pretium hendrerit maecenas imperdiet ipsum id ex pretium hendrerit</p>
								<span>View all posts by :<a href="#"> Admin </a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-4 single-right">
				<h3>Up Next</h3>
				<div class="single-grid-right">
					<div class="single-right-grids">
						<div class="col-md-4 single-right-grid-left">
							<a href="single.html"><img src="images/r1.jpg" alt="" /></a>
						</div>
						<div class="col-md-8 single-right-grid-right">
							<a href="single.html" class="title"> Nullam interdum metus</a>
							<p class="author"><a href="#" class="author">John Maniya</a></p>
							<p class="views">2,114,200 views</p>
						</div>
						<div class="clearfix"> </div>
					</div>
					<div class="single-right-grids">
						<div class="col-md-4 single-right-grid-left">
							<a href="single.html"><img src="images/r2.jpg" alt="" /></a>
						</div>
						<div class="col-md-8 single-right-grid-right">
							<a href="single.html" class="title"> Nullam interdum metus</a>
							<p class="author"><a href="#" class="author">John Maniya</a></p>
							<p class="views">2,114,200 views </p>
						</div>
						<div class="clearfix"> </div>
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<?php $this->load->view('elements/footer-menu');?>
	</div>
	<div class="clearfix"> </div>