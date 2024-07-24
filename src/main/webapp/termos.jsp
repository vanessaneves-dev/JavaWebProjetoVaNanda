<%--
  Created by IntelliJ IDEA.
  User: Lucas
  Date: 07/07/2024
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="PT-BR">
<head>
    <title>Login</title>
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

<main>

    <section class="dark:bg-gray-900 border-b-2 dark:border-gray-600">
        <a href="./home.jsp" title="Home" ><button  class="hidden lg:inline-block m-2 py-1.5 px-3  text-center bg-gradient-to-r dark:text-gray-300 from-blue-500 to-purple-500 shadow-lg rounded-md text-white  hover:scale-105 hover:from-purple-500 hover:to-blue-500 transition duration-300 dark:text-gray-300 dark:bg-gray-700 hover:bg-gray-100 ">
            <svg class=" " width="20" height="26" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" fill="#ffffff"><g id="SVGRepo_iconCarrier"><path d="M9 20H7C5.89543 20 5 19.1046 5 18V10.9199C5 10.336 5.25513 9.78132 5.69842 9.40136L10.6984 5.11564C11.4474 4.47366 12.5526 4.47366 13.3016 5.11564L18.3016 9.40136C18.7449 9.78132 19 10.336 19 10.9199V18C19 19.1046 18.1046 20 17 20H15M9 20V14C9 13.4477 9.44772 13 10 13H14C14.5523 13 15 13.4477 15 14V20M9 20H15" stroke="#fff" stroke-linecap="round" stroke-linejoin="round"></path></g></svg>
        </button> </a>
        <div class="py-8 max-w-screen-lg mx-auto">
            <div class="text-center mb-8">
                <h1 class="text-3xl sm:text-4xl leading-normal font-extrabold tracking-tight text-gray-600">
                    Termos de Uso e <span class="text-indigo-600">Política de Privacidade</span>
                </h1>
                <h2 class="text-4xl font-bold mt-6 mb-6 text-gray-600 dark:text-gray-300">Introdução</h2>
                <p class="px-4 leading-relaxed text-gray-500 dark:text-gray-300">Bem-vindo à Vananda Books. Ao acessar nosso site, você concorda com os termos e condições descritos abaixo. Por favor, leia atentamente.
                </p>
            </div>
            <div class="w-full max-w-3xl mx-auto">

            </div>
        </div>

        <div class="px-10 sm:px-16 sm:flex items-start mb-10">

            <div class="w-9/12">
                <div class="flex items-start mb-8">
                    <div
                            class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">

                    </div>
                    <div class="text-md">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">1. Termos de Uso</h2>
                        <h3 class="text-gray-500 text-sm dark:text-gray-300">1.1. Uso do Site</h3>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Ao utilizar nosso site, você concorda em não:</p>
                        <ul class="text-gray-500 text-sm dark:text-gray-300">
                            <li>Utilizar o site para qualquer finalidade ilegal ou não autorizada;</li>
                            <li>Interferir na operação do site ou nos servidores que o hospedam;</li>
                            <li>Reproduzir, duplicar, copiar, vender, revender ou explorar qualquer parte do site sem nossa permissão expressa por escrito.</li>
                        </ul>

                    </div>
                </div>
                <div class="flex items-start mb-8">
                    <div
                            class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">

                    </div>
                    <div class="text-md">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">2. Política de Privacidade</h2>
                        <h3 class="text-gray-500 text-sm dark:text-gray-300">2.1. Coleta de Informações</h3>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Coletamos informações pessoais que você nos fornece diretamente, como nome, endereço de e-mail, e detalhes de pagamento ao fazer uma compra.</p>
                        <h3 class="text-gray-500 text-sm dark:text-gray-300">2.2. Uso das Informações</h3>
                        <p class="text-gray-500 text-sm dark:text-gray-300">As informações que coletamos são usadas para:</p>
                        <ul class="text-gray-500 text-sm dark:text-gray-300">
                            <li>Fornecer, operar e manter nosso site;</li>
                            <li>Melhorar, personalizar e expandir nosso site;</li>
                            <li>Entender e analisar como você usa nosso site;</li>
                            <li>Desenvolver novos produtos, serviços, recursos e funcionalidades;</li>
                            <li>Comunicar-se com você, diretamente ou através de um de nossos parceiros.</li>
                        </ul>
                    </div>
                </div>
                <div class="flex items-start mb-8">
                    <div
                            class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">

                    </div>
                    <div class="text-md">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">3. Segurança</h2>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Tomamos medidas razoáveis para proteger suas informações pessoais contra perda, roubo e uso indevido, bem como acesso não autorizado, divulgação, alteração e destruição.</p>

                    </div>
                </div>
            </div>

        </div>
        <div class="px-10 sm:px-16 sm:flex items-start mb-10">


            <div class="w-9/12">
                <div class="flex items-start mb-8">
                    <div
                            class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">

                    </div>
                    <div class="text-md">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">4. Alterações nos Termos e Política de Privacidade</h2>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Reservamo-nos o direito de modificar estes Termos e a Política de Privacidade a qualquer momento. Notificaremos sobre quaisquer alterações postando os novos termos em nosso site. Você é aconselhado a revisar esta página periodicamente para quaisquer alterações.</p>

                    </div>
                </div>
                <div class="flex items-start mb-8">
                    <div
                            class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">

                    </div>
                    <div class="text-md ">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">5. Contato</h2>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Se você tiver alguma dúvida sobre estes Termos e Política de Privacidade, entre em contato conosco através do nosso e-mail: contato@vanandabooks.com.</p>

                    </div>
                </div>
            </div>

        </div>
        </div>
    </section>
</main>


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
