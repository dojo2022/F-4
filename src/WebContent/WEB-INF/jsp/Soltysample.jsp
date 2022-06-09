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
                <div id="hamburger" class="nav_close">
                    <div id="menu">
                        <a href="#">LINK</a>
                        <a href="#">LINK</a>
                        <a href="#">LINK</a>
                        <a href="#">LINK</a>
                        <a href="#">LINK</a>
                    </div>
                    <div>
                        <input id="hamburger-input" type="checkbox" onchange="hamChange(this);" style="display: none;">
                        <label id="hamburger-menu" for="hamburger-input">
                            <div class="hamburger-button" class="hamburger_btn" id="js-hamburger">
                                <span class="hamburger_line hamburger_line_1"></span>
                                <span class="hamburger_line hamburger_line_2"></span>
                                <span class="hamburger_line hamburger_line_3"></span>
                            </div>
                            <div class="black-bg"></div>
                        </label>
                    </div>
                </div>
                <div class="title">
                    <h2>サンプルタイトル</h2>
                </div>
                <div>
                    <a id="logout" href="/Sol_ty/LogoutServlet">ログアウト</a>
                </div>
            </div>
        </nav>
    </header>
    <main>
        <div class="wrapper_main">
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