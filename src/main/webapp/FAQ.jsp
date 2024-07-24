
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="PT-BR">
<head>
    <title>FAQ</title>
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
        <div class="py-8 max-w-screen-lg mx-auto">
            <div class="text-center mb-8">
                <h1 class="text-3xl sm:text-4xl leading-normal font-extrabold tracking-tight text-gray-600">
                    Perguntas Frequentes <span class="text-indigo-600">(FAQ)</span>
                </h1>
                <h2 class="text-4xl font-bold mt-6 mb-6 text-gray-600 dark:text-gray-300">Vananda Books</h2>
                <p class="px-4 leading-relaxed text-gray-500 dark:text-gray-300">Aqui você encontra respostas para as perguntas mais frequentes sobre nossos serviços e nossa plataforma. Caso tenha outras dúvidas, sinta-se à vontade para entrar em contato conosco.</p>
            </div>
            <div class="w-full max-w-3xl mx-auto">
                <!-- Perguntas e Respostas -->
                <div class="flex items-start mb-8">
                    <div class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">
                        1
                    </div>
                    <div class="text-md">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">Como faço para criar uma conta?</h2>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Para criar uma conta, clique no botão "Cadastre-se" no menu superior e preencha o formulário com suas informações pessoais. Em seguida, clique em "Cadastrar" para concluir o cadastro.</p>
                    </div>
                </div>
                <div class="flex items-start mb-8">
                    <div class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">
                        2
                    </div>
                    <div class="text-md">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">Como posso cadastrar um livro?</h2>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Para cadastrar uma livro, clique no botão "Cadastro de Livros" no menu superior e preencha o formulário com as informações e imagem do livro. Em seguida, clique em "Adicionar" para concluir o cadastro.</p>
                    </div>
                </div>
                <div class="flex items-start mb-8">
                    <div class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">
                        3
                    </div>
                    <div class="text-md">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">Como posso entrar em contato com o suporte?</h2>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Você pode entrar em contato com nosso suporte enviando um e-mail para contato@vanandabooks.com. Nossa equipe estará disponível para ajudar com qualquer dúvida ou problema que você possa ter.</p>
                    </div>
                </div>


                <div class="flex items-start mb-8">
                    <div class="hidden sm:flex items-center justify-center p-3 mr-3 rounded-full bg-indigo-500 text-white border-4 border-white text-xl font-semibold">
                        4
                    </div>
                    <div class="text-md">
                        <h2 class="text-gray-600 font-semibold mb-2 dark:text-gray-300">Como faço para alterar as informações de livro?</h2>
                        <p class="text-gray-500 text-sm dark:text-gray-300">Para alterar as informações de um livro, faça login em sua conta, acesse a seção "Coleção de livros" e clique no icone editar e edite as informações que deseja atualizar. Clique em "Salvar" para confirmar as alterações.</p>
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
