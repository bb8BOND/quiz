<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import java.util.*;

<%
  List<String> genreList = (List<String>) request.getAttribute("genreList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/search.css">
  <title>Start View Mode</title>
</head>
<body>
  <h1>
    問題ジャンル
    <div class="select-box01">
      <select id="subject" onchange="startSearch()" >
        <option value="">-</option>
        <% for (String genre : genreList) { %>
          <option value = "<%= genre %>"><%= genre %></option>
        <% } %>
      </select>
    </div>
  </h1>
      
  <div id="Quiz" class="problem">
    <h2><%= selectedGenre %>の問題</h2>
    <p>一瞥の意味は何か</p>
    <p>邂逅の意味は何か</p>
    <p>煩雑の意味は何か</p>
  </div>
  <div id="mathProblem" class="problem">
    <h2>数学の問題</h2>
    <p>世界は微分で記述されるが、読み解く方法は何か</p>
  </div>
  <div id="englishProblem" class="problem">
    <h2>英語の問題</h2>
    <p>pcはpersonal computerの略だが、AIは何の略か。</p>
  </div>
  <script>
    // // 初期状態では問題文を非表示にする
    // var problems = document.querySelectorAll('.problem');
    // problems.forEach(function(problem) {
    //   problem.style.display = 'none';
    // });
    // document.getElementById('subject').addEventListener('change', function() {
    //   var selectedSubject = this.value;
    //   // 全ての問題文を非表示にする
    //   problems.forEach(function(problem) {
    //     problem.style.display = 'none';
    //   });
    //   // 選択された教科の問題文を表示する
    //   if (selectedSubject) {
    //     document.getElementById(selectedSubject + 'Problem').style.display = 'block';
    //   }
    // });

    function startSearch(){
      // 選択されたジャンルを取得
      var subject = document.getElementById("subject");
      var selectedGenre = subject.value;
      setGenre(selectedGenre);

      // リンク先のURLを構築
      var url = "searchMode?genre=" + encodeURIComponent(selectedGenre);
      
      // リンク先に遷移
      window.location.href = url;
    }
  </script>
</body>
</html>