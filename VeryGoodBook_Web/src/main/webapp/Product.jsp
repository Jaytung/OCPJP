<%@ page pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
            integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
        <link rel="stylesheet" href="app.css">
        <style>
            .cartBtn {
                width: 60px;
            }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(init);
            function init() {
                $("#minus").click(minusHandler);
                $("#plus").click(plusHandler);
            }
            function minusHandler() {
                var quantitiyValue = parseInt($("#quantity").val());
                if (quantitiyValue > 0) {
                    $("#quantity").val(quantitiyValue - 1);
                }
            }
            function plusHandler() {
                var quantitiyValue = parseInt($("#quantity").val());
                $("#quantity").val(quantitiyValue + 1);
            }
        </script>
        <title>產品詳細</title>
    </head>

    <body id="product">
        <jsp:include page="subviews/header.jsp" />
        <div class="container ">
            <div class="row">
                <div class="col-sm-12 col-md-6 col-lg-6 photo rounded">
                    <img src="imgs/XO醬01.png" class="rounded" alt="">
                </div>
                <div class="col-sm-12 col-md-6 col-lg-6">
                    <div class="text-center">
                        <hr>
                        <h2>
                            干貝醬
                        </h2>
                        <hr>
                        <h3>產品敘述:</h3>
                        <p>
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias ad praesentium explicabo
                            dolore aut reprehenderit vero fugiat iure? Earum quasi qui autem odio sapiente adipisci quae
                            sequi. Quasi, dolorem earum.
                        </p>
                        <hr>
                        <h3>價格:</h3>
                        <p>
                            200NT
                        </p>
                        <hr>
                    </div>
                </div>
                <div class="col-6">
                </div>
                <form action="GET" class="col-sm-12 col-md-6 ">
                <input type="hidden" value="1" name="prodcutId">
                    <div class="text-center">
                        <span class="">數量:</span>
                        <div class="input-group justify-content-center">
                            <span class="input-group-addon">
                                <button class="btn btn-primary btn-lg rounded rounded cartBtn" type="button"
                                    id="minus">-
                                </button>
                            </span>
                            <input type="text" class="form-control form-control-lg text-center rounded col-sm-12 col-md-4 col-lg-3" aria-label=""
                                value="0" id="quantity" name="quantity">
                            <span class="input-group-addon">
                                <button class="btn btn-primary btn-lg rounded rounded cartBtn" type="button"
                                    id="plus">+
                                </button>
                            </span>
                        </div><!-- /input-group -->
                    </div><!-- /.col-lg-6 -->
                    <div class="text-center" id="addToCart">
                        <br>
                        <input class="btn btn-primary" type="submit" value="加到購物車">
                    </div>
                </form>
            </div>
        </div>
        <br>
        <br>
        <br>
        <br>
        <br>
        <%@ include file='subviews/footer.jsp' %>

            <!-- Optional JavaScript -->
            <!-- jQuery first, then Popper.js, then Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
                integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
                crossorigin="anonymous"></script>
            <script>
                $(function () {
                    $(document).scroll(
                        function () {
                            var $nav = $("#mainNavbar");
                            $nav.toggleClass("scrolled", $(this).scrollTop() > $nav
                                .height());
                        })
                })
            </script>
    </body>

    </html>