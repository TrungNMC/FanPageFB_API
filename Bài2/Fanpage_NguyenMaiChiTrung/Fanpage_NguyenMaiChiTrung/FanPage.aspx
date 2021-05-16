<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FanPage.aspx.cs" Inherits="Fanpage_NguyenMaiChiTrung.FanPage" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Hello!</title>
    <style>
        .table {
            border: 1px solid #ccc;
        }

        .btn {
            width: 70px;
            height: 30px;
            background-color: #00ff90;
            border: none;
            border-radius: 5px;
            color: black;
            font-weight: 900;
            margin-left: 100px
        }

        tbody {
            font-size: 26px;
            font-weight: 500;
        }
    </style>
    <script>
        const access_token = 'EAAAAZAw4FxQIBAGgMO8luzwscA8ZCfQgeFNHQCgEuTOUIVPCEOtgHTWlE0h2ToW3CTO7NZBPc9xDBlEcTo20bshtf2cBtrXKZBfvHTAH4WZAkbdLMGtFZAiZBr3XlAGaLvr6Khq6Bce3uT2lwQnQyStTtl5uC0DkG8U5X7KZAn4LlQZDZD';
        var likes = 0;
        var arrayIdPost = [];
        var content = "";
        function init() {
            fetch('https://graph.facebook.com/103791921838538/posts?access_token=' + access_token).then(
                function (response) {
                    if (response.status !== 200) {
                        console.log('Lỗi, mã lỗi là' + response.status);
                        return;
                    }

                    response.json().then(data => {
                        for (let i = 0; i < 3; i++) {
                            document.getElementById("post" + i).innerHTML = data.data[i].message;
                            arrayIdPost.push(data.data[i].id);
                            fetch('https://graph.facebook.com/' + data.data[i].id + '?fields=likes.summary(true)&access_token=' + access_token).then(
                                function (response) {
                                    if (response.status !== 200) {
                                        console.log('Lỗi, mã lỗi ' + response.status);
                                        return;
                                    }

                                    response.json().then(data => {
                                        document.getElementById("title" + i).innerHTML = "Bài viết " + (i + 1) + "<br>" + "Lượt likes:      " + data.likes.summary.total_count + " likes";
                                    })
                                }
                            )
                                .catch(err => {
                                    console.log('Error :-S', err)
                                });
                        }

                    })
                }
            )
                .catch(err => {
                    console.log('Error :-S', err)
                });
        }
        init();

        function myFunction1() {
            var content = document.getElementById("exampleFormControlTextarea0").value;

            const data = { access_token: access_token, message: content };
            fetch('https://graph.facebook.com/' + arrayIdPost[0] + '/comments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
                .then(response => response.json())
                .then(data => {
                    alert('Đăng bình luận thành công');
                    document.getElementById('exampleFormControlTextarea0').value = "";
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        }

        function myFunction2() {
            var content = document.getElementById("exampleFormControlTextarea1").value;
            const data = { access_token: access_token, message: content };
            fetch('https://graph.facebook.com/' + arrayIdPost[1] + '/comments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
                .then(response => response.json())
                .then(data => {
                    alert('Đăng bình luận thành công');
                    document.getElementById('exampleFormControlTextarea1').value = "";
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        }

        function myFunction3() {
            var content = document.getElementById("exampleFormControlTextarea2").value;
            const data = { access_token: access_token, message: content };
            fetch('https://graph.facebook.com/' + arrayIdPost[2] + '/comments', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(data)
            })
                .then(response => response.json())
                .then(data => {
                    alert('Đăng bình luận thành công');
                    document.getElementById('exampleFormControlTextarea2').value = "";
                })
                .catch((error) => {
                    console.error('Error:', error);
                });
        }
    </script>
</head>
<body>
    <h1><a href="https://www.facebook.com/Fanpage-Nguy%E1%BB%85n-Mai-Ch%C3%AD-Trung-103791921838538" style="text-decoration: none">Fanpage Nguyễn Mai Chí Trung</a>
        <table class="table">
            <thead>
                <th id="title0" style="border-bottom: 1px solid #ccc">Bài viết 1</th>
            </thead>
            <tbody>
                <tr>
                    <td>Content:
                        <h id="post0"></h>
                        <br />
                        Comment:
                        <textarea class="form-control" id="exampleFormControlTextarea0"></textarea>
                        <br />
                        <button type="button" class="btn" onclick="myFunction1()">ADD</button>
                    </td>
                </tr>
            </tbody>
        </table>
        <table class="table">
            <thead>
                <th id="title1" style="border-bottom: 1px solid #ccc">Bài viết 2</th>
            </thead>
            <tbody>
                <tr>
                    <td>Content:
                        <h id="post1"></h>
                        <br />
                        Comment:
                        <textarea class="form-control" id="exampleFormControlTextarea1"></textarea>
                        <br />
                        <button type="button" class="btn" onclick="myFunction2()">ADD</button>
                    </td>
                </tr>
            </tbody>
            <table class="table">
                <thead>
                    <th id="title2" style="border-bottom: 1px solid #ccc">Bài viết 3</th>
                </thead>
                <tbody>
                    <tr>
                        <td>Content:
                            <h id="post2"></h>
                            <br />
                            Comment:
                        <textarea class="form-control" id="exampleFormControlTextarea2"></textarea>
                            <br />
                            <button type="button" class="btn" onclick="myFunction3()">ADD</button>
                        </td>
                    </tr>

                </tbody>


            </table>
    </h1>
</body>
</html>
