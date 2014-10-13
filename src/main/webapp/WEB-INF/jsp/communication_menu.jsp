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
            <li>
                <a href="#setmobilephonepie" 
                   data-rel="popup" 
                   data-position-to="window" 
                   data-transition="pop">
                    <stripes:label name="label.CommunicationMobilePhoneIndicator" />
                </a>
            </li>
            <li>
                <a href="#setfixvsmobilepie" 
                   data-rel="popup" 
                   data-position-to="window" 
                   data-transition="pop">
                    <stripes:label name="label.CommunicationFixVsMobile" />
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
                <stripes:form action="/CommunicationPie.action?fix">
                    <jsp:include page="/WEB-INF/jsp/common/month_year_select_option.jsp"/>                                      
                </stripes:form>
                <a href="#" 
                   class="ui-btn ui-corner-all ui-icon-forbidden ui-btn-icon-left ui-btn-b ui-shadow" 
                   data-rel="back" 
                   data-transition="flow">
                    <stripes:label name="cancel" />
                </a>                                
            </div>
        </div>
        <div data-role="popup" 
             id="setmobilephonepie" 
             data-overlay-theme="b" data-theme="a" 
             data-dismissible="false" style="max-width:400px;">
            <div data-role="header" data-theme="a">
                <h1><stripes:label name="label.dialog.setPeriod" /></h1>
            </div>
            <div role="main" class="ui-content">                        
                <stripes:form action="/CommunicationPie.action?mobile">
                    <jsp:include page="/WEB-INF/jsp/common/month_year_select_option.jsp"/>                                      
                </stripes:form>
                <a href="#" 
                   class="ui-btn ui-corner-all ui-icon-forbidden ui-btn-icon-left ui-btn-b ui-shadow" 
                   data-rel="back" 
                   data-transition="flow">
                    <stripes:label name="cancel" />
                </a>                                
            </div>
        </div>
        <div data-role="popup" 
             id="setfixvsmobilepie" 
             data-overlay-theme="b" data-theme="a" 
             data-dismissible="false" style="max-width:400px;">
            <div data-role="header" data-theme="a">
                <h1><stripes:label name="label.dialog.setPeriod" /></h1>
            </div>
            <div role="main" class="ui-content">                        
                <stripes:form action="/CommunicationPie.action">
                    <jsp:include page="/WEB-INF/jsp/common/month_year_select_option.jsp"/>                                      
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
