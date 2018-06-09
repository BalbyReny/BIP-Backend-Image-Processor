<%--
    Document: [BIP!] --- Backend Image Processor (index)
    Created on: 05/06/2018, 09:37:02 PM
    Author: Renata (@BalbyReny)
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BIP!</title>
        <script language = "javascript" type="text/javascript">

            function requestToFilter() {
                var fileInput = document.getElementById("fileInput");

                if (fileInput.files.length === 0) {
                    alert("Please, choose a file!");
                    return;
                }

                var progressBar = document.getElementById("progressBar");
                
                var ajax = new XMLHttpRequest();     //for Original Image
                var ajax2 = new XMLHttpRequest();    //for Negative
                var ajax3 = new XMLHttpRequest();    //for Blur
                var ajax4 = new XMLHttpRequest();    //for Sharpen
                var ajax5 = new XMLHttpRequest();    //for Black and White
                var ajax6 = new XMLHttpRequest();    //for Sepia

                ajax.responseType = "blob";
                ajax2.responseType = "blob";
                ajax3.responseType = "blob";
                ajax4.responseType = "blob";
                ajax5.responseType = "blob";
                ajax6.responseType = "blob";
                
                //Progress Bar increment
                ajax.upload.onprogress = function(e) {
                    var percent = (e.loaded / e.total) * 100;
                    progressBar.value = percent;
                };

                ajax.onload = function() {
                    if (ajax.status === 200) {
                        var urlCreator = window.URL || window.webkitURL;
                        var base64Image = urlCreator.createObjectURL(ajax.response);

                        var img = document.createElement("IMG");
                        img.style.margin = "auto";
                        img.style.padding = "0";
                        img.style.width = "100%";
                        img.src = base64Image;

                        progressBar.value = 0;

                        var originalContainer = document.getElementById("originalContainer");
                        originalContainer.appendChild(img);
                    } else {
                        console.log("Error :(");
                    }
                };

                ajax2.onload = function() {
                    if (ajax2.status === 200) {
                        var urlCreator = window.URL || window.webkitURL;
                        var base64Image = urlCreator.createObjectURL(ajax2.response);

                        var img = document.createElement("IMG");
                        img.style.margin = "auto";
                        img.style.padding = "0";
                        img.style.width = "100%";
                        img.src = base64Image;

                        var negativeContainer = document.getElementById("negativeContainer");
                        negativeContainer.appendChild(img);
                    } else {
                        console.log("Error :(");
                    }
                };

                ajax3.onload = function() {
                    if (ajax3.status === 200) {
                        var urlCreator = window.URL || window.webkitURL;
                        var base64Image = urlCreator.createObjectURL(ajax3.response);

                        var img = document.createElement("IMG");
                        img.style.margin = "auto";
                        img.style.padding = "0";
                        img.style.width = "100%";
                        img.src = base64Image;

                        var blurContainer = document.getElementById("blurContainer");
                        blurContainer.appendChild(img);
                    } else {
                        console.log("Error :(");
                    }
                };

                ajax4.onload = function() {
                    if (ajax4.status === 200) {
                        var urlCreator = window.URL || window.webkitURL;
                        var base64Image = urlCreator.createObjectURL(ajax4.response);

                        var img = document.createElement("IMG");
                        img.style.margin = "auto";
                        img.style.padding = "0";
                        img.style.width = "100%";
                        img.src = base64Image;

                        var sharpContainer = document.getElementById("sharpenContainer");
                        sharpContainer.appendChild(img);
                    } else {
                        console.log("Error :(");
                    }
                };

                ajax5.onload = function() {
                    if (ajax5.status === 200) {
                        var urlCreator = window.URL || window.webkitURL;
                        var base64Image = urlCreator.createObjectURL(ajax5.response);

                        var img = document.createElement("IMG");
                        img.style.margin = "auto";
                        img.style.padding = "0";
                        img.style.width = "100%";
                        img.src = base64Image;

                        var bnwContainer = document.getElementById("bnwContainer");
                        bnwContainer.appendChild(img);
                    } else {
                        console.log("Error :(");
                    }
                };

                ajax6.onload = function() {
                    if (ajax6.status === 200) {
                        var urlCreator = window.URL || window.webkitURL;
                        var base64Image = urlCreator.createObjectURL(ajax6.response);

                        var img = document.createElement("IMG");
                        img.style.margin = "auto";
                        img.style.padding = "0";
                        img.style.width = "100%";
                        img.src = base64Image;

                        var sepiaContainer = document.getElementById("sepiaContainer");
                        sepiaContainer.appendChild(img);
                    } else {
                        console.log("Error :(");
                    }
                };


                ajax.onerror = function() {
                    console.log("Error connecting to backend... :(");
                };

                ajax2.onerror = function() {
                    console.log("Error connecting to backend... :(");
                };

                ajax3.onerror = function() {
                    console.log("Error connecting to backend... :(");
                };

                ajax4.onerror = function() {
                    console.log("Error connecting to backend... :(");
                };

                ajax5.onerror = function() {
                    console.log("Error connecting to backend... :(");
                };

                ajax6.onerror = function() {
                    console.log("Error connecting to backend... :(");
                };

                progressBar.value = 0;

                ajax.open("POST", "UploadToSeeTheMagic", true);
                ajax.setRequestHeader("Content-Type", fileInput.files[0].type);
                ajax.send(fileInput.files[0]);

                ajax2.open("POST", "UploadToSeeTheNegativeMagic", true);
                ajax2.setRequestHeader("Content-Type", fileInput.files[0].type);
                ajax2.send(fileInput.files[0]);

                ajax3.open("POST", "UploadToSeeTheBlurMagic", true);
                ajax3.setRequestHeader("Content-Type", fileInput.files[0].type);
                ajax3.send(fileInput.files[0]);

                ajax4.open("POST", "UploadToSeeTheSharpenMagic", true);
                ajax4.setRequestHeader("Content-Type", fileInput.files[0].type);
                ajax4.send(fileInput.files[0]);

                ajax5.open("POST", "UploadToSeeTheBlackAndWhiteMagic", true);
                ajax5.setRequestHeader("Content-Type", fileInput.files[0].type);
                ajax5.send(fileInput.files[0]);

                ajax6.open("POST", "UploadToSeeTheSepiaMagic", true);
                ajax6.setRequestHeader("Content-Type", fileInput.files[0].type);
                ajax6.send(fileInput.files[0]);
            };
        </script>

        <link href="https://fonts.googleapis.com/css?family=Carter+One" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
        <link rel="stylesheet" href="style/BIPfrontdecoration.css">
        <link rel="shortcut icon" href="files/Preview-icon.png">
    </head>

    <body>
        <header>
            <img src="files/Preview-icon.png" alt="BIP-icon">
            <h1>BIP!</h1>
            <h2>Backend Image Processor</h2>
        </header>

        <div class="toggle-info">
            <button class="accordion">A brief description</button>
            <div class="panel">
                <p>We're glad to introduce you to <strong>BIP!</strong> This is a small Web application that allows you to load any image file you want (supported file extensions: <strong>JPG/PNG</strong>), and automatically apply a selection of various popular favorites filters on it, at this very moment, without redirecting or changing page. (Yes, it is possible.)<br><strong>Negative</strong>, <strong>Blurred</strong>, <strong>Sharpened</strong>, <strong>Black'n'White</strong> and yes, <strong>Sepia</strong> versions of your preferred image, instantly, all of them.</p>
            </div>

            <button class="accordion">It's so simple, you will love it</button>
            <div class="panel">
                <p>Feel free to scroll down this page. When you're ready, all you have to do is to click the <strong>selection button</strong> on the <strong>Upload</strong> panel, choose the image file you want to play with, and click on the <strong>upload button</strong> to do the trick.<br>Don't forget to save and share the best versions of your image that you liked most.<br><strong>#BIPmyPic!</strong></p>
            </div>

            <button class="accordion">About this project</button>
            <div class="panel">
                <p>The humble authors of this thing (aw, thank you <3)<br><a href="https://github.com/LuisBar05" target="_blank">@LuisBar05</a>, <a href="https://github.com/BalbyReny" target="_blank">@BalbyReny</a>, and <a href="https://github.com/JustAGentleman" target="_blank">@JustAGentleman</a>.</p>
                <p>After thousands and thousands of page refreshes, <del>copying and pasting code</del> typing and backspacing, experimenting, and a bunch of images filtered, it was a good one.</p>
                <p>If you are curious and want to look behind this page, <a href="https://github.com/BalbyReny/BIP-Backend-Image-Processor" target="_blank">see our repo on GitHub</a>.</p>
            </div>
        </div>

        <script><!-- What a nice toggler -->
            var acc = document.getElementsByClassName("accordion");
            var i;

            for (i = 0; i < acc.length; i++) {
                acc[i].addEventListener("click", function() {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.display === "block") {
                        panel.style.display = "none";
                    } else {
                        panel.style.display = "block";
                    }
                });
            }
        </script>

        <!-- Upload the image file to get it applied with 5 different filters -->
        <div class="pic-upload">
            <h3>Upload your image here</h3>
            <form>
                <input type = "file" id = "fileInput" accept =".jpeg,.jpg,.png"/>
                <button id="uploadButton" onclick = "requestToFilter();" type="button">Upload to make awesome images!</button>
                <progress id = "progressBar" max = "100" value = "0"></progress>
            </form><br>
            <button id="resetButton" onclick="reset();">Try another image?</button>
        </div>

        <!-- Containers for showing the original, and the filtered images -->
        <div class="filtername">
            <p>[Original Image]</p>
        </div>
        <div class="pic-container" id = "originalContainer"></div>
        <div class="filtername">
            <p>-Negative</p>
        </div>
        <div class="pic-container" id = "negativeContainer"></div>

        <div class="filtername">
            <p>~Blur</p>
        </div>
        <div class="pic-container" id = "blurContainer"></div>

        <div class="filtername">
            <p>^Sharpen</p>
        </div>
        <div class="pic-container" id = "sharpenContainer"></div>

        <div class="filtername">
            <p>#BnW (Black & White)</p>
        </div>
        <div class="pic-container" id = "bnwContainer"></div>

        <div class="filtername">
            <p>&Sepia</p>
        </div>
        <div class="pic-container" id="sepiaContainer"></div>

        <script><!-- Refreshing without refreshing the page? WOW -->
            function reset() {
                var picc = document.getElementsByClassName("pic-container");
                var i;

                for (i = 0; i < picc.length; i++) {
                    picc[i].innerHTML = "";
                }
            };
        </script>
    </body>
</html>