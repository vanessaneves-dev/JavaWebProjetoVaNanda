<%@ page import="javaweb.javaweb.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Central Biblioteca | Editar Livro</title>
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
<body class="bg-gradient-to-r from-sky-400">
<header id="header">
    <jsp:include page="components/navBar.jsp" />
</header>

<c:choose>
    <c:when test="<%= isLoggedIn %>">
<section class="dark:bg-gray-900 border-b-2 dark:border-gray-600">
    <a href="./home.jsp"  ><button  class="hidden ml-2 lg:inline-block m-2 py-1.5 px-3  text-center bg-gradient-to-r dark:text-gray-300 from-blue-500 to-purple-500 shadow-lg rounded-md text-white  hover:scale-105 hover:from-purple-500 hover:to-blue-500 transition duration-300 dark:text-gray-300 dark:bg-gray-700 hover:bg-gray-100 ">
        <svg class=" " width="20" height="26" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="#ffffff"><g id="SVGRepo_iconCarrier"><path d="M9 20H7C5.89543 20 5 19.1046 5 18V10.9199C5 10.336 5.25513 9.78132 5.69842 9.40136L10.6984 5.11564C11.4474 4.47366 12.5526 4.47366 13.3016 5.11564L18.3016 9.40136C18.7449 9.78132 19 10.336 19 10.9199V18C19 19.1046 18.1046 20 17 20H15M9 20V14C9 13.4477 9.44772 13 10 13H14C14.5523 13 15 13.4477 15 14V20M9 20H15" stroke="#fff" stroke-linecap="round" stroke-linejoin="round"></path></g></svg>
    </button> </a>
    <div class=" bg-gray-100 border rounded-lg px-8 py-6 mx-auto my-8 max-w-2xl dark:bg-gray-900">
        <div class="text-center mb-8">
            <h1 id="titulopage" class="text-3xl sm:text-4xl leading-normal font-extrabold tracking-tight text-gray-600 dark:text-gray-300">
                Editar <span class="text-indigo-600">Livro</span>
            </h1>
        </div>
        <%
            Book livro = (Book) request.getAttribute("livro");
            if (livro != null) {
        %>
        <form action="editBook" method="post" enctype="multipart/form-data" >
            <input type="hidden" name="isbn" value="<%= livro.getIsbn() %>"/>
            <div class="mb-4">
                <label for="titulo" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">Título:</label>
                <input type="text" id="titulo" name="titulo" value="<%= livro.getTitulo() %>" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg base focus:scale-105 ease-in-out duration-300 block w-full p-2.5  dark:border-gray-700" required/>
            </div>
            <div class="mb-4">
                <label for="categoria" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">Categoria:</label>
                <select id="categoria" name="categoria" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg base focus:scale-105 ease-in-out duration-300 block w-full p-2.5  dark:border-gray-700" required>
                    <option value="">Selecione a categoria correspondente</option>
                    <option value="Ficção" <%= "Ficção".equals(livro.getCategoria()) ? "selected" : "" %>>Ficção</option>
                    <option value="Romance" <%= "Romance".equals(livro.getCategoria()) ? "selected" : "" %>>Romance</option>
                    <option value="Tecnologia" <%= "Tecnologia".equals(livro.getCategoria()) ? "selected" : "" %>>Tecnologia</option>
                </select>
            </div>
            <div class="mb-4">
                <label for="quantidade" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">Quantidade:</label>
                <input type="number" id="quantidade" name="quantidade" value="<%= livro.getQuantidade() %>" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg base focus:scale-105 ease-in-out duration-300 block w-full p-2.5  dark:border-gray-700" required/>
            </div>
            <div class="mb-4">
                <label for="imagem" class="block text-gray-700 font-medium mb-2 dark:text-gray-400">Imagem:</label>
                <input type="file" id="imagem" name="imagem" class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 sm:text-sm rounded-lg base focus:scale-105 ease-in-out duration-300 block w-full p-2.5 dark:border-gray-700"/>

            </div>
            <div class="p-6 border-t border-gray-200 rounded-b">
                <button class="bg-gradient-to-r dark:text-gray-300 from-blue-500 to-purple-500 shadow-lg mt-6 p-2 text-white rounded-lg w-full hover:scale-105 hover:from-purple-500 hover:to-blue-500 transition duration-300 ease-in-out" type="submit">
                    Salvar
                </button>
            </div>
        </form>
        <%
        } else {
        %>
        <p>Livro não encontrado.</p>
        <%
            }
        %>
    </div>
