<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<div class="ui card" style="width: 100%;">
    <div class="content">
        <div class="header">个人档案</div>
    </div>
    <div class="content">
        <form action="" method="post" class="ui form">
            <input type="hidden" name="id" value="">
            <div class="two fields">
                <div class="field">
                    <label>昵称</label>
                    <input type="text" name="nickName" placeholder="Nick Name" value="">
                </div>
                <div class="field">
                    <label>性别</label>
                    <input type="radio" name="gender" value="1">男
                    <input type="radio" name="gender" value="0">女
                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <label>出生日期</label>
                    <input type="text" name="birthDay" placeholder="出生日期" value="">
                </div>
                <div class="field">
                    <label>个人主页</label>
                    <input type="url" name="personUrl" placeholder="更好的了解你" value="">
                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <label>手机号码</label>
                    <input type="number" name="mobile" placeholder="手机号码" value="" minlength="11" maxlength="11">
                </div>
                <div class="field">
                    <label>现居城市</label>
                    <input type="text" name="currentTown" placeholder="现居住地" value="">
                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <label>毕业院校</label>
                    <input type="text" name="school" placeholder="毕业院校" value="">
                </div>
                <div class="field">
                    <label>专业</label>
                    <input type="text" name="major" placeholder="专业" value="">
                </div>
            </div>
            <div class="two fields">
                <div class="field">
                    <label>所在公司</label>
                    <input type="text" name="company" placeholder="所在公司" value="">
                </div>
                <div class="field">
                    <label>职位</label>
                    <input type="text" name="job" placeholder="职位" value="">
                </div>
            </div>
            <button type="submit" class="ui primary button" id="save">保存个人信息</button>
            <button type="button" class="ui button" id="modify">修改个人信息</button>
        </form>
    </div>
</div>
<script>
    $(function () {

        $("#save").hide();
        $(":input").attr("readonly", true);

        /* 性别 */
        $(":input[type='radio']").each(function () {
            var gender = "${user.gender}";
            if (gender == $(this).val()) {
                $(this).attr("checked", true);
            }
        });

        $("#modify").click(function () {
            $(":input[type='radio']").attr("readonly", false);
            $(":input[type='text'][name!='nickName']").attr("readonly", false);
            $(":input[type='url']").attr("readonly", false);
            $(":input[type='number']").attr("readonly", false);
            $("#modify").hide();
            $("#save").show();
        });

    });
</script>
