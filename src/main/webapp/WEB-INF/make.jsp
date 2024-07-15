<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="stylesheet" href="css/make.css">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>作問モード</title>
</head>
<body>
  <button onclick="Home()">ホームに戻る</button>
  <form action="makeMode" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <h2>ジャンル<br>
      <textarea name="genre" id="genreInput" cols="100" rows="1" oninput="checkFields()"></textarea>
    </h2>
    <h2 >問題<br>
      <textarea name="question" id="questionInput" cols="100" rows="5" oninput="checkFields()"></textarea>
    </h2>
    <h2>解答<br>
      <textarea name="answer" id="answerInput" cols="100" rows="1" oninput="validateHiragana(this); checkFields()" ></textarea>
    </h2>
    <p id="errorMessage">ひらがなとアルファベットのみ入力してください。</p>
    <input type="file" name="imageFile" id="image"><br>
    <div id="upload"></div>
    <input type="submit" value="Submit">
    <p id="formError">すべてのフィールドを入力してください。</p>
  </form>
  <script>
    function previewFile(file) {
      // プレビュー画像を追加する要素
      const preview = document.getElementById('upload');
      // 以前のプレビューを削除
      preview.innerHTML = '';
      // FileReaderオブジェクトを作成
      const reader = new FileReader();
      // ファイルが読み込まれたときに実行する
      reader.onload = function (e) {
        const img = document.createElement("img"); // img要素を作成
        img.src = e.target.result; // 画像のURLをimg要素にセット
        img.style.maxWidth = "100%"
        preview.appendChild(img); // #previewの中に追加
      }
      // いざファイルを読み込む
      reader.readAsDataURL(file);
    }
    // <input>でファイルが選択されたときの処理
    const fileInput = document.getElementById('image');
    const handleFileSelect = () => {
      const files = fileInput.files;
      if (files.length > 0) {
        previewFile(files[0]); // 最初のファイルのみをプレビュー
      }
    }
    fileInput.addEventListener('change', handleFileSelect);
    
    function validateHiragana(input) {
      var validRegex = /^[\u3040-\u309Fa-zA-Zー]*$/;
      var errorMessage = document.getElementById("errorMessage");
      
      if (validRegex.test(input.value)) {
        errorMessage.style.display = "none";
      } else {
        errorMessage.style.display = "block";
        // 入力欄から不正な文字を削除
        input.value = input.value.replace(/[^\u3040-\u309Fa-zA-Zー]/g, '');
      }
    }

    function validateForm() {
      var genre = document.getElementById("genreInput").value.trim();
      var question = document.getElementById("questionInput").value.trim();
      var answer = document.getElementById("answerInput").value.trim();
      var formError = document.getElementById("formError");

      if (genre === "" || question === "" || answer === "") {
        formError.style.display = "block";
        return false;
      } else {
        formError.style.display = "none";
        return true;
      }
    }

    function checkFields() {
      var genre = document.getElementById("genreInput").value.trim();
      var question = document.getElementById("questionInput").value.trim();
      var answer = document.getElementById("answerInput").value.trim();
      var formError = document.getElementById("formError");

      if (genre !== "" && question !== "" && answer !== "") {
        formError.style.display = "none";
      }
    }

    function Home() {
      window.location.href = 'home';
    }
  </script>
</body>
</html>
