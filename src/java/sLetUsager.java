/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;

import java.text.DateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import service.Dao;

/**
 *
 * @author jvict
 */
public class sLetUsager extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        //L'objet client, doit etre metre dans l'atribut de section usager

        Client client = null;

        HttpSession session = request.getSession();
        Commande com = (Commande) session.getAttribute("com");
        if (session == null) {

            response.sendRedirect("/error.html");
        } else {
            if (client != null) {
                //Prend l'objet client qui est dans l'attribut usager
                client = (Client) session.getAttribute("usager");
            }
        }

        String url = "";

        if (action.equals("test")) {
            Piece c = Dao.getPiece(1);
            System.out.println(c.getIdCategorie().getNomCategorie());
        }

        if (action.equals("nCommande")) {
            if (com == null) {
                client = Dao.getClient(Integer.parseInt(request.getParameter("client")));
                Date dateT = new Date();
                java.sql.Date sqlDate = new java.sql.Date(dateT.getTime());

                int idVoiture = Integer.parseInt(request.getParameter("voiture"));
                Modele voiture = Dao.getModele(idVoiture);

                int annee = Integer.parseInt(request.getParameter("annee"));
                com = new Commande(sqlDate, voiture, annee, client);
                session.setAttribute("com", com);
                System.out.println(com + " nCommande");

            }
        }

        if (action.equals("ajPiece")) {
            //getPiece(id)
            int id = Integer.parseInt(request.getParameter("idPiece"));
            int qtt = Integer.parseInt(request.getParameter("qtt"));
            String pos = request.getParameter("pos");
            String cote = request.getParameter("cote");
            Piece piece = Dao.getPiece(id);
            LigneCommande lc = new LigneCommande(piece, qtt, pos, cote);
            com.addPiece(lc);
            session.setAttribute("com", com);

        }

        if (action.equals("remPiece")) {
            int id = Integer.parseInt(request.getParameter("idPiece"));
            com.remPiece(id);
            session.setAttribute("com", com);
        }

        if (action.equals("envCommande")) {
            Commande cFinal = (Commande) session.getAttribute("com");
            Dao.insertCommande(com);
            session.setAttribute("com", com);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
