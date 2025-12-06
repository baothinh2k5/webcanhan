<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${name} - ${title}</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css">
    
    <style>
    /* --- 1. CẤU HÌNH MÀU SẮC (CYBER TEAL) --- */
    :root {
        --bg-dark: #0b1016;
        --card-bg: rgba(20, 30, 40, 0.6);
        --primary-gradient: linear-gradient(135deg, #43cea2 0%, #185a9d 100%);
        --text-color: #cbd5e1;
        --highlight: #43cea2;
        --border-card: rgba(67, 206, 162, 0.2); 
    }

    html { background-color: #0f0f0f; }
    
    body {
        background-color: transparent !important;
        color: var(--text-color);
        font-family: 'Segoe UI', sans-serif;
        min-height: 100vh; margin: 0; overflow-x: hidden;
    }

    section, footer, .navbar {
        background: transparent !important; 
        position: relative; z-index: 1; 
    }

    /* --- 2. MATRIX BACKGROUND --- */
    #matrix-bg {
        position: fixed; top: 0; left: 0; width: 100%; height: 100%;
        z-index: 0; opacity: 0.15; pointer-events: none; 
    }

    /* --- 3. NAVBAR --- */
    .navbar {
        position: fixed; top: 0; width: 100%;
        background: rgba(11, 16, 22, 0.85) !important; 
        backdrop-filter: blur(10px); z-index: 1000;
        padding: 1rem 0; border-bottom: 1px solid rgba(255,255,255,0.05);
    }
    
    .nav-container {
        max-width: 1200px; margin: 0 auto; display: flex;
        justify-content: space-between; align-items: center; padding: 0 20px;
    }

    .nav-logo { 
        font-size: 1.5rem; font-weight: bold; 
        background: var(--primary-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent; 
    }
    .nav-menu { display: flex; list-style: none; gap: 20px; }
    .nav-link { color: #fff; text-decoration: none; font-weight: 500; transition: 0.3s; }
    .nav-link:hover, .nav-link.active { color: #43cea2; }

    /* --- 4. HERO SECTION --- */
    .hero {
        min-height: 100vh; display: flex; align-items: center; justify-content: center;
        text-align: center; padding-top: 80px;
    }
    .hero-content h1 { font-size: 3rem; margin: 1rem 0; color: #fff; }
    .hero-content .title { font-size: 1.5rem; color: #a0aec0; margin-bottom: 2rem; }
    .profile-image {
        width: 180px; height: 180px; border-radius: 50%; object-fit: cover;
        border: 4px solid rgba(67, 206, 162, 0.5);
        box-shadow: 0 0 30px rgba(67, 206, 162, 0.2);
    }
    .contact-info { display: flex; justify-content: center; gap: 20px; flex-wrap: wrap; margin-top: 20px; }
    .contact-item { background: rgba(255,255,255,0.05); padding: 8px 15px; border-radius: 20px; border: 1px solid rgba(255,255,255,0.1); }

    /* --- 5. GENERAL SECTIONS --- */
    .section-title {
        text-align: center; font-size: 2.5rem; font-weight: 700; margin-bottom: 3rem;
        background: var(--primary-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;
    }
    .section-content { max-width: 1200px; margin: 0 auto; padding: 4rem 20px; }

    /* --- 6. ABOUT --- */
    .about-card {
        display: flex; align-items: center; gap: 2rem;
        background: var(--card-bg); border: 1px solid var(--border-card);
        border-radius: 16px; padding: 2rem; backdrop-filter: blur(10px);
        max-width: 800px; margin: 0 auto; box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    }
    .about-image {
        width: 120px; height: 120px; border-radius: 50%; object-fit: cover;
        border: 2px solid transparent;
        background: linear-gradient(#0b1016, #0b1016) padding-box, var(--primary-gradient) border-box;
    }
    .about-info { flex-grow: 1; }
    .about-text { font-size: 1rem; line-height: 1.6; color: #ccc; margin: 0; }

    /* --- 7. SKILLS --- */
    .skills-wrapper { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 25px; }
    .category-card {
        background: var(--card-bg); backdrop-filter: blur(10px);
        border: 1px solid var(--border-card); border-radius: 16px; padding: 25px;
        transition: 0.4s; height: 100%; display: flex; flex-direction: column;
    }
    .category-card:hover { transform: translateY(-7px); border-color: #43cea2; box-shadow: 0 10px 30px -10px rgba(67, 206, 162, 0.3); }
    .cat-header { display: flex; align-items: center; gap: 15px; margin-bottom: 20px; border-bottom: 1px solid rgba(255,255,255,0.08); padding-bottom: 15px; }
    .cat-header i { font-size: 1.6rem; background: var(--primary-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
    .cat-header h3 { color: #fff; margin: 0; font-size: 1.3rem; }
    .tag-container { display: flex; flex-wrap: wrap; gap: 10px; }
    .tech-tag {
        font-size: 0.9rem; color: #43cea2; background: rgba(67, 206, 162, 0.1);
        padding: 8px 18px; border-radius: 50px; border: 1px solid rgba(67, 206, 162, 0.2); transition: 0.3s;
    }
    .tech-tag:hover { background: rgba(67, 206, 162, 0.2); border-color: #43cea2; transform: translateY(-2px); }

    /* --- 8. PROJECTS & EXERCISE BUTTONS --- */
    .projects-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 25px; }
    .project-card {
        background: var(--card-bg); border: 1px solid var(--border-card); border-radius: 16px; padding: 25px;
        transition: 0.3s; display: flex; flex-direction: column; height: 100%;
    }
    .project-card:hover { transform: translateY(-5px); border-color: #43cea2; box-shadow: 0 10px 30px -10px rgba(67, 206, 162, 0.3); }
    .project-card h3 { color: #fff; margin-bottom: 15px; font-size: 1.2rem; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 10px; }

    .exercise-list {
        display: grid; grid-template-columns: repeat(auto-fit, minmax(110px, 1fr));
        gap: 15px; margin-top: auto;
    }

    /* Nút Viên Thuốc */
    .btn-exercise {
        position: relative; /* Quan trọng để ghim badge */
        display: flex; justify-content: center; align-items: center; gap: 8px;
        border-radius: 50px; padding: 10px 10px;
        background: rgba(67, 206, 162, 0.05); border: 1px solid rgba(67, 206, 162, 0.2);
        color: #a0aec0; font-size: 0.85rem; font-weight: 600; text-decoration: none;
        transition: all 0.3s ease;
    }

    .btn-exercise:hover {
        background: var(--primary-gradient); border-color: transparent;
        color: #fff; transform: translateY(-3px); box-shadow: 0 5px 15px rgba(67, 206, 162, 0.4);
    }
    
    /* STYLE CHO BADGE "ĐÃ XEM" */
    .status-badge {
        position: absolute;
        top: -8px; right: -5px;
        background-color: #ff4757; /* Màu đỏ nổi bật */
        color: white; font-size: 9px; font-weight: bold;
        padding: 2px 6px; border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.5);
        opacity: 0; transform: scale(0); transition: 0.3s cubic-bezier(0.68, -0.55, 0.27, 1.55);
        pointer-events: none; z-index: 10;
    }

    /* Khi có class 'viewed' (đã bấm) thì hiện badge lên */
    .btn-exercise.viewed {
        border-color: rgba(255, 255, 255, 0.3);
        background: rgba(255, 255, 255, 0.05); /* Làm nút tối đi chút */
    }
    .btn-exercise.viewed .status-badge {
        opacity: 1; transform: scale(1); /* Hiện badge */
    }

    /* --- 9. CONTACT --- */
    .contact-wrapper { display: flex; justify-content: center; gap: 2rem; flex-wrap: wrap; }
    .contact-box {
        background: var(--card-bg); border: 1px solid var(--border-card);
        border-radius: 20px; padding: 2rem 3rem; text-align: center; text-decoration: none; width: 200px; transition: 0.3s;
    }
    .icon-box {
        width: 60px; height: 60px; margin: 0 auto 1rem; border-radius: 50%;
        display: flex; align-items: center; justify-content: center; font-size: 1.8rem;
        color: #43cea2; background: rgba(67, 206, 162, 0.1); transition: 0.3s;
    }
    .contact-box h3 { color: #fff; margin-bottom: 0.5rem; }
    .contact-box p { color: #888; font-size: 0.9rem; }
    .contact-box:hover { border-color: #43cea2; transform: translateY(-5px); box-shadow: 0 10px 30px rgba(67, 206, 162, 0.2); }
    .contact-box:hover .icon-box { background: #43cea2; color: #000; }

    footer { text-align: center; padding: 2rem; color: #666; font-size: 0.9rem; border-top: 1px solid rgba(255,255,255,0.05); }
    
    @media (max-width: 768px) {
        .about-card { flex-direction: column; text-align: center; }
        .hero-content h1 { font-size: 2.5rem; }
    }
    </style>
</head>
<body>
    
    <canvas id="matrix-bg"></canvas>
    
    <nav class="navbar">
        <div class="nav-container">
            <div class="nav-logo">${name}</div>
            <ul class="nav-menu">
                <li><a href="#home" class="nav-link">Trang chủ</a></li>
                <li><a href="#about" class="nav-link">Giới thiệu</a></li>
                <li><a href="#skills" class="nav-link">Kỹ năng</a></li>
                <li><a href="#projects" class="nav-link">Bài tập</a></li>
                <li><a href="#contact" class="nav-link">Liên hệ</a></li>
            </ul>
        </div>
    </nav>

    <section id="home" class="hero">
        <div class="hero-content">
            <img src="${pageContext.request.contextPath}/images/avatar.jpg" 
                 alt="Profile Picture" class="profile-image"
                 onerror="this.src='https://via.placeholder.com/200'">
            <h1>${name}</h1>
            <p class="title">${title}</p>
            <div class="contact-info">
                <div class="contact-item"><span>📧</span><span>${email}</span></div>
                <div class="contact-item"><span>📱</span><span>${phone}</span></div>
                <div class="contact-item"><span>📍</span><span>${location}</span></div>
            </div>
        </div>
    </section>

    <section id="about">
        <div class="section-content">
            <h2 class="section-title">Về Bản Thân</h2>
            <div class="about-card">
                <div class="about-image-wrapper">
                    <img src="${pageContext.request.contextPath}/images/avatar.jpg" 
                         alt="Avatar" class="about-image"
                         onerror="this.src='https://via.placeholder.com/200'"> 
                </div>
                <div class="about-info">
                    <p class="about-text">${about}</p> 
                </div>
            </div>
        </div>
    </section>

    <section id="skills">
        <div class="section-content">
            <h2 class="section-title">Kỹ Năng</h2>
            <div class="skills-wrapper">
                <% 
                java.util.Map<String, String[]> categories = (java.util.Map<String, String[]>) request.getAttribute("skillCategories");
                if (categories != null) {
                    for (java.util.Map.Entry<String, String[]> entry : categories.entrySet()) {
                        String catName = entry.getKey();
                        String[] items = entry.getValue();
                        String iconClass = "fa-solid fa-code"; 
                        if(catName.contains("Frontend")) iconClass = "fa-brands fa-react";
                        else if(catName.contains("Backend")) iconClass = "fa-solid fa-server";
                        else if(catName.contains("Cloud")) iconClass = "fa-solid fa-cloud";
                        else if(catName.contains("Tools")) iconClass = "fa-solid fa-layer-group";
                %>
                    <div class="category-card">
                        <div class="cat-header">
                            <i class="<%= iconClass %>"></i>
                            <h3><%= catName %></h3>
                        </div>
                        <div class="tag-container">
                            <% for(String item : items) { %>
                                <span class="tech-tag"><%= item %></span>
                            <% } %>
                        </div>
                    </div>
                <% 
                    } 
                }
                %>
            </div>
        </div>
    </section>

    <section id="projects">
        <div class="section-content">
            <h2 class="section-title">Bài tập Hàng Tuần</h2>
            <div class="projects-grid">
                <% 
                java.util.Map<String, java.util.List<String[]>> weeklyProjects = 
                    (java.util.Map<String, java.util.List<String[]>>) request.getAttribute("weeklyProjects");
                
                if (weeklyProjects != null) {
                    int weekCount = 0; // Biến đếm để tạo ID duy nhất cho tuần
                    for (java.util.Map.Entry<String, java.util.List<String[]>> entry : weeklyProjects.entrySet()) {
                        String weekTitle = entry.getKey();
                        java.util.List<String[]> exercises = entry.getValue();
                        weekCount++;
                %>
                    <div class="project-card">
                        <h3><%= weekTitle %></h3>
                        <div class="exercise-list">
                            <% 
                            int exCount = 0; // Biến đếm tạo ID duy nhất cho bài tập
                            for (String[] ex : exercises) { 
                                exCount++;
                                // Tạo ID duy nhất: vd: btn-w1-e1
                                String btnId = "btn-w" + weekCount + "-e" + exCount;
                            %>
                                <a href="<%= ex[1] %>" target="_blank" 
                                   class="btn-exercise" 
                                   id="<%= btnId %>"
                                   onclick="markAsViewed(this.id)">
                                   
                                    <span><%= ex[0] %></span> 
                                    <i class="fa-solid fa-arrow-up-right-from-square"></i>
                                    
                                    <span class="status-badge">Đã xem</span>
                                </a>
                            <% } %>
                        </div>
                    </div>
                <% 
                    } 
                }
                %>
            </div>
        </div>
    </section>
    
    <section id="contact">
        <div class="section-content">
            <h2 class="section-title">Liên Hệ</h2>
            <div class="contact-wrapper">
                <a href="${telegramLink}" target="_blank" class="contact-box telegram">
                    <div class="icon-box"><i class="fa-brands fa-telegram"></i></div>
                    <h3>Telegram</h3> <p>Chat trực tiếp</p>
                </a>
                <a href="mailto:${contactEmail}" class="contact-box email">
                    <div class="icon-box"><i class="fa-solid fa-envelope"></i></div>
                    <h3>Email</h3> <p>Gửi thư ngay</p>
                </a>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 ${name}. All rights reserved.</p>
    </footer>

    <script>
        // 1. Hàm chạy khi bấm nút
        function markAsViewed(elementId) {
            const btn = document.getElementById(elementId);
            if (btn) {
                btn.classList.add('viewed'); // Thêm class để hiện badge
                localStorage.setItem(elementId, 'true'); // Lưu vào bộ nhớ trình duyệt
            }
        }

        // 2. Hàm tự chạy khi load trang để khôi phục trạng thái
        document.addEventListener("DOMContentLoaded", function() {
            // Tìm tất cả các nút bài tập
            const buttons = document.querySelectorAll('.btn-exercise');
            buttons.forEach(btn => {
                // Kiểm tra xem ID này đã được lưu chưa
                if (localStorage.getItem(btn.id) === 'true') {
                    btn.classList.add('viewed');
                }
            });
        });
    </script>

    <script>
    const canvas = document.getElementById('matrix-bg');
    if (canvas) {
        const ctx = canvas.getContext('2d');
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        window.addEventListener('resize', () => {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
        });
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789@#$%^&*()';
        const fontSize = 14;
        const columns = canvas.width / fontSize;
        const rainDrops = [];
        for(let x = 0; x < columns; x++) { rainDrops[x] = 1; }
        const draw = () => {
            ctx.fillStyle = 'rgba(11, 16, 22, 0.1)'; 
            ctx.fillRect(0, 0, canvas.width, canvas.height);
            ctx.fillStyle = '#43cea2'; 
            ctx.font = fontSize + 'px monospace';
            for(let i = 0; i < rainDrops.length; i++) {
                const text = characters.charAt(Math.floor(Math.random() * characters.length));
                ctx.fillText(text, i * fontSize, rainDrops[i] * fontSize);
                if(rainDrops[i] * fontSize > canvas.height && Math.random() > 0.975){
                    rainDrops[i] = 0;
                }
                rainDrops[i]++;
            }
        };
        setInterval(draw, 30);
    }
    
    // Smooth scrolling
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) { target.scrollIntoView({ behavior: 'smooth', block: 'start' }); }
        });
    });
    </script>
</body>
</html>