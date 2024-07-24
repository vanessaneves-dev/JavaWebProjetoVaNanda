<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cadastro de usuário</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            darkMode: 'class',
            theme: {
                extend: {},
            },
        };
    </script>
</head>
<body class="bg-gradient-to-r from-sky-400">
<header >

    <jsp:include page="components/navBar.jsp" />
</header>
<section id="section">
    <div
            class="h-screen w-screen flex justify-center items-center dark:bg-gray-900 border-b-2 dark:border-gray-600"
    >
        <div class="grid gap-8">
            <div
                    id="back-div"
                    class="bg-gradient-to-r from-blue-500 to-purple-500 rounded-[26px] m-4"
            >
                <div
                        class="border-[20px] border-transparent rounded-[20px] dark:bg-gray-900 bg-white shadow-lg xl:p-10 2xl:p-10 lg:p-10 md:p-10 sm:p-2 m-2"
                >
                    <h1
                            class="text-gray-600 pt-8 pb-6 font-bold dark:text-gray-400 text-5xl text-center cursor-default"
                    >
                        Cadastre-se
                    </h1>
    <form id="form" action="newuser" method="post" onsubmit="return checkPasswords()">
        <div>
        <label for="name" class="mb-2 dark:text-gray-400 text-lg text-gray-500">Nome</label>
        <input  class="border p-3 dark:bg-indigo-700 dark:text-gray-300 dark:border-gray-700 shadow-md placeholder:text-base focus:scale-105 ease-in-out duration-300 border-gray-300 rounded-lg w-full" id="name"  type="text" name="nome" required />
        </div>
        <div>
        <label  for="email" class="mb-2 dark:text-gray-400 text-lg text-gray-500">E-mail</label>
        <input  class="border p-3 dark:bg-indigo-700 dark:text-gray-300 dark:border-gray-700 shadow-md placeholder:text-base focus:scale-105 ease-in-out duration-300 border-gray-300 rounded-lg w-full" id="email" type="email" name="email" required />
        </div>
        <div>
        <label for="password" class="mb-2 dark:text-gray-400 text-lg text-gray-500">Crie sua Senha</label>
        <input  class="border p-3 dark:bg-indigo-700 dark:text-gray-300 dark:border-gray-700 shadow-md placeholder:text-base focus:scale-105 ease-in-out duration-300 border-gray-300 rounded-lg w-full" id="password" type="password" name="password" required />
        </div>
        <div>
        <label  for="confirm-password" class="mb-2 dark:text-gray-400 text-lg text-gray-500">Confirme sua Senha</label>
        <input  class="mb-2 border p-3 dark:bg-indigo-700 dark:text-gray-300 dark:border-gray-700 shadow-md placeholder:text-base focus:scale-105 ease-in-out duration-300 border-gray-300 rounded-lg w-full" id="confirm-password" type="password" name="confirm-password" required />
        </div>
        <div>
        <button  class="bg-gradient-to-r dark:text-gray-300 from-blue-500 to-purple-500 shadow-lg p-2 text-white rounded-lg w-full hover:scale-105 hover:from-purple-500 hover:to-blue-500 transition duration-300 ease-in-out" type="submit">Cadastrar</button>
        </div>
    </form>
                    <div
                            class="flex flex-col mt-4 items-center justify-center text-sm"
                    >
                        <h3 class="dark:text-gray-300 text-gray-500">
                            Já possui cadastro?
                            <a
                                    class="group text-blue-400 transition-all duration-100 ease-in-out"
                                    href="userLogin.jsp"
                            >
                    <span
                            class="bg-left-bottom bg-gradient-to-r from-blue-400 to-blue-400 bg-[length:0%_2px] bg-no-repeat group-hover:bg-[length:100%_2px] transition-all duration-500 ease-out"
                    >
                      Login
                    </span>
                            </a>
                        </h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="components/footer.jsp" />

<script src="js/checkPasswords.js"></script>
</body>
</html>
