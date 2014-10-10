<%--
    Document   : product_view
    Author     : Andrey Svininykh (svininykh@gmail.com)
    Copyright  : Nord Trading Network
    License    : Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0.html)
--%>

<%@include file="/WEB-INF/jsp/common/taglibs.jsp"%>
<stripes:layout-render name="/WEB-INF/jsp/common/layout_main.jsp"
                       title="Demographic Indicator"
                       pageid="DemographicIndicator">

    <stripes:layout-component name="button.return">
        <sdynattr:link href="/Presentation.action"
                       class="ui-btn ui-corner-all ui-icon-home ui-btn-icon-notext">
            <stripes:label name="label.home" />
        </sdynattr:link>            
        <sdynattr:link href="/DemographicTable.action"
                       data-role="button"
                       data-icon="table">
            <stripes:label name="label.table" />
        </sdynattr:link>         
    </stripes:layout-component>

    <stripes:layout-component name="header.title">
        <stripes:label name="label.DemographicIndicator.plot" />
    </stripes:layout-component>

    <stripes:layout-component name="button.action">
    </stripes:layout-component>

    <stripes:layout-component name="content">
        <stripes:errors />
        <stripes:messages />
        <h2><stripes:label name="label.plot.BirthrateByYears" /></h2>
        <script type="text/javascript">
            $(document).ready(function () {
                var data = ${actionBean.dataBirthrate};
                $.plot('#placeholder', [{
                        data: data,
                        bars: {show: true}
                    }]);
            });
        </script>
        <div id="placeholder" style="width:512px;height:256px"></div>
    </stripes:layout-component>

    <stripes:layout-component name="footer">

    </stripes:layout-component>
</stripes:layout-render>
