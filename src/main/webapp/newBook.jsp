<%@ page import="javaweb.javaweb.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Cadastro de Livro</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Kurale', 'sans-serif'],
                    },
                }
            }
        }
    </script>
</head>
<%
    Object user = session.getAttribute("user");
    boolean isLoggedIn = (user != null);
%>
<body class="bg-gradient-to-r from-sky-400 ">
<header >
    <jsp:include page="components/navBar.jsp" />
<c:choose>
    <c:when test="<%= isLoggedIn %>">
<section class="dark:bg-gray-900 border-b-2 dark:border-gray-600">
    <a href="./home.jsp" title="Home" ><button  class="hidden ml-2 lg:inline-block m-2 py-1.5 px-3  text-center bg-gradient-to-r dark:text-gray-300 from-blue-500 to-purple-500 shadow-lg rounded-md text-white  hover:scale-105 hover:from-purple-500 hover:to-blue-500 transition duration-300 dark:text-gray-300 dark:bg-gray-700 hover:bg-gray-100 ">
        <svg class=" " width="20" height="26" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="#ffffff"><g id="SVGRepo_iconCarrier"><path d="M9 20H7C5.89543 20 5 19.1046 5 18V10.9199C5 10.336 5.25513 9.78132 5.69842 9.40136L10.6984 5.11564C11.4474 4.47366 12.5526 4.47366 13.3016 5.11564L18.3016 9.40136C18.7449 9.78132 19 10.336 19 10.9199V18C19 19.1046 18.1046 20 17 20H15M9 20V14C9 13.4477 9.44772 13 10 13H14C14.5523 13 15 13.4477 15 14V20M9 20H15" stroke="#fff" stroke-linecap="round" stroke-linejoin="round"></path></g></svg>
    </button> </a>
    <div class=" bg-gray-100 border rounded-lg px-8 py-6 mx-auto my-8 max-w-2xl dark:bg-gray-900">
        <div class="text-center mb-8">
            <h1 id="titulopage" class="text-3xl sm:text-4xl leading-normal font-extrabold tracking-tight text-gray-600  dark:text-gray-300">
                Cadastre seu  <span class="text-indigo-600">Livro</span>
            </h1>
        </div>
    <form action="cadastrar" method="post" enctype="multipart/form-data">
        <div class="mb-4">
        <label for="isbn" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">ISBN:</label>
        <input type="text" id="isbn" name="isbn" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg -base focus:scale-105 ease-in-out duration-300 block w-full p-2.5 dark:border-gray-700 " required/>
        </div>
        <div class="mb-4">
        <label for="titulo" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">Título:</label>
        <input type="text" id="titulo" name="titulo" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg -base focus:scale-105 ease-in-out duration-300 block w-full p-2.5 dark:border-gray-700 " required/>
        </div>
        <div class="mb-4">
        <label for="categoria" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">Categoria:</label>
        <select type="text" id="categoria" name="categoria"  class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg -base focus:scale-105 ease-in-out duration-300 block w-full p-2.5 dark:border-gray-700"  require>
            <option value="">Selecione a categoria correspondente</option>
            <option value="Literatura Brasileira">Literatura Brasileira</option>
            <option value="Romance">Romance</option>
            <option value="Ficção">Ficção</option>
            <option value="Infantojuvenil">Infantojuvenil</option>
            <option value="Fantasia">Fantasia</option>
            <option value="Terror">Terror</option>
            <option value="Suspense">Suspense</option>
            <option value="Tecnologia">Tecnologia</option>

        </select>
        </select>
        </div>
        <div class="mb-4">
        <label for="quantidade" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">Quantidade:</label>
        <input type="number" id="quantidade" name="quantidade" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg -base focus:scale-105 ease-in-out duration-300 block w-full p-2.5  dark:border-gray-700" value="1" min="1" required/>
        </div>
        <div class="mb-4">
            <label for="imagem" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">Imagem:</label>
            <input type="file" id="imagem" name="imagem" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg -base focus:scale-105 ease-in-out duration-300 block w-full p-2.5 dark:border-gray-700"/>
        </div>
        <div class="p-6 border-t border-gray-200 rounded-b">

            <button
                    class="bg-gradient-to-r dark:text-gray-300 from-blue-500 to-purple-500 shadow-lg mt-6 p-2 text-white rounded-lg w-full hover:scale-105 hover:from-purple-500 hover:to-blue-500 transition duration-300 ease-in-out"
                    type="submit"
            >
                Adicionar
            </button>
        </div>


    </form>
    </div>
</section>
        </c:when>
        <c:otherwise>
        <section class="dark:bg-gray-900 border-b-2 dark:border-gray-600">
            <div class="container mx-auto text-center py-20">
                <h1 class="text-4xl mb-4 text-gray-600 dark:text-gray-300">Acesso Negado</h1>
                <p class="text-xl text-gray-500 dark:text-gray-300">Você não tem permissão para acessar esta página.</p>
                <a href="login.jsp" class="mt-6 inline-block bg-gradient-to-r from-blue-500 to-purple-500 text-white font-bold py-2 px-4 rounded hover:scale-105 transition duration-300 ease-in-out">Voltar para o Login</a>
            </div>

        </section>
        </c:otherwise>
        </c:choose>

        <jsp:include page="components/footer.jsp" />
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
