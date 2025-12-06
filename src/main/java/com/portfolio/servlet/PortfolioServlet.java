package com.portfolio.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;

@WebServlet(name = "PortfolioServlet", urlPatterns = {"/", "/home"})
public class PortfolioServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Thông tin cá nhân
        request.setAttribute("name", "Nguyễn Thái Bảo");
        request.setAttribute("title", "Software engineering");
        request.setAttribute("email", "23110078@student.hcmute.edu.vn");
        request.setAttribute("phone", "0793 778 529");
        request.setAttribute("location", "Đồng Nai, Việt Nam");
        
        // Về tôi
        request.setAttribute("about", 
        "Chào bạn, mình là <span class='highlight'>Nguyễn Thái Bảo</span>. " +
        "Hiện là sinh viên năm 3 ngành CNTT tại <span class='highlight'>HCMUTE</span>. " +
        "Mình đam mê xây dựng các ứng dụng web hiệu suất cao và đang hướng tới mục tiêu trở thành một " +
        "<span class='highlight'>Full-stack Freelancer</span> chuyên nghiệp, làm việc tự do và chủ động.");
        
        // Kỹ năng
        // Trong PortfolioServlet.java
        Map<String, String[]> skillCategories = new LinkedHashMap<>();

        // Nhóm 1: Frontend
        skillCategories.put("Frontend", new String[]{"React", "JSP", "HTML5", "CSS3", "JavaScript"});

        // Nhóm 2: Backend
        skillCategories.put("Backend", new String[]{"Java", "Spring Boot", "Python", "C#", "Node.js"});

        // Nhóm 3: Database & Cloud
        skillCategories.put("Database & Cloud", new String[]{"SQL Server", "MongoDB", "AWS S3", "DynamoDB"});

        // Nhóm 4: Tools & DevOps
        skillCategories.put("DevOps & Tools", new String[]{"Git", "Docker", "NetBeans", "VS Code"});

        request.setAttribute("skillCategories", skillCategories);
        
        // Dự án
        Map<String, List<String[]>> weeklyProjects = new LinkedHashMap<>();

        // >> TUẦN 1
        List<String[]> week1 = new ArrayList<>();
        week1.add(new String[]{"Bài 1", "https://week1-39yo.onrender.com"});
        weeklyProjects.put("Tuần 1: Java Web Development with MVC", week1);

        // >> TUẦN 2
        List<String[]> week2 = new ArrayList<>();
        week2.add(new String[]{"Bài 1", "https://week2-f0j8.onrender.com"});
        week2.add(new String[]{"Bài 2", "https://week3-u1p3.onrender.com"});
        weeklyProjects.put("Tuần 2: Building Web with HTML5/CSS3 & Servlets", week2);

        // >> TUẦN 3
        List<String[]> week3 = new ArrayList<>();
        week3.add(new String[]{"Bài 1", "https://week3-2-uj7b.onrender.com"});
        weeklyProjects.put("Tuần 3: JSP Techniques & Web State Handling", week3);

        // >> TUẦN 4
        List<String[]> week4 = new ArrayList<>();
        week4.add(new String[]{"Bài 1", "https://week4-te1z.onrender.com"});
        week4.add(new String[]{"Bài 2", "https://week4-2-qg03.onrender.com"});
        week4.add(new String[]{"Bài 3", "https://week4-2-2.onrender.com"});
        weeklyProjects.put("Tuần 4: JSP EL, Tag Libraries & JDBC", week4);

        // >> TUẦN 5
        List<String[]> week5 = new ArrayList<>();
        week5.add(new String[]{"Bài 1", "https://week5-1-gcbd.onrender.com"});
        week5.add(new String[]{"Bài 2", "https://week5-mail-1.onrender.com"});
        weeklyProjects.put("Tuần 5: JSP Techniques & State Handling", week5);
        request.setAttribute("weeklyProjects", weeklyProjects);
        // --- 4. THÔNG TIN LIÊN HỆ (Cập nhật link thật của bạn) ---

        // Link Telegram (Dùng full link https)
        request.setAttribute("telegramLink", "https://t.me/vtnabao"); 

        // Email (Chỉ điền địa chỉ mail, phần "mailto:" đã có bên JSP lo rồi)
        request.setAttribute("contactEmail", "23110078@student.hcmute.edu.vn"); 
        
        // Chuyển tiếp đến JSP
        request.getRequestDispatcher("/WEB-INF/views/portfolio.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}