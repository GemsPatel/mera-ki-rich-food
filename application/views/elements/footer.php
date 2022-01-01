<!-- Begin:: footer -->
<footer class="mt-0">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-4">
				<h3 class="mb-0">
					<a class="navbar-brand text-blue fw-bold" href="#">MerakiRichFood</a>
				</h3>

				<div class="footer-info">
					<p class="mb-0">A/F.F. 5B, Akshat Avenue,
                        B/h Courtyard Marriott Hotel,
                        Ramdevnagar Cross Road,
                        Satellite, Ahmedabad - 380015</p>
					<p class="mb-0">Customer Care No : +91 88668 22469</p>
				</div>
			</div>

			<div class="col-lg-3 col-md-4 ps-4 ps-md-4 my-4 my-md-0">
				<h4 class="footer-heading">Quick link</h4>
				<ul class="quick-link">
					<li><a href="<?php echo base_url('products');?>">product</a></li>
					<li><a href="<?php echo base_url('about-us');?>">About Us</a></li>
					<li><a href="<?php echo base_url('shop-now');?>">Shop Now</a></li>
					<li><a href="<?php echo base_url('recipe-blog');?>">Recipes & Blogs</a></li>
					<li><a href="<?php echo base_url('contact-us');?>">contact Us</a></li>
				</ul>
			</div>

			<div class="col-lg-3 col-md-4">
				<form class="footer-form">
					<div class="form-group">
						<input class="form-control" type="text" placeholder="Name " />
					</div>
					<div class="form-group">
						<input class="form-control" type="email" placeholder="Email" />
					</div>
					<div class="form-group">
						<textarea class="form-control" rows="3" placeholder="Comment"></textarea>
					</div>

					<div class="form-group">
						<input class="btn btn-submit" type="submit" class="Submit" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="copyright">
		&copy; <script>document.write(new Date().getFullYear())</script>
		Meraki Rich Food, All right Reserved
	</div>
</footer>
<!-- End:: footer -->

<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
<script src="<?php echo asset_url('js/bootstrap.min.js');?>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" integrity="sha512-F5QTlBqZlvuBEs9LQPqc1iZv2UMxcVXezbHzomzS6Df4MZMClge/8+gXrKw2fl5ysdk4rWjR0vKS7NNkfymaBQ==" crossorigin="anonymous"></script>
<script src="<?php echo asset_url('js/index.js');?>"></script>
<!-- Slick -->
<script src="<?php echo asset_url('js/slick.min.js');?>"></script>
<script>
    $(document).ready(function () {
      $('.product').slick({
        dots: true,
        infinite: true,
        speed: 300,
        autoplay: true,
        autoplaySpeed: 2000,
        slidesToShow: 5,
        slidesToScroll: 5,

        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
        ]
      });
    });
  </script>
</body>
</html>