<%--
    Document   : index
    Created on : 09.10.2012, 12:06:35
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Ltd.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="stripes" uri="http://stripes.sourceforge.net/stripes.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
    <head>
        <title>NORD POS mobi - Loading...</title>
    </head>
    <body>
        <stripes:url var="url" beanclass="mobi.nordpos.opendata.action.PresentationActionBean" prependContext="false" />
        <jsp:forward page="${url}" />
    </body>
</html>
