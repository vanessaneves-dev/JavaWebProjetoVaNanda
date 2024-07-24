<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="PT-BR">
<head>
    <title>Bem-vindo a VaNanda Books</title>
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
<body class="bg-gradient-to-r from-sky-400 ">
<jsp:include page="components/navBar.jsp" />






<section class="dark:bg-gray-900 border-b-2 dark:border-gray-600">
    <div class="max-w-screen-xl mx-auto py-8 px-4 lg:py-16 lg:px-6">
        <div class="text-center text-gray-600 mb-10 dark:text-gray-300">
            <h2 class="text-4xl tracking-tight font-bold text-primary-800">Leia e Descubra Novos Mundos</h2>
        </div>

        <div class="flex flex-col md:flex-row">
            <!-- can help image -->
            <div  class=" max-w-sm mr-0 md:mr-8 mb-6 md:mb-0 md:block">
                <img class="mx-auto" src="images/homeBook.png" alt="can_help_banner">
            </div>
            <!-- end can help image -->

            <div class="flex-1 flex flex-col flex-wrap -mb-4 -mx-2 sm:flex-col md:flex-row  sm:items-center" <%--class="flex-1 flex flex-col flex-wrap md:flex-nowrap -mb-4 -mx-2 dark:text-gray-300 sm:items-center"--%>>
                <div class="w-full sm:w-1/2 mb-4 px-2 ">
                    <div class="h-full py-4 px-6 border border-blue-500 border-t-0 border-l-0 rounded-br-xl">
                        <h3 class="text-2xl font-bold text-md mb-6 text-gray-600 dark:text-gray-300">Quem Somos:</h3>
                        <p class="text-sm text-gray-700 dark:text-gray-300">Somos apaixonados por livros e acreditamos no poder transformador da leitura. Nossa missão é proporcionar acesso a uma vasta coleção de obras literárias para que todos possam desfrutar dos benefícios e do prazer de ler.</p>
                    </div>
                </div>
                <div class="w-full sm:w-1/2 mb-4 px-2 ">
                    <div class="h-full py-4 px-6 border border-blue-500 border-t-0 border-l-0 rounded-br-xl">
                        <h3 class="text-2xl font-bold text-md mb-6 text-gray-600 dark:text-gray-300">Benefícios da Leitura</h3>
                        <ul class="text-sm text-gray-700 dark:text-gray-300">
                            <li>Desenvolvimento cognitivo e emocional</li>
                            <li>Expansão do vocabulário</li>
                            <li>Melhora na concentração e foco</li>
                            <li>Redução do estresse</li>
                            <li>Estímulo à imaginação e criatividade</li>
                        </ul>
                    </div>
                </div>

                <div class="w-full sm:w-1/2 mb-4 px-2 ">
                    <div class="h-full py-4 px-6 border border-blue-500 border-t-0 border-l-0 rounded-br-xl dark:text-gray-300">
                        <h3 class="text-2xl font-bold text-md mb-6 text-gray-600 dark:text-gray-300">Fato Interessante</h3>
                        <p class="text-sm text-gray-700 dark:text-gray-300">Você sabia que "Dom Quixote" de Miguel de Cervantes é considerado o primeiro romance moderno? Publicado em 1605, ele revolucionou a literatura com sua narrativa complexa e personagens profundos.</p>
                    </div>
                </div>

                <div class="w-full sm:w-1/2 mb-4 px-2 ">
                    <div class="h-full py-4 px-6 border border-blue-500 border-t-0 border-l-0 rounded-br-xl">
                        <h3 class="text-2xl font-bold text-md mb-6 text-gray-600 dark:text-gray-300">Leia e Viaje</h3>
                        <p class="text-sm text-gray-700 dark:text-gray-300">Descubra novos mundos e aventuras incríveis através da leitura. Clique abaixo e tenha acesso a uma vasta coleção de livros.</p>
                        <div class="flex content-end">
                            <a class=" lg:inline-block lg:ml-auto py-1.5 px-3 m-1 text-center bg-gradient-to-r dark:text-gray-300 from-blue-500 to-purple-500 shadow-lg rounded-md text-white  hover:scale-105 hover:from-purple-500 hover:to-blue-500 transition duration-300 dark:text-gray-300 dark:bg-gray-700 hover:bg-gray-100 "
                               href="/listarLivros.jsp">
                                Coleção
                            </a>
                        </div>
                    </div>

                </div>


            </div>
        </div>
    </div>
</section>

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