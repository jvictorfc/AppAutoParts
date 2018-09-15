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
        //Servlet Path
        String servletpath = getServletContext().getContextPath();
        Client usa = null;
        String action = request.getParameter("action");
        String page = request.getParameter("page");

        String langueChoisie = "";
        String url = "";

        HttpSession session = request.getSession();
        Commande com = (Commande) session.getAttribute("com");

        if (session == null) {
            response.sendRedirect("/error.html");
        }

        //
        if (action != null) {

            //Changing language
            if (action.equals("changeLang")) {
                langueChoisie = request.getParameter("langue");
                session.setAttribute("langueChoisie", langueChoisie);
                url = page;
                faireForward(request, response, url);
            }
            
            //Sign in
            if (action.equals("login")) {
                ArrayList<Client> listUsager = Utility.getListUsager();
                String usager = request.getParameter("usager");
                String pass = request.getParameter("pass");
                usa = Validation.validerUsager(usager, pass, listUsager);
                if(usa != null){
                session = request.getSession();
                session.setAttribute("usager", usa);
                url = "/WEB-INF/wUser.jsp";
                faireForward(request, response, url);
                }else
                    response.sendRedirect("error.html");
            }
            
            //Sign out
            if (action.equals("logoff")) {
                session = request.getSession();
                session.invalidate();
                url = "/index.jsp";
                faireForward(request, response, url);
            }

            //Registre usager
            if (action.equals("registre")) {
                ArrayList<Client> listUsager = Utility.getListUsager();
                String usager = request.getParameter("usager");
                String pass = request.getParameter("password");
                usa = Validation.validerUsager(usager, listUsager);
                if (usa == null) {
                    String nom = request.getParameter("nom");
                    String adresse = request.getParameter("adresse");
                    double tel = (Double.parseDouble(request.getParameter("telephone")));
                    Utility.enregistrerUsager(nom, adresse, tel, usager, pass);
                    PrintWriter out = response.getWriter();
                    out.println("{\"isValid\":1}");
                    out.flush();
                } else {
                    PrintWriter out = response.getWriter();
                    out.println("{\"isValid\":0}");
                    out.flush();
                }
            }
            
            //Creating a new Order(Here is our Pannier" 
            if (action.equals("nCommande")) {
                if (com == null) {
                    usa = (Client) session.getAttribute("usager");
                    Date dateT = new Date();
                    java.sql.Date sqlDate = new java.sql.Date(dateT.getTime());
                    int idModele = Integer.parseInt(request.getParameter("idModele"));
                    Modele modele = Dao.getModele(idModele);
                    int annee = Integer.parseInt(request.getParameter("annee"));
                    com = new Commande(sqlDate, modele, annee, usa);
                    session.setAttribute("com", com);
                }
            }

            //adding part
            if (action.equals("ajPiece")) {
                com = (Commande) session.getAttribute("com");
                int id = Integer.parseInt(request.getParameter("idPecesSelec"));
                int qtt = Integer.parseInt(request.getParameter("qttSelec"));
                String pos = request.getParameter("posSelec");
                String cote = request.getParameter("coteSelec");
                Piece piece = Dao.getPiece(id);
                LigneCommande lc = new LigneCommande(piece, qtt, pos, cote);
                com.addPiece(lc);
                session.setAttribute("com", com);
                int totalQtt = Utility.getQttTotal(com);
                Gson gson = new Gson();
                String json = gson.toJson(totalQtt);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }
            
            //Removing part
            if (action.equals("remPiece")) {
                int ligne = Integer.parseInt(request.getParameter("ligne"));
                com.remPiece(ligne);
                session.setAttribute("com", com);
            }
            
            //Changing quantity of parts
            if (action.equals("updQtt")) {
                int ligne = Integer.parseInt(request.getParameter("ligne"));
                int qtt = Integer.parseInt(request.getParameter("qtt"));
                com.updQtt(ligne, qtt);
                session.setAttribute("com", com);
            }
            
            //Sending order
            if (action.equals("envCommande")) {
                Commande cFinal = (Commande) session.getAttribute("com");
                Dao.insertCommande(cFinal);
                session.setAttribute("com", null);
                url = "/WEB-INF/wUser.jsp";
                faireForward(request, response, url);
            }
            
//            //Getting Pannier remove
//            if (action.equals("pannier")) {
//                Gson gson = new Gson();
//                String json = gson.toJson(com.getLigneCommande());
//                session.setAttribute("com", com);
//            }
            
            //Getting Pannier
            if (action.equals("getPannier")) {
                Gson gson = new Gson();
                String json = gson.toJson(com.getLigneCommande());
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }
            
            //Getting client orders
            if (action.equals("getCommandes")) {
                Client client = (Client) session.getAttribute("usager");
                ArrayList<Commande> commandes = Dao.getCommandes(client.getIdClient());
                Gson gson = new Gson();
                String json = gson.toJson(commandes);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }
            
            //Getting one order to show details
            if (action.equals("getCommande")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Commande c = Dao.getCommande(id);
                Gson gson = new Gson();
                String json = gson.toJson(c);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }
            
            //Getting brand
            if (action.equals("marque")) {
                ArrayList<Marque> listMarque = Dao.getListeMarques();
                String json = new Gson().toJson(listMarque);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }
            
            //Getting model
            if (action.equals("model")) {
                int idmarque = Integer.parseInt(request.getParameter("id"));
                ArrayList<Modele> listModele = Dao.getListeModele(idmarque);
                String json = new Gson().toJson(listModele);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }

            //Getting Categories
            if (action.equals("categories")) {
                ArrayList<Categorie> listCategorie = Dao.getListeCategorie();
                String json = new Gson().toJson(listCategorie);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }
            
            //Getting Part
            if (action.equals("piece")) {
                int idCategorie = Integer.parseInt(request.getParameter("id"));
                ArrayList<Piece> ListPiece = Dao.getListePiece(idCategorie);
                String json = new Gson().toJson(ListPiece);
                PrintWriter out = response.getWriter();
                out.println(json);
                out.flush();
            }
            
            //Finishing order without saving to begin a new one
            if (action.equals("annuler")) {
                com = (Commande) session.getAttribute("com");
                com = null;
                session.setAttribute("com", com);
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
