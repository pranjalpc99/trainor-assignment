<!doctype html>

	<!--[if !IE]><!-->
	<html lang="$ContentLocale">
	<!--<![endif]-->
	<!--[if IE 6 ]><html lang="$ContentLocale" class="ie ie6"><![endif]-->
	<!--[if IE 7 ]><html lang="$ContentLocale" class="ie ie7"><![endif]-->
	<!--[if IE 8 ]><html lang="$ContentLocale" class="ie ie8"><![endif]-->
	<head>
		<% base_tag %>
		<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		$MetaTags(false)
		<!--[if lt IE 9]>
		<script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

		<link rel="stylesheet" href="themes/bootstrap/css/bundlecss.css">
		
		<% if $FeaturedImage %>
			<meta property="og:image" content="{$BaseHref}{$FeaturedImage.SetWidth(550).FileName}" />
		<% else_if $Image %>
			<meta property="og:image" content="{$BaseHref}{$Image.SetWidth(550).FileName}" />
		<% else_if $Images.exists %>
			<meta property="og:image" content="{$BaseHref}{$Images.first.SetWidth(550).FileName}" />
		<% else_if $Parent.FeaturedImage %>
			<meta property="og:image" content="{$BaseHref}{$Parent.FeaturedImage.SetWidth(550).FileName}" />
		<% else_if $SiteConfig.Logo %>
			<meta property="og:image" content="{$BaseHref}{$SiteConfig.Logo.SetWidth(550).FileName}" />
		<% end_if %>

		<% include Icons %>
		<% include Requirements %>
		<% include Requirements_extra %>
	</head>
	<body <% if $isHomePage %>class="home-page"<% end_if %> <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %>>
		<!-- Navigation Bar -->
		<nav class="navbar">
			<div class="navbar-left">
				<button class="menu-button no-border">
					<img src="assets/images/menu.png" alt="Menu" class="menu-icon">
				</button>
				<button class="login-button no-border">
					<img src="assets/images/login.png" alt="Login" class="login-icon">
					<span class="login-text">Login</span>
				</button>
			</div>
			<div class="navbar-center">
				<img src="assets/images/logoeab.png" alt="EAB Logo" class="logo">
				<span class="logo-text">
					<strong>Entrepreneurs <br> Across <br> Borders</strong>
				</span>
			</div>
			<div class="navbar-right">
				<button class="get-involved-button">Get Involved</button>
				<a href="#" class="contact-link">
					Contact Us <span class="contact-arrow">→</span>
				</a>
			</div>
		</nav>
		<!--<% include Header %>-->

		<div class="main<% if $Level(2) %> sublevel<% end_if %><% if $FeaturedImage || $MapEmbed %> no-pad-top<% end_if %><% if $SiteConfig.TileBackground %> tile-background<% else %> full-background<% end_if %>" role="main"<% if $SiteConfig.Background %> style="background-image: url($SiteConfig.Background.ScaleMaxWidth(1920).URL)"<% end_if %>>
			<%-- Banner to contain featured image, page title, etc --%>
			<% include Banner %>
		
			<%-- 
				Wrap Layout in an include, so the include can be
				overwritten, rather than the core template
			--%>
			<% include Layout Layout=$Layout, Top=$Top, Me=$Me %>
		</div>

		<!--<% include Footer %>-->
		<footer class="site-footer">
			<div class="footer-top">
				<div class="footer-logo">
					<img src="assets/images/logoeab.png" alt="EAB Logo" class="footer-logo-img">
					<div class="footer-social">
						<a href="#" class="social-icon"><img src="assets/images/facebook.png" alt="Facebook"></a>
						<a href="#" class="social-icon"><img src="assets/images/instagram.png" alt="Instagram"></a>
						<a href="#" class="social-icon"><img src="assets/images/linkedin-icon.png" alt="LinkedIn"></a>
					</div>
				</div>
				<div class="footer-links">
					<div class="footer-column">
						<h4>Initiatives</h4>
						<ul>
							<li><a href="#">Partners</a></li>
							<li><a href="#">Entrepreneurs</a></li>
							<li><a href="#">Get Involved</a></li>
							<li><a href="#">Global Impact Network</a></li>
							<li><a href="#">Events</a></li>
						</ul>
					</div>
					<div class="footer-column">
						<h4>About</h4>
						<ul>
							<li><a href="#">Team</a></li>
							<li><a href="#">Contact</a></li>
							<li><a href="#">Careers</a></li>
						</ul>
					</div>
					<div class="footer-column">
						<h4>Insights</h4>
						<ul>
							<li><a href="#">News</a></li>
							<li><a href="#">Blog</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="footer-bottom">
				<p><strong>© Entrepreneurs Across Borders </strong>&nbsp; &nbsp; <a href="#">Privacy Policy</a> &nbsp; | &nbsp; <a href="#">Cookie Policy</a></p>
				<p class="footer-credit">Digital by <strong>TRAINOR</strong></p>
			</div>
		</footer>

	</body>
</html>
