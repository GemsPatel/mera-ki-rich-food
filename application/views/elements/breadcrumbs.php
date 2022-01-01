<section class="page_header">
	<div class="container">
		<div class="col-lg-9 col-sm-9 col-sm-9">
			<h3 class="pull-left" style="width: 75%;">
				<ul>
					<li>
						<a href="<?php echo site_url()?>">
							<b><?php echo getLangMsg("hm");?></b> 
							<i class="fa fa-angle-right"></i>
						</a>
					</li>
					<?php
					$uri = "";
					$cnt = 0;
					foreach ($this->uri->segments as $k=>$ar):
						$cnt++;
						$uri .= $ar."/";
						?>
						<li>
							<a href="<?php echo site_url($uri)?>" title="<?php echo pgTitle($ar) ?>">
								<?php if( sizeof($this->uri->segments) != $cnt ): ?> 
									<b><?php echo pgTitle($ar) ?></b>
									<i class="fa fa-angle-right"></i>
								<?php else: ?>
									<b><?php echo pgTitle( breadcumbLastPartFlush( $ar) );?></b>
									<i class="fa fa-angle-right"></i>
								<?php endif; ?>				
							</a>
						</li>
					<?php endforeach; ?>
				</ul>
			</h3>
		</div>
		<div class="col-lg-3 col-sm-3 col-sm-3">
			<?php if($this->router->method != 'thankyou'): ?>
				<div class="pull-right">
					<a href="javascript:history.back();" ><i class="fa fa-angle-left"></i>&nbsp; <?php echo getLangMsg("back");?></a>
				</div>
			<?php endif; ?>
		</div>
	</div><!-- //CONTAINER -->
</section><!-- //PAGE HEADER -->