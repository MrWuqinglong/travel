package com.system.web;

/**
 * Controller 返回 JSON 的包装
 */
public class Response {
    private boolean status;
    private String type;
    private String message;
    private Object result;

    public Response() {
        message = "";
        status = false;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getResult() {
        return result;
    }

    public void setResult(Object result) {
        this.result = result;
    }
}
