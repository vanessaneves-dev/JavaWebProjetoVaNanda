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
   <%-- <%
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
    %>--%>

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
