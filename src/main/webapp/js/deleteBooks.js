function deleteBook(isbn) {
    fetch('/excluir', {
        method: 'DELETE',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: 'isbn=' + isbn
    }).then(response => {
        if (response.ok) {
            window.location.reload();
        } else {
            alert('Falha ao excluir o livro');
        }
    });
}
