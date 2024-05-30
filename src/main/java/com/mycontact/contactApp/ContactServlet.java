package com.mycontact.contactApp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
    private static final List<Contacts> contacts = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            contacts.removeIf(contact -> contact.getId() == id);
            
        } else if ("edit".equals(action)) {
            
        }
        request.setAttribute("contacts", contacts);
        request.getRequestDispatcher("contacts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String idStr = request.getParameter("id");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String numero = request.getParameter("numero");
        String competence = request.getParameter("competence");

        if (idStr != null && !idStr.isEmpty()) {
            int id = Integer.parseInt(idStr);
            Contacts contact = contacts.stream().filter(c -> c.getId() == id).findFirst().orElse(null);
            if (contact != null) {
                contact.setNom(nom);
                contact.setPrenom(prenom);
                contact.setNumero(numero);
                contact.setCompetence(competence);
            }
        } else {
            Contacts contact = new Contacts(nom, prenom, numero, competence);
            contacts.add(contact);
        }
        response.sendRedirect("ContactServlet");
    }
}
