<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<div class="ui card" style="width: 100%;">
    <div class="content">
        <div class="header">修改密码</div>
    </div>
    <div class="content">
        <form action="" method="post" class="ui form">
            <input type="hidden" name="id" value="${user.id}">
            <div class="field">
                <label>旧密码</label>
                <input type="password" name="oldPassword" placeholder="old Password" value="">
            </div>
            <div class="field">
                <label>新密码</label>
                <input type="password" name="newPassword" placeholder="new Password" value="">
            </div>
            <div class="field">
                <label>确认密码</label>
                <input type="password" name="confirmPassword" placeholder="confirm Password" value="">
            </div>

            <button type="button" class="ui button" id="modify">保存密码</button>
        </form>
    </div>
</div>
