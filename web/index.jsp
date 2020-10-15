<%-- 
    Document   : menu
    Created on : 13 oct. 2020, 10:43:04
    Author     : sio2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <title>Accueil</title>
    </head>
    <body>

<%@ include file="menu.html"%>

 

<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="vues/image/accueil1.jpg" class="d-block w-100" alt="Equida">
      <div class="carousel-caption d-none d-md-block">
        <h5>Equida ensemble</h5>
        <p>L'amour du cheval.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="vues/image/accueil2.jpg" class="d-block w-100" alt="Equida">
      <div class="carousel-caption d-none d-md-block">
        <h5>Une histoire de passion</h5>
        <p>Toujours plus forte et vibrante.</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="vues/image/accueil3.jpg" class="d-block w-100" alt="Equida">
      <div class="carousel-caption d-none d-md-block">
        <h5>La femme qui murmure à l'oreille du cheval</h5>
        <p>Une entreprise de diversité, inclusive et humaine.</p>
      </div>
    </div>
         <div class="carousel-item">
      <img src="vues/image/accueil4.jpg" class="d-block w-100" alt="Equida">
      <div class="carousel-caption d-none d-md-block">
        <h5>Vers un monde meilleur</h5>
        <p>Le respect du bien-être animal est notre priorité.</p>
      </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
</html>
