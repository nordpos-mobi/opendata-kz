<%--
    Document   : present
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Home"
                       pageid="home">

    <stripes:layout-component name="header.title">
       <stripes:label name="label.nordpos.mobi.project" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">
        <sdynattr:link href="/Presentation.action"
                       event="info"
                       class="ui-btn ui-corner-all ui-icon-info ui-btn-icon-left"
                       role="button">
            <stripes:label name="label.info" />
        </sdynattr:link>
    </stripes:layout-component> 

    <stripes:layout-component name="content">
        <div class="ui-body">            
            <a href="http://www.nordpos.mobi">
                <img src="<c:url value='/image/logo.png' />" alt="NORD POS mobi"/>
            </a>            
            <h2><stripes:label name="label.present" /></h2>
        </div>
        <div class="ui-body">
            <stripes:errors />
            <stripes:messages />
            <sdynattr:link href="/DemographicTable.action"
                           class="ui-btn ui-shadow ui-corner-all"
                           data-transition="slide">                
                <stripes:label name="label.DemographicIndicator" />
            </sdynattr:link>
            <sdynattr:link href="/CommunicationMenu.action"
                           class="ui-btn ui-shadow ui-corner-all"
                           data-transition="slide">                
                <stripes:label name="label.CommunicationIndicator" />
            </sdynattr:link>
        </div>
    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>
