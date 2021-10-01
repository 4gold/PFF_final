<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html class="ie ie6 ie-lt10 ie-lt9 ie-lt8 ie-lt7 no-js" lang="en"> <![endif]-->
<!--[if IE 7 ]>    <html class="ie ie7 ie-lt10 ie-lt9 ie-lt8 no-js" lang="en"> <![endif]-->
<!--[if IE 8 ]>    <html class="ie ie8 ie-lt10 ie-lt9 no-js" lang="en"> <![endif]-->
<!--[if IE 9 ]>    <html class="ie ie9 ie-lt10 no-js" lang="en"> <![endif]-->
<!--[if gt IE 9]><!-->
<html class="no-js" lang="en">
    <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <!--[if IE]>
        <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
        <![endif]-->
        <title>Shopping cart</title>
        <meta name="keywords" content="keywords" />
        <meta name="description" content="description" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="assets/images/favicon.ico" />
        <link href="assets/styles/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/pe-icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet" type="text/css" />
        <link href="assets/pe-icon-7-stroke/css/helper.css" rel="stylesheet" type="text/css" />
        <link href="assets/styles/minimal-menu.css" rel="stylesheet" type="text/css" />
        <!--[if LTE IE 8]>
        <link rel="stylesheet" type="text/css" href="assets/styles/minimal-menu-ie.css" />
        <![endif]-->
        <link href="assets/styles/flat-form.css" rel="stylesheet" type="text/css" />
        <link href="assets/styles/fancySelect.css" rel="stylesheet" type="text/css" />
        <link href="assets/styles/jquery.fancybox.css" rel="stylesheet" type="text/css" />
        <link href="assets/styles/allinone_bannerRotator.css" rel="stylesheet" type="text/css" />
        <link href="assets/styles/owl.carousel.css" rel="stylesheet" type="text/css" />
        <link href="assets/styles/owl.theme.default.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/styles/styles.css" rel="stylesheet" type="text/css" />
        <script src="assets/scripts/libs/prefixfree.min.js"></script>
        <script src="assets/scripts/libs/modernizr.js"></script>
        <!--[if lt IE 9]>
        <script src="assets/scripts/libs/html5shiv.js"></script>
        <script src="assets/scripts/libs/respond.js"></script>
        <![endif]-->
        
    </head>
    <body>
        <div class="topbar gray-bg">
            <div class="container">
                <div class="left-topbar">
                    <a href="login-register.html">LOG IN</a> / <a href="login-register.html">REGISTRATION</a>
                </div>
                <!-- /.left-topbar -->
                <div class="right-topbar">
                    <ul class="list-inline">
                        <li>
                            <div class="btn-group">
                                <button class="dropdown dropdown-toggle" data-toggle="dropdown">
                                    <span>My Account</span>
                                    <i class="pe-7s-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a href="wishlist.html"><i class="fa fa-heart"></i> Wish List (0)</a>
                                    </li>
                                    <li>
                                        <a href="shopping-cart.html"><i class="fa fa-shopping-cart"></i> Shopping Cart</a>
                                    </li>
                                    <li>
                                        <a href="check-out.html"><i class="fa fa-share"></i> Checkout</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li>
                            <form action="#">
                                <div class="btn-group">
                                    <button class="dropdown dropdown-toggle" data-toggle="dropdown">
                                        <span>Language:</span>
                                        en
                                        <i class="pe-7s-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#"><img src="assets/images/flags/United-Kingdom.png" alt="English" title="English"/> English</a>
                                        </li>
                                        <li>
                                            <a href="#"><img src="assets/images/flags/France.png" alt="France" title="France"/> France</a>
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </li>
                        <li>
                            <form action="#">
                                <div class="btn-group">
                                    <button class="dropdown dropdown-toggle" data-toggle="dropdown">
                                        <span>Currency:</span>
                                        USD
                                        <i class="pe-7s-angle-down"></i>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li>
                                            <a href="#">€ Euro</a>
                                        </li>
                                        <li>
                                            <a href="#">£ Pound Sterling</a>
                                        </li>
                                        <li>
                                            <a href="#">$ US Dollar</a>
                                        </li>
                                    </ul>
                                </div>
                            </form>
                        </li>
                    </ul>
                </div>
                <!-- /.right-topbar -->
            </div>
        </div>
        <!-- /.topbar -->
        <hr class="gray-line" />
        <header class="gray-bg">
            <div class="container">
                <a class="logo" href="index.html">
                    <img src="assets/images/logo2.svg" alt="img" />
                </a>
                <!-- /.logo -->
                <div class="header-social">
                    <ul class="list-social">
                        <li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" class="instagram"><i class="fa fa-instagram"></i></a></li>
                        <li><a href="#" class="vk"><i class="fa fa-vk"></i></a></li>
                        <li><a href="#" class="behance"><i class="fa fa-behance"></i></a></li>
                    </ul>
                    <!-- /.list-social -->
                </div>
                <!-- /.header-social -->
                <div class="top-cart">
                    <a href="shopping-cart.html">
                        <i class="pe-7s-cart"></i>
                        <span>2</span>
                    </a>
                </div>
                <!-- /.top-cart -->
                <nav class="main-nav">
                    <div class="minimal-menu">
                        <ul class="menu">
                            <li>
                                <a href="index.html">HOME</a>
                            </li>
                            <li>
                                <a href="#">SHOP</a>
                                <ul class="sub-menu">
                                    <li><a href="shop-with-sidebar.html">WITH SIDEBAR</a></li>
                                    <li><a href="shop-fullwidth.html">WITHOUT SIDEBAR</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="portfolio.html">PORTFOLIO</a>
                                <ul class="sub-menu">
                                    <li><a href="portfolio-2-col.html">PORTFOLIO 2 COL</a></li>
                                    <li><a href="portfolio-3-col.html">PORTFOLIO 3 COL</a></li>
                                    <li><a href="portfolio-4-col.html">PORTFOLIO 4 COL</a></li>
                                </ul>
                            </li>
                            <li>
                                <a href="blog.html">BLOG</a>

                            </li>
                            <li class="current-menu-item">
                                <a href="#">PAGES</a>
                                <ul class="sub-menu">
                                    <li><a href="accordions-toggles.html">ACCORDIONS & TOGGLES</a></li>
                                    <li><a href="single-product.html">SINGLE PRODUCT</a></li>
                                    <li><a href="shopping-cart.html">SHOPPING CART</a></li>
                                    <li><a href="check-out.html">CHECKOUT</a></li>
                                    <li><a href="404.html">404</a></li>
                                </ul>
                            </li>
                            <li><a href="contact.html">CONTACT</a></li>
                            <li class="hidden-xs">
                                <div class="wrap-search">
                                    <form action="#" class="search-form">
                                        <input type="text" placeholder="Search.." />
                                        <button type="submit"><i class="pe-7s-search"></i></button>
                                    </form>
                                </div>
                                <!-- /.search-form -->
                            </li>
                        </ul>
                    </div>
                    <!-- /.minimal-menu -->
                </nav>
                <!-- /.main-nav -->
            </div>
        </header>
        <div class="main">
            <div class="container">
                <div class="header-page">
                    <h1>SHOPPING CART</h1>
                </div>
                <!-- /.header-page -->
                <div class="main-content">
                    <form action="#" class="shop-form">
                        <div class="table-responsive">
                            <table class="shop-table table" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="product-remove"></th>
                                        <th class="product-thumbnail"></th>
                                        <th class="product-name">Product</th>
                                        <th class="product-price">Price</th>
                                        <th class="product-quantity">Quantity</th>
                                        <th class="product-subtotal">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="cart_item">
                                        <td class="product-remove"><a href="#" class="remove"><i class="fa fa-times"></i></a></td>
                                        <td class="product-thumbnail">
                                            <a href="single-product.html">
                                                <img class="img-responsive" src="assets/images/small-product-1.jpg" alt="img" />
                                            </a>
                                        </td>
                                        <td class="product-name">
                                            <a href="single-product.html">
                                                COAT WITH WOOL WRAPAROUND COLLAR
                                            </a>
                                        </td>
                                        <td class="product-price"><span class="amount">900USD</span></td>
                                        <td class="product-quantity">
                                            <div class="quantity">
                                                <button class="minus-btn"><i class="fa fa-minus"></i></button>
                                                <input type="text" value="2" />
                                                <button class="plus-btn"><i class="fa fa-plus"></i></button>
                                            </div>
                                        </td>
                                        <td class="product-subtotal"><span class="amount">1800USD</span></td>
                                    </tr>
                                    <tr class="cart_item">
                                        <td class="product-remove"><a href="#" class="remove"><i class="fa fa-times"></i></a></td>
                                        <td class="product-thumbnail">
                                            <a href="single-product.html">
                                                <img class="img-responsive" src="assets/images/small-product-3.jpg" alt="img" />
                                            </a>
                                        </td>
                                        <td class="product-name">
                                            <a href="single-product.html">
                                                COAT WITH WOOL WRAPAROUND COLLAR
                                            </a>
                                        </td>
                                        <td class="product-price"><span class="amount">700USD</span></td>
                                        <td class="product-quantity">
                                            <div class="quantity">
                                                <button class="minus-btn"><i class="fa fa-minus"></i></button>
                                                <input type="text" value="1" />
                                                <button class="plus-btn"><i class="fa fa-plus"></i></button>
                                            </div>
                                        </td>
                                        <td class="product-subtotal"><span class="amount">700USD</span></td>
                                    </tr>
                                    <tr class="cart-action">
                                        <td colspan="3">
                                            <div class="wrap-coupon">
                                                <input class="input-form" type="text" placeholder="ENTER COUPON CODE" />
                                                <button class="apply-coupon-btn">APPLY COUPON</button>
                                            </div>
                                        </td>
                                        <td></td>
                                        <td colspan="2">
                                            <button class="update-cart-btn">UPDATE CART</button>
                                            <button class="checkout-btn">PROCEED TO CHECKOUT</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <!-- /.shop-table -->
                        </div>
                        <!-- /.table-responsive -->
                        <div class="row mgt-70">
                            <div class="col-md-6">
                                <div class="shop-shipping">
                                    <h3>CALCULATE SHIPPING</h3>
                                    <select class="custom-select">
                                        <option value="AF">Afghanistan</option>
                                        <option value="AX">Åland Islands</option>
                                        <option value="AL">Albania</option>
                                        <option value="DZ">Algeria</option>
                                        <option value="AS">American Samoa</option>
                                        <option value="AD">Andorra</option>
                                        <option value="AO">Angola</option>
                                        <option value="AI">Anguilla</option>
                                        <option value="AQ">Antarctica</option>
                                        <option value="AG">Antigua and Barbuda</option>
                                        <option value="AR">Argentina</option>
                                        <option value="AM">Armenia</option>
                                        <option value="AW">Aruba</option>
                                        <option value="AU">Australia</option>
                                        <option value="AT">Austria</option>
                                        <option value="AZ">Azerbaijan</option>
                                        <option value="BS">Bahamas</option>
                                    </select>
                                    <input class="input-form" type="text" placeholder="STATE/COUNTRY" />
                                    <input class="input-form" type="text" placeholder="POSTCODE/ZIP" />
                                    <button class="update-totals-btn">UPDATE TOTALS</button>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="shop-totals">
                                    <h3>CART TOTALS</h3>
                                    <table class="totals-table">
                                        <tr>
                                            <td>Cart Subtotal:</td>
                                            <td><span class="amount">$1000.00</span></td>
                                        </tr>
                                        <tr>
                                            <td>Shipping and Handling:</td>
                                            <td>Free Shipping</td>
                                        </tr>
                                        <tr>
                                            <td>Order Total:</td>
                                            <td><span class="amount">$1000.00</span></td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.main-content -->
            </div>
        </div>
        <!-- /.main -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <h3>ADDRESS INFO</h3>
                        <div class="address">357, WASHINGTON AVE., <br />30523 - NEW YORK (NY)</div>
                        <p>Tel. <a href="tel:+1 917 3452356">+1 (917) 3452356</a></p>
                        <p>Email. <a href="mailto:info@yourdomain.com">info@yourdomain.com</a></p>
                        <ul class="list-social">
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="instagram"><i class="fa fa-instagram"></i></a></li>
                            <li><a href="#" class="vk"><i class="fa fa-vk"></i></a></li>
                            <li><a href="#" class="behance"><i class="fa fa-behance"></i></a></li>
                        </ul>
                        <!-- /.list-social -->
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <h3>HELP</h3>
                        <ul class="list-link">
                            <li><a href="#">HOW TO BUY</a></li>
                            <li><a href="#">GENERAL INFORMATION</a></li>
                            <li><a href="#">PAYMENT</a></li>
                            <li><a href="#">SHIPPING</a></li>
                            <li><a href="#">RETURNS</a></li>
                            <li><a href="#">EXCHANGES</a></li>

                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <h3>POLICIES</h3>
                        <ul class="list-link">
                            <li><a href="#">ENVIRONMENTAL POLICY</a></li>
                            <li><a href="#">ANIMAL WELFARE</a></li>
                            <li><a href="#">PRIVACY POLICY</a></li>
                            <li><a href="#">PURCHASE CONDITIONS</a></li>
                            <li><a href="#">GIFT CARD CONDITIONS</a></li>
                            <li><a href="#">WARRANTY ON WATCHES</a></li>
                        </ul>
                    </div>
                    <div class="col-md-3 col-sm-6">
                        <h3>COMPANY</h3>
                        <ul class="list-link">
                            <li><a href="#">ABOUT US</a></li>
                            <li><a href="#">OFFICES</a></li>
                            <li><a href="#">STORES</a></li>
                            <li><a href="#">WORK WITH US</a></li>
                            <li><a href="#">CONTACT</a></li>
                        </ul>
                    </div>
                </div>
                <div class="bottom-footer">
                    <div class="copyright">
                        ©COPYRIGHT 2021. <a href="https://gridgum.com/">GRIDGUM</a>
                    </div>
                    <!-- /.copyright -->
                    <ul class="list-payment">
                        <li><a href="#"><img src="assets/images/visa.png" alt="img" /></a></li>
                        <li><a href="#"><img src="assets/images/paypal.png" alt="img" /></a></li>
                        <li><a href="#"><img src="assets/images/2co.png" alt="img" /></a></li>
                        <li><a href="#"><img src="assets/images/ae.png" alt="img" /></a></li>
                        <li><a href="#"><img src="assets/images/skrill.png" alt="img" /></a></li>
                    </ul>
                    <!-- /.list-payment -->
                </div>
            </div>
        </footer>
        <script src="assets/scripts/libs/jquery-1.11.2.min.js"></script>
        <script src="assets/scripts/libs/jquery-ui-1.11.4/jquery-ui.min.js"></script>
        <script src="assets/scripts/libs/jquery.easing.1.3.js"></script>
        <script src="assets/scripts/libs/bootstrap.min.js"></script>
        <script src="assets/scripts/libs/fancySelect.js"></script>
        <script src="assets/scripts/libs/jquery.fancybox.pack.js"></script>
        <script src="assets/scripts/libs/jquery.ui.touch-punch.min.js"></script>
        <script src="assets/scripts/libs/jquery.mousewheel.min.js"></script>
        <script src="assets/scripts/libs/allinone_bannerRotator.js"></script>
        <script src="assets/scripts/libs/owl.carousel.min.js"></script>
        <script src="assets/scripts/libs/jquery.countdown.min.js"></script>
        <script src="assets/scripts/functions.js"></script>
    </body>
</html>