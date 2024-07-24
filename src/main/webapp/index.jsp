<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="PT-BR">
<head>
    <title>JSP - Hello World</title>
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



<!-- mobile navbar -->
<div class="navbar-menu relative z-50 hidden">
    <div class="navbar-backdrop fixed inset-0 bg-gray-800 opacity-50"></div>
    <nav
            class="fixed bg-white dark:bg-gray-600 top-0 left-0 bottom-0 flex flex-col w-5/6 max-w-sm py-6 px-6 border-r overflow-y-auto">

        <div class="flex items-center mb-8">
            <a class="mr-auto text-2xl font-bold text-black text-violet-600 dark:text-gray-100"
               href="https://tailwindflex.com/">
                TailwindFlex
            </a>

            <button class="navbar-close">
                <svg class="h-6 w-6 text-gray-400 cursor-pointer hover:text-gray-500"
                     xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12">
                    </path>
                </svg>
            </button>
        </div>

        <div class=" relative mx-auto text-gray-600">
            <input class="border-2 border-gray-300 bg-white h-10 px-5 pr-16 rounded-lg text-sm focus:outline-none dark:placeholder-gray-200 dark:bg-gray-500 dark:border-gray-50" type="search" name="search" placeholder="Search">

            <button type="submit" class="absolute right-0 top-0 mt-3 mr-4">
                <svg class="text-gray-600 dark:text-gray-200 h-4 w-4 fill-current"
                     xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
                     x="0px" y="0px" viewBox="0 0 56.966 56.966" style="enable-background:new 0 0 56.966 56.966;"
                     xml:space="preserve" width="512px" height="512px">
                        <path
                                d="M55.146,51.887L41.588,37.786c3.486-4.144,5.396-9.358,5.396-14.786c0-12.682-10.318-23-23-23s-23,10.318-23,23  s10.318,23,23,23c4.761,0,9.298-1.436,13.177-4.162l13.661,14.208c0.571,0.593,1.339,0.92,2.162,0.92  c0.779,0,1.518-0.297,2.079-0.837C56.255,54.982,56.293,53.08,55.146,51.887z M23.984,6c9.374,0,17,7.626,17,17s-7.626,17-17,17  s-17-7.626-17-17S14.61,6,23.984,6z" />
                    </svg>
            </button>

        </div>

        <div class="mt-auto">

            <div class="pt-6">
                <button id="theme-toggle-2" type="button" class=" py-2.5 w-[97.6%] mb-3 rounded-xl flex justify-center align-middle py-1.5 px-3 m-1 text-center bg-gray-100 border border-gray-300 rounded-md text-black  hover:bg-gray-100 dark:text-gray-300 dark:bg-gray-700 hover:bg-gray-100 dark:hover:bg-gray-700">
                    <svg id="theme-toggle-dark-icon-2" class="w-6 h-6 hidden" fill="currentColor"
                         viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                    </svg>
                    <svg id="theme-toggle-light-icon-2" class="w-6 h-6 hidden" fill="currentColor"
                         viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path
                                d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                                fill-rule="evenodd" clip-rule="evenodd"></path>
                    </svg>
                </button>

                <a class="block py-1.5 px-3 m-1 text-center bg-gray-100 border border-gray-300 rounded-md text-black  hover:bg-gray-100 dark:text-gray-300 dark:bg-gray-700 px-4 py-3 mb-3 text-sm text-center font-semibold rounded-xl"
                   href="/logar.jsp">
                    Sign in
                </a>

                <a class="block py-1.5 px-3 m-1 text-center bg-violet-700 border rounded-md text-white  hover:bg-violet-500 hover:text-gray-100 dark:text-gray-200 dark:bg-violet-700 px-4 py-3 mb-2 text-xs text-center text-white font-semibold bg-violet-600 hover:bg-violet-700  rounded-xl"
                   href="https://tailwindflex.com/playground">
                    Tailwind Playground
                </a>

            </div>
            <p class="my-4 text-xs text-center text-gray-400">
                <span>TailwindFlex Copyright © 2023</span>
            </p>
        </div>
    </nav>
</div>

<section class="dark:bg-gray-900 border-b-2 dark:border-gray-600">
    <div class="max-w-screen-xl mx-auto py-8 px-4 lg:py-16 lg:px-6">
        <div class="text-center text-gray-600 mb-10 dark:text-gray-300">
            <h2 class="text-4xl tracking-tight font-bold text-primary-800">Leia e Descubra Novos Mundos</h2>
        </div>

        <div class="flex flex-col md:flex-row">
            <!-- can help image -->
            <div  class=" max-w-sm mr-0 md:mr-8 mb-6 md:mb-0 sm:hidden md:block">
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