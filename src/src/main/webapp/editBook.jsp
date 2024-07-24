<%@ page import="com.servlet.aula.projetobibliotecaservlet.models.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Central Biblioteca | Editar Livro</title>
    <link rel="stylesheet" href="styles/reset.css"/>
    <link rel="stylesheet" href="styles/style.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet"/>
</head>
<body>
<header id="header">
    <a href="#"><img id="logo" src="images/logo.png" alt="Logo Biblioteca"/></a>
    <h1 id="header-title">Central Biblioteca</h1>
    <a class="button" id="logout-button" href="index.jsp">Logout</a>
</header>
<section id="section">
    <h1 id="section-title">Editar Livro</h1>
    <%
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
    %>
    <form action="atualizar" method="post">
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
    <p>Livro não encontrado.</p>
    <%
        }
    %>
</section>
<footer id="footer">
    Danilo Lassabia | Kamily Santos - Projeto Servlet ©️
</footer>
</body>
</html>
