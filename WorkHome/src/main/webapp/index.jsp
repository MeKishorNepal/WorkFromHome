<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Task Management System</title>
    <link rel="stylesheet" href="CommonComponents/style.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <%@include file="CommonComponents/AllCss.jsp" %>
    <style>
        
body {
    background-image: url('img/home.jpg');
    background-repeat:no-repeat;
    background-size: cover;
    
    margin: 0;
    padding:0 20px ;
}

.footer {
    background-color: #333;
    color: #fff;
    text-align: center;
    padding: 10px;
    position: absolute;
    bottom: 0;
    width: 100%;
}
.welcome-message {
            text-align: center;
            margin-top: 0px; 
            font-size: 30px;
            color: #e1d5e3;
            
        }
    </style>
</head>

<body>
    <%@include file="CommonComponents/navbar.jsp" %>

    <div class="content">
        <div class="welcome-message" id="welcome-message">
            <!-- Each word will be wrapped in a span element -->
        </div>

        <script>
            const welcomeMessage = document.getElementById('welcome-message');
            const words = ['Welcome', 'to', 'Task', 'Management', 'System.',
                'Empower', 'your', 'work', 'with', 'Task', 'Management', 'System', '—', 'the', 'ultimate',
                'solution', 'for', 'task', 'organization,', 'communication,', 'and', 'streamlined',
                'project', 'execution.'
            ];

            const typeWord = async (word) => {
                for (let letter of word) {
                    await new Promise(resolve => setTimeout(() => {
                        welcomeMessage.innerHTML += letter;
                        resolve();
                    }, 50)); // Adjust the delay as needed
                }
            };

            const typeWords = async () => {
                for (let i = 0; i < words.length; i++) {
                    await typeWord(words[i]);
                    if (i < words.length - 1) {
                        await new Promise(resolve => setTimeout(() => {
                            welcomeMessage.innerHTML += ' ';
                            resolve();
                        }, 100)); // Adjust the delay as needed
                    }
                }
            };

            typeWords();
        </script>
    </div>
</body>

</html>
