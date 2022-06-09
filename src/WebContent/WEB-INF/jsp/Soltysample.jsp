<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sol-ty | サンプル</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>

<body>
    <header>
        <nav>
            <div id="header">
                <div id="hamburger" class="navClose">
                    <div id="menu">
                        <a href="#">LINK</a>
                        <a href="#">LINK</a>
                        <a href="#">LINK</a>
                        <a href="#">LINK</a>
                        <a href="#">LINK</a>
                    </div>
                    <div>
                        <input id="hamburgerInput" type="checkbox" onchange="hamChange(this);" style="display: none;">
                        <label id="hamburgerMenu" for="hamburger-input">
                            <div class="hamburger-button" class="hamburger_btn" id="js-hamburger">
                                <span class="hamburgerLine hamburgerLine1"></span>
                                <span class="hamburgerLine hamburgerLine2"></span>
                                <span class="hamburgerLine hamburgerLine3"></span>
                            </div>
                            <div class="blackBg"></div>
                        </label>
                    </div>
                </div>
                <div id="title">
                    <h2>サンプルタイトル</h2>
                </div>
                <div>
                    <a id="logout" href="/Sol_ty/LogoutServlet">ログアウト</a>
                </div>
            </div>
        </nav>
    </header>
    <main>
        <div class="wrapper">
        </div>
    </main>
    <footer>
        2022 &copy;Sol-ty
    </footer>
    <script>
        function hamChange(me) {
            const ham = document.getElementById("hamburger");
            if (me.checked === true) {
                ham.classList.remove('nav_close');
                ham.classList.add('nav_open');
            }
            else {
                ham.classList.remove('nav_open');
                ham.classList.add('nav_close');
            }
        }
    </script>
</body>

</html>