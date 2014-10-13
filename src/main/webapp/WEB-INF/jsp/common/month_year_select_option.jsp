<%-- 
    Document   : month_year_select_option
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@ include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<sdynattr:select name="month" id="month" data-native-menu="false">
    <option><c:out value="${actionBean.getLocalizationKey('label.select.month')}" /></option>
    <stripes:option value="0">
        <c:out value="${actionBean.getLocalizationKey('january')}" />
    </stripes:option>
    <stripes:option value="1">
        <c:out value="${actionBean.getLocalizationKey('february')}" />
    </stripes:option>
    <stripes:option value="2">
        <c:out value="${actionBean.getLocalizationKey('march')}" />
    </stripes:option>
    <stripes:option value="3">
        <c:out value="${actionBean.getLocalizationKey('april')}" />
    </stripes:option>
    <stripes:option value="4">
        <c:out value="${actionBean.getLocalizationKey('may')}" />
    </stripes:option>
    <stripes:option value="5">
        <c:out value="${actionBean.getLocalizationKey('june')}" />
    </stripes:option>
    <stripes:option value="6">
        <c:out value="${actionBean.getLocalizationKey('july')}" />
    </stripes:option>
    <stripes:option value="7" disabled="disabled">
        <c:out value="${actionBean.getLocalizationKey('august')}" />
    </stripes:option>
    <stripes:option value="8" disabled="disabled">
        <c:out value="${actionBean.getLocalizationKey('september')}" />
    </stripes:option>
    <stripes:option value="9" disabled="disabled">
        <c:out value="${actionBean.getLocalizationKey('october')}" />
    </stripes:option>     
    <stripes:option value="10" disabled="disabled">
        <c:out value="${actionBean.getLocalizationKey('november')}" />
    </stripes:option>       
    <stripes:option value="11" disabled="disabled">
        <c:out value="${actionBean.getLocalizationKey('december')}" />
    </stripes:option>                           
</sdynattr:select>
<sdynattr:select name="year" id="year" data-native-menu="false">
    <option><c:out value="${actionBean.getLocalizationKey('label.select.year')}" /></option>
    <stripes:option value="2014">
        2014
    </stripes:option>                                
</sdynattr:select>
<sdynattr:submit name="apply" data-theme="a" data-icon="check"/>  