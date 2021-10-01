<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Google Maps Place api demo - Augustus - Let's Write</title>
    <!-- 載入JQUERY -->
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> -->
    <link rel="canonical" href="https://letswrite.tw/google-map-api-place-api/">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAq4ZyEkl5icm0jlmtTbrJBeuzBmJad-kU&libraries=places"></script>

    
    <style>
      .container {
        padding-top: 30px;
        padding-bottom: 30px;
      }
      #map {
        background: #CCC;
      }
      ul {
        padding-top: 16px;
      }
      .media img {
        max-width: 64px;
      }
      .media h5, p {
        font-size: 14px;
      }
      .mdeia p {
        margin-bottom: 6px;
      }
      .media h6 {
        font-size: 12px;
        color: #CCC;
      }
      .fixed-bottom {
        position: fixed;
        left: 16px;
        bottom: 0;
        max-width: 320px;
      }
    </style>

   
    <!-- Google Tag Manager-->
    <script>
      (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
      'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','GTM-PGQ9WQT');
    </script>
  </head>
  <body>

    <!-- Google Tag Manager (noscript)-->
    <noscript>
      <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PGQ9WQT" height="0" width="0" style="display:none;visibility:hidden"></iframe>
    </noscript>

    <div id="app" class="container">

      <!-- 搜尋框 -->
      <div class="row">
        <div class="col google-map">
          <h5>Search：</h5>
          <div class="form-group">
            <input type="text" class="form-control" ref="site" v-model="site">
          </div>
        </div>
      </div>

      <!-- 放google map的div -->
      <div class="row">
        <div class="col google-map">
            <h5>Google Map：</h5>
          <div id="map" class="embed-responsive embed-responsive-16by9"></div>
        </div>
      </div>

      <hr>
    
    <!-- 將 YOUR_API_KEY 替換成你的 API Key 即可  -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAq4ZyEkl5icm0jlmtTbrJBeuzBmJad-kU&libraries=places"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.10/vue.min.js"></script>

    <!-- map -->
    <script>
      const googleMap = new Vue({
        el: '#app',
        data: {
          map: null,
          autocomplete: null,
          site: '', // place API要綁定的搜尋框
          place: null // 存place確定後回傳的資料
        },
        methods: {
          // init google map
          initMap() {

            let location = {
              lat: 25.0374865,
              lng: 121.5647688
            };

            this.map = new google.maps.Map(document.getElementById('map'), {
              center: location,
              zoom: 16
            });
          },
          // 地址自動完成 + 地圖的中心移到輸入結果的地址上
          siteAuto() {

            let options = {
              componentRestrictions: { country: 'tw' } // 限制在台灣範圍
            };
            this.autocomplete = new google.maps.places.Autocomplete(this.$refs.site, options);
            this.autocomplete.addListener('place_changed', () => {
              this.place = this.autocomplete.getPlace();
              if(this.place.geometry) {
                let searchCenter = this.place.geometry.location;
                this.map.panTo(searchCenter); // panTo是平滑移動、setCenter是直接改變地圖中心
                
                // 放置標記
                let marker = new google.maps.Marker({
                  position: searchCenter,
                  map: this.map
                });

                // info window
                let infowindow = new google.maps.InfoWindow({
                  content: this.place.formatted_address
                });
                infowindow.open(this.map, marker);

              }
            });
          }
        },
        mounted() {
          window.addEventListener('load', () => {

            this.initMap();
            this.siteAuto();

          });
        }
      })
    </script>

  </body>
</html>