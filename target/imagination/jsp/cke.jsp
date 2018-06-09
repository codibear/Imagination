<%-- User: codiibear   Date: 2018/4/30  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>A Simple Page with CKEditor</title>
    <!-- Make sure the path to CKEditor is correct.
        "https://cdn.ckeditor.com/ckeditor5/10.0.0/inline/ckeditor.js"
        //cdn.ckeditor.com/4.9.2/standard/ckeditor.js
     -->
    <script src="${pageContext.request.contextPath}../ckeditor/ckeditor.js"></script>
    <script src="../js/jquery-3.3.1.min.js"></script>

</head>
<body>
<h1>所见即所得</h1>
<form>
    <%--<div id="editor1" contenteditable="true">
        <h1>编辑器</h1>
        <p>点击此处编写内容</p>
    </div>--%>


    <textarea rows="10" cols="30" class="ckeditor" name="content" id="editor1"></textarea>


</form>
<script>
    CKEDITOR.replace( 'content', {
        filebrowserBrowseUrl: '/try?&editor1&CKEditorFuncNum=1&langCode=zh-cn&responseType=json',
        filebrowserUploadUrl: '/try?&editor1&CKEditorFuncNum=1&langCode=zh-cn&responseType=json'
    });
</script>
</body>
</html>
