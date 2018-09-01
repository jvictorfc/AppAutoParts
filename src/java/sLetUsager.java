/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.DateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import javax.persistence.Convert;
import javax.persistence.metamodel.SetAttribute;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.*;
import service.Dao;
import utility.Utility;
import utility.Validation;

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
        String page = request.getParameter("page");

        //L'objet client, doit etre metre dans l'atribut de section usager
        //Client client = null;
        String langueChoisie = "";
        String url = "";
        // Cookie cookie = new Cookie(null,null);

        HttpSession session = request.getSession();
        // session.setAttribute("langueChoisie", langueChoisie);
        System.out.println("------------------" + langueChoisie);

        if (action.equals("changeLang")) {
            langueChoisie = request.getParameter("langue");
            session.setAttribute("langueChoisie", langueChoisie);
            //cookie = new Cookie("cookielangue", langueChoisie);
            //cookie.setMaxAge(3600);
            // response.addCookie(cookie);
            url = page;
            faireForward(request, response, url);
        }

        Commande com = (Commande) session.getAttribute("com");
        if (session == null) {
            response.sendRedirect("/error.html");
        } else {
//            if (client != null) {
//                //Prend l'objet client qui est dans l'attribut usager
//                // client = (Client) session.getAttribute("usager");
//            }
        }

        //login 
        if (action != null) {
            if (action.equals("login")) {

                ArrayList<Client> listUsager = Utility.getListUsager();
                String usager = request.getParameter("usager");

                String pass = request.getParameter("pass");

                Client usa = Validation.validerUsager(usager, pass, listUsager);
                session = request.getSession();
                session.setAttribute("usager", usa);
                url = "/usager/wUser.jsp";
                faireForward(request, response, url);
            }

            if (action.equals("registreValid")) {
                url = "/login.jsp";
                response.sendRedirect(url);
            }

            //Registre usager
            if (action.equals("registre")) {
                ArrayList<Client> listUsager = Utility.getListUsager();
                String usager = request.getParameter("usager");
                String pass = request.getParameter("password");
                System.out.println(pass);
                Client usa = Validation.validerUsager(usager, listUsager);
                if (usa == null) {
                    String nom = request.getParameter("nom");
                    String adresse = request.getParameter("adresse");
                    int tel = (Integer.parseInt(request.getParameter("telephone")));
                    int repond = Utility.enregistrerUsager(nom, adresse, tel, usager, pass);

                    PrintWriter out = response.getWriter();
                    out.println("{\"isValid\":1}");
                    out.flush();
                } else {
                    PrintWriter out = response.getWriter();
                    out.println("{\"isValid\":0}");
                    out.flush();
                }

            }
            //  Commande com = (Commande) session.getAttribute("com");
            if (session == null) {

                response.sendRedirect("/error.html");
            } else {
//                if (client != null) {
//                    //Prend l'objet client qui est dans l'attribut usager
//                    client = (Client) session.getAttribute("usager");
//                }
            }

            if (action.equals("nCommande")) {
                if (com == null) {
                    //client = Dao.getClient(Integer.parseInt(request.getParameter("client")));
                    Date dateT = new Date();
                    java.sql.Date sqlDate = new java.sql.Date(dateT.getTime());
                    Client client = (Client) session.getAttribute("usager");
                    System.out.println(client.getNomClient());
                    int idVoiture = Integer.parseInt(request.getParameter("voiture"));
                    Modele voiture = Dao.getModele(idVoiture);

                    int annee = Integer.parseInt(request.getParameter("annee"));
                    com = new Commande(sqlDate, voiture, annee, client);
                    session.setAttribute("com", com);
                    //System.out.println(com + " nCommande");

                }
            }

            if (action.equals("ajPiece")) {
                //getPiece(id)
                int id = Integer.parseInt(request.getParameter("idPiece"));
                int qtt = Integer.parseInt(request.getParameter("qtt"));
                String pos = request.getParameter("pos");
                String cote = request.getParameter("cote");
                Piece piece = Dao.getPiece(id);
                System.out.println(piece.getNomPiece());
                LigneCommande lc = new LigneCommande(piece, qtt, pos, cote);
                System.out.println(lc.getQtt() + " " + lc.getPiece().getNomPiece());
                com.addPiece(lc);
                System.out.println("qtt itens arraylist" + com.getLigneCommande().size());
                session.setAttribute("com", com);
            }

            if (action.equals("remPiece")) {
                int ligne = Integer.parseInt(request.getParameter("ligne"));
                com.remPiece(ligne);
                session.setAttribute("com", com);
            }

            if (action.equals("updQtt")) {
                int ligne = Integer.parseInt(request.getParameter("ligne"));
                int qtt = Integer.parseInt(request.getParameter("qtt"));
                com.updQtt(ligne, qtt);
                session.setAttribute("com", com);
            }

            if (action.equals("envCommande")) {
                Commande cFinal = (Commande) session.getAttribute("com");
                Dao.insertCommande(cFinal);
                System.out.println(cFinal.getLigneCommande().size());
                session.setAttribute("com", null);
            }

            if (action.equals("pannier")) {
                System.out.println("Entrou no test do panier");
                //t1    Commande comtest = Dao.getCommande(110);
                System.out.println("Info da comanda: " + com.getClient().getNomClient());
                Gson gson = new Gson();
                String json = gson.toJson(com.getLigneCommande());
                //Dao.insertCommande(com);
                session.setAttribute("com", com);
            }

            if (action.equals("getPannier")) {
                System.out.println("Getting pannier");
                //Commande comtest = Dao.getCommande(110);
                //System.out.println("Info da comanda: " + comtest.getClient().getNomClient());
                System.out.println(com.getClient().getNomClient());
                Gson gson = new Gson();
                String json = gson.toJson(com.getLigneCommande());
                //Dao.insertCommande(com);
                //session.setAttribute("com", comtest);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }

            if (action.equals("getCommandes")) {
                System.out.println("Getting commandes");
                Client client = (Client) session.getAttribute("usager");
                ArrayList<Commande> commandes = Dao.getCommandes(client.getIdClient());
                Gson gson = new Gson();
                String json = gson.toJson(commandes);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }

            if (action.equals("getCommande")) {
                System.out.println("Getting commandes");
                int id = Integer.parseInt(request.getParameter("id"));
                Commande c = Dao.getCommande(id);
                Gson gson = new Gson();
                String json = gson.toJson(c);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }

        } else {
            response.sendRedirect("/error.html");
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

    public void faireForward(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException {
        RequestDispatcher dispacher = getServletContext().getRequestDispatcher(url);
        dispacher.forward(request, response);
    }

}
