<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

 <!--footer-->
<style>


footer {
position: relative!important;
z-index:1;
	}
</style>
    <footer >
          <div class="container-fluid text-body footer mt-5 pt-5 wow fadeIn bg-secondary p-2 text-dark bg-opacity-10" data-wow-delay="0.1s">
        <div class="container py-5" style="color:#9b9b9b;">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h5 class="mb-4 footer-second" >Address</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>서울 영등포구 선유동2로 57 이레빌딩</p>
                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>github.com/BeefJerky1/final</p>
                    <div class="d-flex pt-2">
                        <a class="btn btn-square btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-square btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-square btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                        <a class="btn btn-square btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="mb-4 footer-second">Quick Links</h5>
                    <a class="btn btn-link" href="">About Us</a>
                    <a class="btn btn-link" href="">Contact Us</a>
                    <a class="btn btn-link" href="">Our Services</a>
                    <a class="btn btn-link" href="">Terms & Condition</a>
                    <a class="btn btn-link" href="">Support</a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class=" mb-4 footer-second">Project Gallery</h5>
                    <div class="row g-2">
                        <div class="col-4">
                            <img class="img-fluid rounded" src="${root}/image/LOGO.png" alt="">
                        </div>
                        <div class="col-4">
                            <img class="img-fluid rounded" src="${root}/image/GROUP.png" alt="">
                        </div>
                       
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h5 class="mb-4 footer-second" >Newsletter</h5>
                    <p>SISO의 새로운 소식을 받아보세요!</p>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                        <input class="form-control border-0 w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                        <button type="button" class="btn btn-outline-success py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="copyright">
                <div class="row">
                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0" style="color:#f7d68a;">
                        &copy; SISO, All Right Reserved.
                    </div>
                    <div class="col-md-6 text-center text-md-end"  style="color:#9b9b9b;">
                        Designed By leeyuna
                    </div>
                </div>
            </div>
        </div>
    </div>


    </footer>
      
   <a href="#" class="btn btn-lg btn-lg-square rounded-circle back-to-top"><i class="fa-solid fa-up-long"></i></a>

	</body>
</html>