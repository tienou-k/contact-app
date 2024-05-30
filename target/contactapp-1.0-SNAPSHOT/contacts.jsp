<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycontact.contactApp.Contacts" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Gestion des contacts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Optionnellement inclure les fichiers CSS personnalisés -->
    <link rel="stylesheet" type="text/css" href="./contact.css">
</head>
<body>
    <div class="container">
        <h1 class="text-center my-4">Gestion des contacts</h1>
        <div class="button-en">
        
        <button type="button" class="btn btn-primary mb-4" data-toggle="modal" data-target="#contactModal">Nouveau contact</button>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="contactModalLabel" aria-hidden="true" data-backdrop="static">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="contactModalLabel">Ajouter ou modifier un contact</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ContactServlet" method="post" id="contactForm">
                            <input type="hidden" name="id" value="<%= request.getAttribute("contact") != null ? ((Contacts) request.getAttribute("contact")).getId() : "" %>">
                            <div class="form-group">
                                <label for="nom">Nom:</label>
                                <input type="text" class="form-control" id="nom" name="nom" 
                                       value="<%= request.getAttribute("contact") != null ? ((Contacts) request.getAttribute("contact")).getNom() : "" %>" required>
                            </div>
                            <div class="form-group">
                                <label for="prenom">Prénom:</label>
                                <input type="text" class="form-control" id="prenom" name="prenom" 
                                       value="<%= request.getAttribute("contact") != null ? ((Contacts) request.getAttribute("contact")).getPrenom() : "" %>" required>
                            </div>
                            <div class="form-group">
                                <label for="numero">Numéro:</label>
                                <input type="tel" class="form-control" id="numero" name="numero" 
                                       value="<%= request.getAttribute("contact") != null ? ((Contacts) request.getAttribute("contact")).getNumero() : "" %>" required>
                            </div>
                            <div class="form-group">
                                <label for="competence">Competence:</label>
                                <input type="text" class="form-control" id="competence" name="competence" 
                                       value="<%= request.getAttribute("contact") != null ? ((Contacts) request.getAttribute("contact")).getCompetence() : "" %>" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                <button type="submit" class="btn btn-primary">Enregistrer</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <h2>Liste des contacts</h2>
        <% List<Contacts> contacts = (List<Contacts>) request.getAttribute("contacts");
           if (contacts != null && !contacts.isEmpty()) { %>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Numéro</th>
                        <th>Competence</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Contacts contact : contacts) { %>
                        <tr>
                            <td><%= contact.getNom() %></td>
                            <td><%= contact.getPrenom() %></td>
                            <td><%= contact.getNumero() %></td>
                            <td><%= contact.getCompetence() %></td>
                            <td>
                                <a href="ContactServlet?action=delete&id=<%= contact.getId() %>" class="btn btn-danger btn-sm"><i class="fa fa-trash fa-1.5x"></i></a>
                                
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <p class="text-center">Aucun contact trouvé.</p>
        <% } %>
    </div>

</body>
    <!-- Inclure les fichiers JavaScript de Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
