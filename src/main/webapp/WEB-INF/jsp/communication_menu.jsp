<%--
    Document   : communication_menu
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Communication Indicator Menu"
                       pageid="CommunicationIndicatorMenu">

    <stripes:layout-component name="button.return">
        <sdynattr:link href="/Presentation.action"
                       class="ui-btn ui-corner-all ui-icon-home ui-btn-icon-notext">
            <stripes:label name="label.home" />
        </sdynattr:link>                
    </stripes:layout-component>

    <stripes:layout-component name="header.title">
        <stripes:label name="label.CommunicationIndicatorMenu" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">
    </stripes:layout-component>

    <stripes:layout-component name="content">
        <stripes:errors />
        <stripes:messages />
        <ul data-role="listview" data-inset="true">
            <li>
                <a href="#setfixphonepie" 
                   data-rel="popup" 
                   data-position-to="window" 
                   data-transition="pop">
                    <stripes:label name="label.CommunicationFixPhoneIndicator" />
                </a>
            </li>
        </ul> 
        <div data-role="popup" 
             id="setfixphonepie" 
             data-overlay-theme="b" data-theme="a" 
             data-dismissible="false" style="max-width:400px;">
            <div data-role="header" data-theme="a">
                <h1><stripes:label name="label.dialog.setPeriod" /></h1>
            </div>
            <div role="main" class="ui-content">                        
                <stripes:form action="/CommunicationPie.action">                    
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
                    </sdynattr:select>
                    <sdynattr:select name="year" id="year" data-native-menu="false">
                        <option><c:out value="${actionBean.getLocalizationKey('label.select.year')}" /></option>
                        <stripes:option value="2014">
                            2014
                        </stripes:option>                                
                    </sdynattr:select>
                    <sdynattr:submit name="apply" data-theme="a" data-icon="check"/>                    
                </stripes:form>
                <a href="#" 
                   class="ui-btn ui-corner-all ui-icon-forbidden ui-btn-icon-left ui-btn-b ui-shadow" 
                   data-rel="back" 
                   data-transition="flow">
                    <stripes:label name="cancel" />
                </a>                                
            </div>
        </div>        

    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>
