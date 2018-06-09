<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- User: codiibear   Date: 2018/4/30  --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<c:set var="base" value="<%=basePath%>"></c:set>
<html>
<head>
    <meta charset="utf-8">
    <title>A Simple Page with CKEditor</title>
    <!-- Make sure the path to CKEditor is correct.
        "https://cdn.ckeditor.com/ckeditor5/10.0.0/inline/ckeditor.js"

        ${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js
        //cdn.ckeditor.com/4.9.2/standard/ckeditor.js
     -->
    <script src="${pageContext.request.contextPath}/assets/ckeditor/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/assets/ckfinder/ckfinder.js"></script>


    <script src="../js/jquery-3.3.1.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="../js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</head>
<body>
<form enctype="multipart/form-data" action="${pageContext.request.contextPath}/uploadFile" method="post">

    <textarea rows="10" cols="30" class="ckeditor" name="content" id="editor1"></textarea>

    <button  type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">完善信息</button>
    <button  type="submit" class="btn btn-success" data-toggle="modal" data-target="#myModal" onclick="abc()">提交</button>
    <div class="form-group">
        <%--模态框--%>
        <!-- Modal -->
        <div class="modeldiv">
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title text-center" id="myModalLabel">协议</h4>
                        </div>
                        <div class="modal-body">
                            这是协议的主要内容
                            <div class="form-group">
                                <label for="imaname" class="control-label">标题</label>
                                <input type="text" class="form-control" id="imaname" name="imaname">
                            </div>
                            <div class="form-group">
                                <label for="imabrief" class="control-label">简介</label>
                                <textarea class="form-control" id="imabrief" name="imabrief"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="imacontent" class="control-label">neirong</label>
                                <textarea class="form-control" id="imacontent" name="imacontent"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="file" class="control-label">封面</label>
                                <input type="file" class="form-control" id="file" name="file"/>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal">确认</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

    </form>
<script>

    function abc() {
        alert("sdf");
        var imamsg = CKEDITOR.instances.editor1.getData();
        alert(imamsg);
        $("#imacontent").val(imamsg);
    }


    CKEDITOR.replace( 'content', {

       });

    /*var edfinder = CKEDITOR.replace( 'editor1', {
        filebrowserImageUploadUrl :'/ckeditor/cke',
    filebrowserUploadUrl: '/ckeditor?&editor1&CKEditorFuncNum=1&langCode=zh-cn&responseType=json'
    });*/
    //CKFinder.setupCKEditor(edfinder, '/assets/ckfinder/');

    /*CKEDITOR.replace( 'content', {
        /!*filebrowserBrowseUrl: '/ckeditory?&editor1&CKEditorFuncNum=1&langCode=zh-cn&responseType=json',
        filebrowserUploadUrl: '/ckeditory?&editor1&CKEditorFuncNum=1&langCode=zh-cn&responseType=json'*!/
    });
    CKFinder.setupCKEditor(editor, '/assets/ckfinder/');*/




   /* function abc() {




        var ed = document.getElementById('editor1').innerHTML;
        alert('ed'+ed);
        var s = CKEDITOR.instances.editor1.getData('content');
        /!*var sdd = $('textarea #editor1').val();
        alert("sdd"+sdd);
        var txt = $('#editor1').val();
        var inhtml = document.getElementById("editor1").innerHTML;
        alert("inhtml"+inhtml);
        console.log(som);*!/

        //alert(txt)
        alert(s);
    }*/


</script>
</body>
</html>