</section>
    </c:when>
    <c:otherwise>
<section>
    <a href="./index.jsp"  ><button  class="hidden ml-2 lg:inline-block m-2 py-1.5 px-3  text-center bg-gradient-to-r dark:text-gray-300 from-blue-500 to-purple-500 shadow-lg rounded-md text-white  hover:scale-105 hover:from-purple-500 hover:to-blue-500 transition duration-300 dark:text-gray-300 dark:bg-gray-700 hover:bg-gray-100 ">
        <svg class=" " width="20" height="26" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="#ffffff"><g id="SVGRepo_iconCarrier"><path d="M9 20H7C5.89543 20 5 19.1046 5 18V10.9199C5 10.336 5.25513 9.78132 5.69842 9.40136L10.6984 5.11564C11.4474 4.47366 12.5526 4.47366 13.3016 5.11564L18.3016 9.40136C18.7449 9.78132 19 10.336 19 10.9199V18C19 19.1046 18.1046 20 17 20H15M9 20V14C9 13.4477 9.44772 13 10 13H14C14.5523 13 15 13.4477 15 14V20M9 20H15" stroke="#fff" stroke-linecap="round" stroke-linejoin="round"></path></g></svg>
    </button> </a>
    <div class="container mx-auto text-center py-20">
        <h1 class="text-4xl mb-4">Acesso Negado</h1>
        <p class="text-xl">Você não tem permissão para acessar esta página.</p>
        <a href="login.jsp" class="mt-6 inline-block bg-white text-red-600 font-bold py-2 px-4 rounded">Voltar para o Login</a>
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



<%--
<%@ page import="javaweb.javaweb.model.Book" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Edição de Livro</title>
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
<body class="bg-gradient-to-r from-sky-400 ">
<header id="header">
    <jsp:include page="components/navBar.jsp" />
</header>
<section >
    <h1 id="section-title">Editar Livro</h1>
   &lt;%&ndash; <%
        String isbn = request.getParameter("isbn");
        Book livro = null;
        Object listaLivrosObj = request.getAttribute("listaLivros");
        if (listaLivrosObj instanceof List<?>) {
            for (Object obj : (List<?>) listaLivrosObj) {
                if (obj instanceof Book) {
                    Book b = (Book) obj;
                    if (b.getIsbn().equals(isbn)) {
                        livro = b;
                        break;
                    }
                }
            }
        }
        if (livro != null) {
    %>&ndash;%&gt;

    <%
        String isbn = request.getParameter("isbn");
        Book livro = (Book) request.getAttribute("livro");

        if (livro != null) {
    %>
        <form action="editBook" method="post">
            <input type="hidden" name="_method" value="put"/>
            <label for="isbn">ISBN:</label>
            <input type="text" id="isbn" name="isbn" value="<%= livro.getIsbn() %>" readonly/>

            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo" value="<%= livro.getTitulo() %>" required/>

            <label for="categoria">Categoria:</label>
            <input type="text" id="categoria" name="categoria" value="<%= livro.getCategoria() %>" required/>

            <label for="quantidade">Quantidade:</label>
            <input type="number" id="quantidade" name="quantidade" value="<%= livro.getQuantidade() %>" required/>

            <button type="submit" class="button">Salvar</button>
        </form>
        <%
        } else {
        %>
        <p>Livro não encontrado ou ISBN não fornecido.</p>
        <%
            }
        %>
    </section>

</body>
</html>
--%>
