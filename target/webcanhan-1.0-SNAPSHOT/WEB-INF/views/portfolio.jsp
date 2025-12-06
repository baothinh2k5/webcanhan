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
    /* --- 1. CẤU HÌNH MÀU SẮC MỚI (CYBER TEAL - DỊU MẮT) --- */
    :root {
        --bg-dark: #0b1016; /* Nền đen ngả xanh nhẹ */
        --card-bg: rgba(20, 30, 40, 0.6); /* Nền kính tối màu */
        
        /* Gradient Xanh Ngọc -> Xanh Dương (Rất mượt và dịu) */
        --primary-gradient: linear-gradient(135deg, #43cea2 0%, #185a9d 100%);
        
        --text-color: #cbd5e1; /* Chữ xám xanh nhạt, đỡ chói hơn trắng tinh */
        --highlight: #43cea2; /* Màu điểm nhấn */
        
        /* Viền xanh ngọc mờ */
        --border-card: rgba(67, 206, 162, 0.2); 
    }

    /* Đặt nền đen cho HTML */
    html {
        background-color: #0f0f0f;
    }

    /* Body trong suốt để thấy Matrix */
    body {
        background-color: transparent !important;
        color: var(--text-color);
        font-family: 'Segoe UI', sans-serif;
        min-height: 100vh;
        margin: 0;
        overflow-x: hidden;
    }

    /* Các section trong suốt */
    section, footer, .navbar {
        background: transparent !important; 
        position: relative;
        z-index: 1; 
    }

    /* --- 2. MATRIX BACKGROUND --- */
    #matrix-bg {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        z-index: 0; 
        opacity: 0.15; /* Độ sáng 15% - Rất dịu */
        pointer-events: none; 
    }

    /* --- 3. NAVBAR STYLE --- */
    .navbar {
        position: fixed;
        top: 0;
        width: 100%;
        background: rgba(11, 16, 22, 0.85) !important; 
        backdrop-filter: blur(10px);
        z-index: 1000;
        padding: 1rem 0;
        border-bottom: 1px solid rgba(255,255,255,0.05);
    }
    
    .nav-container {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
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
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        padding-top: 80px;
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

    /* --- 5. TIÊU ĐỀ SECTION --- */
    .section-title {
        text-align: center; font-size: 2.5rem; font-weight: 700; margin-bottom: 3rem;
        background: var(--primary-gradient); -webkit-background-clip: text; -webkit-text-fill-color: transparent;
        filter: drop-shadow(0 2px 4px rgba(0,0,0,0.3));
    }
    .section-content { max-width: 1200px; margin: 0 auto; padding: 4rem 20px; }

    /* --- 6. ABOUT SECTION --- */
    .about-card {
        display: flex; align-items: center; gap: 2rem;
        background: var(--card-bg);
        border: 1px solid var(--border-card); border-radius: 16px;
        padding: 2rem; backdrop-filter: blur(10px);
        max-width: 800px; margin: 0 auto;
        box-shadow: 0 10px 30px rgba(0,0,0,0.2);
    }
    .about-image {
        width: 120px; height: 120px; border-radius: 50%; object-fit: cover;
        border: 2px solid transparent;
        background: linear-gradient(#0b1016, #0b1016) padding-box, var(--primary-gradient) border-box;
    }
    .about-info { flex-grow: 1; }
    .about-text { font-size: 1rem; line-height: 1.6; color: #ccc; margin: 0; }
    .highlight-text { color: transparent; background: var(--primary-gradient); -webkit-background-clip: text; background-clip: text; font-weight: 700; }

    /* --- 7. SKILLS SECTION --- */
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

    /* --- 8. PROJECTS SECTION (CẬP NHẬT NÚT VIÊN THUỐC) --- */
    .projects-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 25px; }
    .project-card {
        background: var(--card-bg); border: 1px solid var(--border-card); border-radius: 16px; padding: 25px;
        transition: 0.3s; display: flex; flex-direction: column; height: 100%;
    }
    .project-card:hover { transform: translateY(-5px); border-color: #43cea2; box-shadow: 0 10px 30px -10px rgba(67, 206, 162, 0.3); }
    .project-card h3 { color: #fff; margin-bottom: 15px; font-size: 1.2rem; border-bottom: 1px solid rgba(255,255,255,0.1); padding-bottom: 10px; min-height: 50px; }

    /* Khu vực chứa nút: Grid 2 cột hoặc tự co giãn */
    .exercise-list {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
        gap: 12px;
        margin-top: auto;
    }

    /* Style Nút Viên Thuốc */
    .btn-exercise {
        display: flex; justify-content: center; align-items: center; gap: 8px;
        border-radius: 50px; padding: 10px 15px;
        background: rgba(67, 206, 162, 0.05); border: 1px solid rgba(67, 206, 162, 0.2);
        color: #a0aec0; font-size: 0.9rem; font-weight: 600; text-decoration: none;
        transition: all 0.3s ease; user-select: none;
    }

    .btn-exercise:hover {
        background: var(--primary-gradient); border-color: transparent;
        color: #fff; transform: translateY(-3px); box-shadow: 0 5px 15px rgba(67, 206, 162, 0.4);
    }
    
    /* TRẠNG THÁI ĐÃ CLICK (VISITED) - Màu tối đi */
    .btn-exercise:visited {
        background: rgba(255, 255, 255, 0.05);
        border-color: rgba(255, 255, 255, 0.05);
        color: #666;
        box-shadow: none;
    }
    .btn-exercise:visited:hover {
        background: rgba(67, 206, 162, 0.3); color: #ddd;
    }

    /* --- 9. CONTACT SECTION --- */
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
    .contact-box:hover .icon-box { background: #43cea2; color: #000; box-shadow: 0 0 15px #43cea2; }

    /* Footer */
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
                 alt="Profile Picture" 
                 class="profile-image"
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
                         alt="Nguyễn Thái Bảo" 
                         class="about-image"
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
                if (categories == null) categories = new java.util.LinkedHashMap<>(); 
                
                if (categories != null) {
                    for (java.util.Map.Entry<String, String[]> entry : categories.entrySet()) {
                        String catName = entry.getKey();
                        String[] items = entry.getValue();
                        String iconClass = "fa-solid fa-code"; 
                        if(catName.contains("Frontend")) iconClass = "fa-brands fa-react";
                        else if(catName.contains("Backend")) iconClass = "fa-solid fa-server";
                        else if(catName.contains("Cloud") || catName.contains("DevOps")) iconClass = "fa-solid fa-cloud";
                        else if(catName.contains("Tools") || catName.contains("Design")) iconClass = "fa-solid fa-layer-group";
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
                    for (java.util.Map.Entry<String, java.util.List<String[]>> entry : weeklyProjects.entrySet()) {
                        String weekTitle = entry.getKey();
                        java.util.List<String[]> exercises = entry.getValue();
                %>
                    <div class="project-card">
                        <h3><%= weekTitle %></h3>
                        <div class="exercise-list">
                            <% for (String[] ex : exercises) { %>
                                <a href="<%= ex[1] %>" target="_blank" class="btn-exercise">
                                    <span><%= ex[0] %></span> 
                                    <i class="fa-solid fa-arrow-up-right-from-square"></i>
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
            <h2 class="section-title">Liên Hệ Với Tôi</h2>
            <p style="text-align: center; color: #ccc; margin-bottom: 3rem;">
                Bạn có ý tưởng thú vị? Hãy kết nối ngay để cùng nhau hiện thực hóa nó!
            </p>
            <div class="contact-wrapper">
                <a href="${telegramLink}" target="_blank" class="contact-box telegram">
                    <div class="icon-box"><i class="fa-brands fa-telegram"></i></div>
                    <h3>Telegram</h3>
                    <p>Chat trực tiếp</p>
                </a>
                <a href="mailto:${contactEmail}" class="contact-box email">
                    <div class="icon-box"><i class="fa-solid fa-envelope"></i></div>
                    <h3>Email</h3>
                    <p>Gửi thư ngay</p>
                </a>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 ${name}. All rights reserved.</p>
    </footer>

    <script>
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) { target.scrollIntoView({ behavior: 'smooth', block: 'start' }); }
            });
        });

        window.addEventListener('scroll', () => {
            let current = '';
            const sections = document.querySelectorAll('section');
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                if (pageYOffset >= (sectionTop - 200)) { current = section.getAttribute('id'); }
            });
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active');
                if (link.getAttribute('href').slice(1) === current) { link.classList.add('active'); }
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
            // Lớp phủ mờ
            ctx.fillStyle = 'rgba(11, 16, 22, 0.1)'; 
            ctx.fillRect(0, 0, canvas.width, canvas.height);

            // MÀU CHỮ MATRIX - XANH NGỌC DỊU MẮT
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
    </script>
</body>
</html>