<%--
  Created by IntelliJ IDEA.
  User: nessa
  Date: 22/07/2024
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="PT-BR">
<head>
    <title>footer</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {

                }
            }
        }
    </script>
</head>
<body>
<footer class="w-full py-8 dark:bg-gray-900">
    <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="max-w-3xl mx-auto">
            <a href="#" class="flex justify-center ">
                <img src="./images/logonav.png">
            </a>
            <ul class="text-lg flex items-center justify-center flex-col gap-7 md:flex-row md:gap-12 transition-all duration-500 py-8 mb-5 border-b border-gray-200 ">
                <li><a href="#" class="text-gray-600 hover:text-gray-900 dark:text-gray-300">Home</a></li>
                <li><a href="./listarLivros.jsp" class=" text-gray-600 hover:text-gray-900 dark:text-gray-300">Coleção de Livros</a></li>
                <li><a href="./cadastroUsuario.jsp" class=" text-gray-600 hover:text-gray-900 dark:text-gray-300">Cadastre-se</a></li>
                <li><a href="./userLogin.jsp" class=" text-gray-600 hover:text-gray-900 dark:text-gray-300">Login</a></li>
                <li><a href="./termos.jsp" class=" text-gray-600 hover:text-gray-900 dark:text-gray-300">Termos e Privacidade</a></li>
            </ul>

            <span class="text-lg text-gray-500 text-center block dark:text-gray-300">© VaNanda - Todos os direitos reservados.</span>
        </div>
    </div>
</footer>
<script>
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
        document.documentElement.classList.add('dark');
    } else {
        document.documentElement.classList.remove('dark');
    }


    var themeToggleDarkIcon = document.getElementById('theme-toggle-dark-icon');
    var themeToggleLightIcon = document.getElementById('theme-toggle-light-icon');

    var themeToggleDarkIcon_2 = document.getElementById('theme-toggle-dark-icon-2');
    var themeToggleLightIcon_2 = document.getElementById('theme-toggle-light-icon-2');

    // Change the icons inside the button based on previous settings
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia(
        '(prefers-color-scheme: dark)').matches)) {
        themeToggleLightIcon.classList.remove('hidden');
        if (themeToggleDarkIcon_2) {
            themeToggleLightIcon_2.classList.remove('hidden');
        }
    } else {
        themeToggleDarkIcon.classList.remove('hidden');
        if (themeToggleDarkIcon_2) {
            themeToggleDarkIcon_2.classList.remove('hidden');
        }
    }


    var themeToggleBtn_2 = document.getElementById('theme-toggle-2');
    if (themeToggleBtn_2) {

        themeToggleBtn_2.addEventListener('click', function () {

            // toggle icons inside button
            themeToggleDarkIcon_2.classList.toggle('hidden');
            themeToggleLightIcon_2.classList.toggle('hidden');

            sync_theme()

        });
    }


    var themeToggleBtn = document.getElementById('theme-toggle');

    themeToggleBtn.addEventListener('click', function () {

        // toggle icons inside button
        themeToggleDarkIcon.classList.toggle('hidden');
        themeToggleLightIcon.classList.toggle('hidden');

        sync_theme()


    });


    function sync_theme() {
        // if set via local storage previously
        if (localStorage.getItem('color-theme')) {
            if (localStorage.getItem('color-theme') === 'light') {
                document.documentElement.classList.add('dark');
                localStorage.setItem('color-theme', 'dark');
            } else {
                document.documentElement.classList.remove('dark');
                localStorage.setItem('color-theme', 'light');
            }
            // if NOT set via local storage previously
        } else {
            if (document.documentElement.classList.contains('dark')) {
                document.documentElement.classList.remove('dark');
                localStorage.setItem('color-theme', 'light');
            } else {
                document.documentElement.classList.add('dark');
                localStorage.setItem('color-theme', 'dark');
            }
        }

    }



    document.addEventListener('DOMContentLoaded', function () {
        // open
        const burger = document.querySelectorAll('.navbar-burger');
        const menu = document.querySelectorAll('.navbar-menu');

        if (burger.length && menu.length) {
            for (var i = 0; i < burger.length; i++) {
                burger[i].addEventListener('click', function () {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }

        // close
        const close = document.querySelectorAll('.navbar-close');
        const backdrop = document.querySelectorAll('.navbar-backdrop');

        if (close.length) {
            for (var i = 0; i < close.length; i++) {
                close[i].addEventListener('click', function () {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }


        if (backdrop.length) {
            for (var i = 0; i < backdrop.length; i++) {
                backdrop[i].addEventListener('click', function () {
                    for (var j = 0; j < menu.length; j++) {
                        menu[j].classList.toggle('hidden');
                    }
                });
            }
        }
    });
</script>
</body>
</html>
